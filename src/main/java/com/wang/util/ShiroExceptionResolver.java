package com.wang.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/** 
 *  
* 类名称：使用异常捕捉解决shiro无法进行无权限页面的跳转 
* 类描述：  
* @author lsq 
* 联系方式：QQ237442461 
* @version 1.0 
 */
/**
 * 添加全局异常捕捉
 * @author wang926454
 * @version 1.1
 */
public class ShiroExceptionResolver implements HandlerExceptionResolver{

    @Override
    public ModelAndView resolveException(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex) {  
        // TODO Auto-generated method stub  
        System.out.println("==============异常开始=============");  
        // 如果是shiro无权操作，因为shiro 在操作auno等一部分不进行转发至无权限url
        if(ex instanceof UnauthorizedException){  
            ModelAndView mv = new ModelAndView("front/message");
            mv.addObject("message", "无权访问");
            return mv;  
        }else if(ex instanceof UnauthenticatedException){
        	ModelAndView mv = new ModelAndView("front/message");
        	mv.addObject("message", "无权访问");
        	return mv;
        }else if(ex instanceof Exception){
            // 全局异常捕捉
            ModelAndView mv = new ModelAndView("front/exception");
            mv.addObject("message", ex.getMessage());
            return mv;  
        }
        ex.printStackTrace();  
        System.out.println("==============异常结束=============");  
        ModelAndView mv = new ModelAndView("error");  
        mv.addObject("exception", ex.toString().replaceAll("\n", "<br/>"));  
        return mv;  
    }  
  
}