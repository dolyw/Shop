package com.wang.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 登录拦截器 已改为Shrio，现在未使用
 * @author Wang926454
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {  
	  
    private List<String> exceptUrls;  
  
    public List<String> getExceptUrls() {
        return exceptUrls;  
    }  
  
    public void setExceptUrls(List<String> exceptUrls) {  
        this.exceptUrls = exceptUrls;  
    }  
  
    //执行action之前来执行  
    @Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws  
            Exception {  
          
        String requestUri = request.getRequestURI();  
        if(requestUri.startsWith(request.getContextPath())){  
            requestUri = requestUri.substring(request.getContextPath().length(), requestUri.length());  
        }  
        //系统根目录  
        if (StringUtils.equals("/",requestUri)) {  
            return true;  
        }  
        //放行exceptUrls中配置的url  
        for (String url:exceptUrls  
             ) {  
            if(url.endsWith("/**")){  
                if (requestUri.startsWith(url.substring(0, url.length() - 3))) {  
                    return true;  
                }  
            } else if (requestUri.startsWith(url)) {  
                return true;  
            }  
        }  
        //其他需要登录后才能进行访问的url  
        //String sessionid = request.getSession().getId();  
        //UserSessionStatus status = SessionManager.getStatus(sessionid);  
  
        //如果没有登录  
        if(null == request.getSession().getAttribute("user")){              
            //返回到登录页面     
        	response.sendRedirect(request.getContextPath() + "/front/message.jsp");
            return false;  
        }else{  
            return true;  
        }  
    }

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}  
}
