package com.wang.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 随机数工具类
 * @author Wang926454
 *
 */
public class RandomUtil {

	private static Random RAND = new Random();
	
	/**
	 * 获取订单号，日期加上3位随机数
	 * @return
	 */
    public static String getRandom(){
    	Date date = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");  
        String dateNowStr = sdf.format(date);
        int random = RAND.nextInt(900) + 100;
    	return dateNowStr + random;
    }
    
    /**
     * 获取短信验证码，4位随机数
     * @return
     */
    public static String getCheckCode(){
        int random = RAND.nextInt(9000) + 1000;
    	return random + "";
    }
    
    /**
     * 上传文件名获取，日期加8位UUID
     * @return
     */
    public static String getPicName(){
    	Date date = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");  
        String dateNowStr = sdf.format(date);
        String random = getUUID();
    	return dateNowStr + random.substring(random.length() - 8);
    }
    
    /**
	 * 生成UUID随机ID
	 * @return
	 */
	public static String getUUID(){ 
		UUID uuid = UUID.randomUUID();
        String str = uuid.toString(); 
        String uuidStr = str.replace("-", "");
        return uuidStr;
    }
}
