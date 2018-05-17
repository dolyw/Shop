package com.wang.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.api.internal.util.AlipaySignature;
import com.baomidou.mybatisplus.plugins.Page;
import com.wang.model.Orders;
import com.wang.service.IItemCategoryDetailService;
import com.wang.service.IItemService;
import com.wang.service.IOrdersService;
import com.wang.service.IUserService;
import com.wang.util.AlipayConfig;

/**
 * 支付控制器
 * @author wang926454
 *
 */
@Controller
public class PaysController extends BaseController {
	
	private final IUserService userService;
	private final IItemService itemService;
	private final IOrdersService ordersService;
	private final IItemCategoryDetailService itemCategoryDetailService;

    @Autowired
    public PaysController(IUserService userService, IItemService itemService,
    		IItemCategoryDetailService itemCategoryDetailService,
    		IOrdersService ordersService) {
        this.userService = userService;
        this.itemService = itemService;
        this.itemCategoryDetailService = itemCategoryDetailService;
        this.ordersService = ordersService;
    }
    
    /**
     * 支付宝返回同步通知
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("return_url")
    public String return_url(Model model, HttpServletRequest request)
            throws Exception {
    	//获取支付宝GET过来反馈信息
    	Map<String,String> params = new HashMap<String,String>();
    	Map<String,String[]> requestParams = request.getParameterMap();
    	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
    		String name = (String) iter.next();
    		String[] values = (String[]) requestParams.get(name);
    		String valueStr = "";
    		for (int i = 0; i < values.length; i++) {
    			valueStr = (i == values.length - 1) ? valueStr + values[i]
    					: valueStr + values[i] + ",";
    		}
    		//乱码解决，这段代码在出现乱码时使用
    		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
    		params.put(name, valueStr);
    	}
    	
    	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

    	//——请在这里编写您的程序（以下代码仅作参考）——
    	if(signVerified) {
    		//商户订单号
    		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
    	
    		//支付宝交易号
    		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
    	
    		//付款金额
    		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
    		
    		model.addAttribute("out_trade_no", out_trade_no);
    		model.addAttribute("trade_no", trade_no);
    		model.addAttribute("total_amount", total_amount);

			//注意：
			// 同步本来不应该处理订单状态的，只是用来测试，正常生产环境本段代码应该屏蔽，只交给异步操作
			// 订单处理
			Map map = new HashMap();
			map.put("no", out_trade_no);
			List<Orders> orders = ordersService.findOrdersListAdmin(
					new Page<Orders>(1, 3), map).getRecords();
			if(orders.size() == 1){
				if(total_amount.equals(orders.get(0).getPrice())){
					//System.out.println("total_amount==:" + total_amount);
					Orders order = new Orders();
					order.setId(orders.get(0).getId());
					order.setTrade_no(trade_no);
					order.setState(2);
					order.setCourier(orders.get(0).getCourier());
					order.setPay(orders.get(0).getPay());
					ordersService.updateById(order);
				}
			}else{
				System.out.println("订单查询失败");
				//throw new Exception("订单查询失败");
			}

    		
    		System.out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
    	}else {
    		System.out.println("验签失败");
    	}
    	//——请在这里编写您的程序（以上代码仅作参考）——
        return "front/order/orderPay";
    }
    
    /**
     * 支付宝返回异步通知
     * @param model
     * @param request
     * @throws Exception
     */
    @RequestMapping("notify_url")
    public void notify_url(Model model, HttpServletRequest request)
            throws Exception {
    	//获取支付宝POST过来反馈信息
    	Map<String,String> params = new HashMap<String,String>();
    	Map<String,String[]> requestParams = request.getParameterMap();
    	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
    		String name = (String) iter.next();
    		String[] values = (String[]) requestParams.get(name);
    		String valueStr = "";
    		for (int i = 0; i < values.length; i++) {
    			valueStr = (i == values.length - 1) ? valueStr + values[i]
    					: valueStr + values[i] + ",";
    		}
    		//乱码解决，这段代码在出现乱码时使用
    		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
    		params.put(name, valueStr);
    	}
    	
    	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

    	//——请在这里编写您的程序（以下代码仅作参考）——
    	
    	/* 实际验证过程建议商户务必添加以下校验：
    	1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
    	2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
    	3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
    	4、验证app_id是否为该商户本身。
    	*/
    	if(signVerified) {//验证成功
    		//商户订单号
    		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
    		//付款金额
    		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
    		//商户订单号
    		String seller_id = new String(request.getParameter("seller_id").getBytes("ISO-8859-1"),"UTF-8");
    		//商户订单号
    		//String seller_email = new String(request.getParameter("seller_email").getBytes("ISO-8859-1"),"UTF-8");
    		//商户订单号
    		String app_id = new String(request.getParameter("app_id").getBytes("ISO-8859-1"),"UTF-8");
    		//支付宝交易号
    		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
    		//交易状态
    		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
    		
    		//System.out.println("out_trade_no:" + out_trade_no);
    		//System.out.println("total_amount:" + total_amount);
    		//System.out.println("seller_id:" + seller_id);
    		//System.out.println("seller_email:" + seller_email);
    		//System.out.println("app_id:" + app_id);
    		//System.out.println("trade_no:" + trade_no);
    		//System.out.println("trade_status:" + trade_status);
    		
    		
    		if(trade_status.equals("TRADE_FINISHED")){
    			//判断该笔订单是否在商户网站中已经做过处理
    			//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
    			//如果有做过处理，不执行商户的业务程序
    			
    			//注意：
    			//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
    		}else if (trade_status.equals("TRADE_SUCCESS")){
    			//判断该笔订单是否在商户网站中已经做过处理
    			//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
    			//如果有做过处理，不执行商户的业务程序
    			
    			//注意：
    			//付款完成后，支付宝系统发送该交易状态通知
    			// 订单处理
        		Map map = new HashMap();
                map.put("no", out_trade_no);
        		List<Orders> orders = ordersService.findOrdersListAdmin(
                		new Page<Orders>(1, 3), map).getRecords();
        		if(orders.size() == 1){
        			if(app_id.equals(AlipayConfig.app_id)){
            			//System.out.println("app_id==:" + app_id);
        				if(total_amount.equals(orders.get(0).getPrice())){
                			//System.out.println("total_amount==:" + total_amount);
        					Orders order = new Orders();
                			order.setId(orders.get(0).getId());
                			order.setTrade_no(trade_no);
                            order.setState(2);
                            order.setCourier(orders.get(0).getCourier());
                            order.setPay(orders.get(0).getPay());
                            ordersService.updateById(order);
                		}
            		}       			
        			
        		}else{
        			System.out.println("订单查询失败");
        			//throw new Exception("订单查询失败");
        		}
    		}
    		System.out.println("success");
    		
    	}else {//验证失败
    		System.out.println("fail");
    	
    		//调试用，写文本函数记录程序运行情况是否正常
    		String sWord = AlipaySignature.getSignCheckContentV1(params);
    		//AlipayConfig.logResult(sWord);
    		System.out.println(sWord);
    	}
    	//——请在这里编写您的程序（以上代码仅作参考）——
    	System.out.println("end");
    }
}