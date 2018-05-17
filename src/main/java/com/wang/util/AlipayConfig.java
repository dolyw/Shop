package com.wang.util;

import java.io.FileWriter;
import java.io.IOException;

/**
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016091000480340";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCjhGlwSjS9YQ02YowO4w02Pax1QidNjagjlycf+JVLUXsrVeVNRyRaeFSf5mOpIMftw6RCVN1ZVl/aXOwv/COm4fr0fAek197HXbPy5D2sPIvQyoZoKpPT4tGp9jHRGyw0bBu2GJH/r9LX/NynIPGHu4BAGxEVrDHkz18WWmm39JGGxfT1DDpTUR5ayS0v3+HbMZnATitwxMi8U11yuvp8FARMoqi7G4zInQiccEspZjq4VPgc1QZPgFC2T38k/2xSigDqD7DUnDmWfYxFwBfHrT362RqQD0cFKlrkgGTM6hWupXKMDiyWDKLIW5I9UrSMrgoh8lXxtJI8VYmBx789AgMBAAECggEBAJ/jD35e8ObkiRjOj4jW9so8z+7wOqIYi3oRiI44cTLuf3NGUCqaD6/uzUB09KohhZy1ml3JwY5jaOKJzeC1uN6rRMnepVLISevDcftktfE+WrBT98zPJTEgLkb0lo2S9kxkEUyjBc9vysirVc6N5d4Et0j3rmL0tuy24JFo4sqdZSxwcKxGUVp1b1V7DdaintLNGwTT8MYboTHpUZ8Wzj+NfZ1wCuI3Ey8EtY1WJ43+mT284RmY3QevLGClhjueCCJHGVjrv1pHPzsZ+Sox5VzlCnslmHJswOX14OjUdKnLPq1z7ssrLBIXXqwaJQF/icd1wX3wPspPKmlcbZ2WQ/kCgYEA5QbYE6LJiq5gnoheARSJ2BxiuCyfXu0SYByFCGfz5Xf/wL+0gkf8OHAx2j5vfoVtB4J8W3LA90i/7xRV0tnJh48Hg04tsFVXkS/i9YKDUyz7hVya49joIgcrCxPJI5MJyoRXMB7rh7I7On93RdCLf5t5f1g1pd5P6NhR/4ww+wcCgYEAtsZ01rtm3YCfcakR7/YJvO0TvuK2tdjn94PW+p7NY395XqHRH0IEeGUTK+4dm133berzGkkXPHIsTIItKd1FM/cJ7TfER2f7zyI/IxQEg4pcjYM6tTWT/+7MNK3iDMvXbE/fAk/ii5ba1xjMUydaWWM0fYrPjHidnim3l6E3rpsCgYAbU/G8hhQeZChLQmJVJqo8C0cMSubJYOhsZ3rIQf8sRmFSEo3rbcN+yIRqUkDji/AykTNdhhfYaendEUQcYLhXYI248T8qZ0SHonsmaGhbKGbqxt4EigFI7ioIrFe30ve8HoZ4y3e3PWEr3cHRpsy+cULSGyhrnldSpV1DbOr7SQKBgAPbZkXNyJruBu9YGQfOUmBJRHxnvmFSBXskrhm11jG+U+paUdZuBzgfMetgaAGKVxlbtuucFUByTFsE+D0E7VvuX6hA4AR9vkOdvmVYG8xG1DMsTMXcLpZdDLQj4zxP5OjlOpiK5QX7Ff0qCc3La82tGUN49W5KcVEQIk6x2UH3AoGBANKeExet3wc31mriBkI5YL5t9cnGM3CAycmziM7/kS2/Ubuz66ZckJl0dYOjI703xXWFNtW4VW7auQtvChKLZHGLgfnwZ9+MKCuPgZf0sAGzIxmuPvwQ/q+gCyi7zdlvu5Ysry6KS82YsvIYB2tFLphgKjkDxg3rpWsbNNVICPEk";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2XcGI+DDeQ1HUmMsCfS/6GHU1Np32Fejdy+PK9iICNCCLuuviOZ68yagk/NgUMAZIvkf+eny08ntA6bwv83tR86pvnE4F4E/tk2xP5Gf54h2Y5J46Q5jlb3YjjYlBj2hE/JZaiHuXVdkXUsETY2oZRXhTzcPlNn3uzJJqqigr009YVWmWhLMfppKb8A+yikgNkyl+ok6hJ+P/0sztzmthFftzhugwk3E2iG441zFcui4D/XsFOeoQBQAFY0fIyNUL5bzRNTQYPdiowm638N28n1NlsjNig32cwLegHnujcDmdwIxjOzZpUQ87Ew2y1Va0WZibc2PtGRe3kEY7HFN0wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/shop/notify_url";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/shop/return_url";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

