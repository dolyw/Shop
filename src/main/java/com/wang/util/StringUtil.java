package com.wang.util;

import java.io.UnsupportedEncodingException;

/**
 * Author: D.Yang, Wang926454
 * Email: koyangslash@gmail.com
 * Date: 16/8/31
 * Time: 下午5:42
 * Describe: String工具类
 * @author Wang926454
 */
public class StringUtil {

	/**
	 * 定义下划线
	 */
	private static final char UNDERLINE = '_';

    /**
     * String为空判断
     *
     * @param str 需判断字符串
     * @return true:为空 false:不为空
     */
    public static boolean isEmpty(String str) {
        return str == null || "".equals(str.trim());
    }

    /**
     * String不为空判断
     *
     * @param str 需判断字符串
     * @return true:不为空 false:为空
     */
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    /**
     * 驼峰转下划线工具
     *
     * @param param 需要转换的字符串
     * @return 转换好的字符串
     */
    public static String camelToUnderline(String param) {
        if (isNotEmpty(param)) {
            int len = param.length();
            StringBuilder sb = new StringBuilder(len);

            for (int i = 0; i < len; ++i) {
                char c = param.charAt(i);
                if (Character.isUpperCase(c)) {
                    sb.append(UNDERLINE);
                    sb.append(Character.toLowerCase(c));
                } else {
                    sb.append(c);
                }
            }

            return sb.toString();
        } else {
            return "";
        }
    }

    /**
     * 下划线转驼峰工具
     *
     * @param param 需要转换的字符串
     * @return 转换好的字符串
     */
    public static String underlineToCamel(String param) {
        if (isNotEmpty(param)) {
            int len = param.length();
            StringBuilder sb = new StringBuilder(len);

            for (int i = 0; i < len; ++i) {
                char c = param.charAt(i);
                if (c == 95) {
                    ++i;
                    if (i < len) {
                        sb.append(Character.toUpperCase(param.charAt(i)));
                    }
                } else {
                    sb.append(c);
                }
            }

            return sb.toString();
        } else {
            return "";
        }
    }


    /**
     * 在字符串两周添加''
     *
     * @param param 字符串
     * @return 处理后的字符串
     */
    public static String addSingleQuotes(String param) {
        return "\'" + param + "\'";
    }
    
    /**
	 * 将String型数据转换为int型数据的方法
	 * @param str
	 * @return
	 */
	public static int strToint(String str)   
	{
		//System.out.println(str);
		if(str==null|| "".equals(str))
		{
			System.out.println("Str转int时Str为空字符串!");
			str="0";
		}
		int i;
		try
		{
			i = Integer.parseInt(str);
		}
		catch(NumberFormatException e)
		{
			i=0;
			System.out.println("Str转int出现异常!");
			e.printStackTrace();
		}
		return i;
	}
	
	/**
	 * 将String型数据转换为float型数据的方法
	 * @param str
	 * @return
	 */
	public static float strTofloat(String str)   
	{
		//System.out.println(str);
		if(str==null|| "".equals(str))
		{
			System.out.println("Str转int时Str为空字符串!");
			str="0";
		}
		float i;
		try
		{
			i = Float.parseFloat(str);
		}
		catch(NumberFormatException e)
		{
			i=0;
			System.out.println("Str转int出现异常!");
			e.printStackTrace();
		}
		return i;
	}
	
	/**
	 * @功能 转换字符串中属于HTML语言中的特殊字符
	 * @参数 str为要转换的字符串
	 * @返回值 String型值
	 */
	public static String replaceIndex(int index,String str,String res){  // 替换指定位置的字符
		  try{
		    str = str.substring(0, index) + res + str.substring(index+1);
		  }
		  catch(StringIndexOutOfBoundsException e){
		    e.printStackTrace();
		  }
		 return str;
	}
	
	public static String changeHTML(String str){
		int i = 0;
		while(i>=0){
		  try{
			  //下面不进行++i的话，i就会一直匹配第一个不会往后匹配
			  i = str.indexOf("<input", i);
			  // 如果最后没匹配到就会返回-1，-1++ = 0，循环条件是i>=0，不进行这个if处理就会死循环
			  if(0 != ++i){
				  str = replaceIndex(i-1,str,"&lt;");
			  }
			  else{
				  break;
			  }
		  }
		  catch(StringIndexOutOfBoundsException e){
		    e.printStackTrace();
		  }
		}
		return str;
	}
	
	/**
	 * @功能 转换字符串中属于HTML语言中的特殊字符
	 * @参数 str为要转换的字符串
	 * @返回值 String型值
	 */
	public static String changeHTML1(String str){
		//String changeStr="";
		// 转换字符串中的'<'符号
		//str = str.replace("<","&lt;");
		str = str.replace("\r\n","<br/>");
		// 转换字符串中的回车换行
		//changeStr=changeStr.replace("\r\n","<br>");
		return str;
	}
	
	/*
	public static String changeHTMLck(String str){  // 截取字符串 去除前3位和后4位 CK编辑器的<p></p>
		return str.substring(3, str.length()-4);
	}
	*/
	
	/**
	 * 进行转码操作的方法
	 * @param str
	 * @return
	 */
	public static String toChinese(String str) {
		if(str == null){
			str="";
		}
		try {
			str = new String(str.getBytes("ISO-8859-1"),"UTF-8");
		}
		catch(UnsupportedEncodingException e) {
			str = "";
			System.out.println("getBytes转码出现问题!");
			e.printStackTrace();
		}
		return str;
	}
}
