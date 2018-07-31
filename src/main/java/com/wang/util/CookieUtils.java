package com.wang.util;

import java.util.Arrays;
import java.util.LinkedList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * @Desc Cookies工具类
 * @Author Wang926454
 * @Date 2018/5/15 11:09
 */
public class CookieUtils {

    /**
     * 最大Cookie数
     */
    private static final int COOKIE_MAX_NUM = 3;

    /**
     * 通过CookieName获取Cookie
     * @param name
     * @param cookies
     * @return
     */
	public static Cookie getCookieByName(String name,Cookie[] cookies){
        //传入了一串cookie的值，通过这个name找到
        if(null == cookies){
            return null;
        }else{
            for (Cookie cookie : cookies) {
                //要获取名字进行比对，而不是直接用==表达式来作比较
                if(cookie.getName().equals(name)){
                    return cookie;
                }
            }
            return null;
        }
    }
    
    /**
     * 在cookie中存储商品的Id字符串(1,3,2)，最后用逗号解析出来，用，会出现问题，cookie不能用，改成#
     * @param id
     * @param request
     * @return
     */
    public static String buildCookie(String id, HttpServletRequest request) {
        String historyCookie = null;
        //得到请求中带来的cookie值 
        Cookie[] cookies = request.getCookies(); 
        for (Cookie cookie : cookies) {
            //要获取名字进行比对，而不是直接用==表达式来作比较
    		if ("historyCookie".equals(cookie.getName())){
    			historyCookie = cookie.getValue();
            } 
        }
        //如果为空返回当前商品的id  
        if (historyCookie == null){  
            return id;  
        }
        LinkedList<String> list = new LinkedList<String>( Arrays.asList((historyCookie.split("#"))));
        //对不同的情况进行分析返回id的值  
        if (list.contains(id)){  
            list.remove(id);  
        }else{  
            if (list.size() >= COOKIE_MAX_NUM){
                list.removeLast();  
            }  
        }  
        list.addFirst(id);
        StringBuffer sb = new StringBuffer();  
        for (String sid : list){  
            sb.append(sid + "#");  
        }  
        sb.deleteCharAt(sb.length()-1);
        return sb.toString();  
    }
}