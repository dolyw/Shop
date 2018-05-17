package com.wang.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wang.model.Orders;
import com.wang.model.User;
import com.wang.model.UserAddr;
import com.wang.model.UserShop;
import com.wang.service.IItemService;
import com.wang.service.IOrdersService;
import com.wang.service.IUserAddrService;
import com.wang.service.IUserService;
import com.wang.service.IUserShopService;
import com.wang.util.AlipayConfig;
import com.wang.util.RandomUtil;

/**
 * 前台订单控制器
 * @author wang926454
 *
 */
@Controller
@RequestMapping("/order")
public class OrdersController extends BaseController {
	
	private final IUserService userService;
	private final IUserShopService userShopService;
	private final IUserAddrService userAddrService;
	private final IItemService itemService;
	private final IOrdersService ordersService;

    @Autowired
    public OrdersController(IUserService userService, IItemService itemService, IUserAddrService userAddrService,
    		IUserShopService userShopService, IOrdersService ordersService) {
        this.userService = userService;
        this.itemService = itemService;
        this.userAddrService = userAddrService;
        this.userShopService = userShopService;
        this.ordersService = ordersService;
    }
    
    /**
     * 获取订单详情，购物车，收货地址
     * @param model
     * @param request
     * @return
     */
    @RequiresUser
    @RequestMapping("/state")
	public String orderState(Model model, HttpServletRequest request) {
    	User user = (User)request.getSession().getAttribute("user");
    	Map map = new HashMap();
		map.put("user_id", user.getId());
		List<UserShop> userShops = this.userShopService.findUserShopList(map);
		if(userShops.size() <= 0){
			return "redirect:/user/shop";
		}
		// 查询收货地址
		List<UserAddr> userAddrs = userAddrService.selectList(
		        new EntityWrapper<UserAddr>().eq("user_id", user.getId())
				);
		model.addAttribute("userAddrs", userAddrs);
		// 查询购物车商品
		model.addAttribute("userShops", userShops);
		model.addAttribute("total", userShopService.findUserShopTotalByUserId(user.getId())); // 获取商品总价
		
		return "front/order/orderState";
	}
    
    /**
     * 生成（提交）订单，事物处理，库存不用删减，新增订单，把购物车移到订单条目下
     * @param model
     * @param orders
     * @param request
     * @return
     * @throws Exception 
     */
    @RequiresUser
    @RequestMapping("/pay")
	public String orderPay(Model model, Orders orders, String useraddr_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	User user = (User)request.getSession().getAttribute("user");
    	orders.setUser_id(user.getId());
    	//设置收获地址
    	UserAddr userAddr = userAddrService.selectById(useraddr_id);
    	orders.setName(userAddr.getName());
    	orders.setPhone(userAddr.getPhone());
    	orders.setAddr(userAddr.getAddr());
    	//订单号生成
    	orders.setNo(RandomUtil.getRandom());
    	orders.setTrade_no(orders.getNo());
    	orders.setState(1); // 设置订单状态
    	orders.setAddtime(new Date());
    	Boolean flag = ordersService.addOrders(orders);
    	if(flag){
    		// 获得初始化的AlipayClient
        	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
            // 设置请求参数
        	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        	alipayRequest.setReturnUrl(AlipayConfig.return_url);
        	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        	
        	//获取参数
        	
        	//商户订单号，商户网站订单系统中唯一订单号，必填
        	String out_trade_no = new String(orders.getNo().getBytes("ISO-8859-1"),"UTF-8");
        	//付款金额，必填
        	String total_amount = new String(orders.getPrice().getBytes("ISO-8859-1"),"UTF-8");
        	//订单名称，必填
        	String subject = new String("Pay".getBytes("ISO-8859-1"),"UTF-8");
        	//商品描述，可空
        	String body = new String("".getBytes("ISO-8859-1"),"UTF-8");
        	
        	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
        			+ "\"total_amount\":\""+ total_amount +"\"," 
        			+ "\"subject\":\""+ subject +"\"," 
        			+ "\"body\":\""+ body +"\"," 
        			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        	
        	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
        	//		+ "\"total_amount\":\""+ total_amount +"\"," 
        	//		+ "\"subject\":\""+ subject +"\"," 
        	//		+ "\"body\":\""+ body +"\"," 
        	//		+ "\"timeout_express\":\"10m\"," 
        	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
            // 请求
        	String result = alipayClient.pageExecute(alipayRequest).getBody();
            // System.out.println(result);
            //AlipayConfig.logResult(result);// 记录支付日志
            response.setContentType("text/html; charset=utf8");
            PrintWriter out = response.getWriter();
            out.print(result);
        	return null;
    	}else{
    		return "redirect:/user/shop";
    	}
	}
    
    @RequiresUser
    @RequestMapping("/directPay")
	public String orderDirectPay(Model model, String no, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map map = new HashMap();
        map.put("no", no);
		List<Orders> ordersList = ordersService.findOrdersListAdmin(
        		new Page<Orders>(1, 3), map).getRecords();
		if(ordersList.size() == 1){
			Orders orders = ordersList.get(0);
			// 获得初始化的AlipayClient
        	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
            // 设置请求参数
        	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        	alipayRequest.setReturnUrl(AlipayConfig.return_url);
        	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        	
        	//获取参数
        	
        	//商户订单号，商户网站订单系统中唯一订单号，必填
        	String out_trade_no = new String(orders.getNo().getBytes("ISO-8859-1"),"UTF-8");
        	//付款金额，必填
        	String total_amount = new String(orders.getPrice().getBytes("ISO-8859-1"),"UTF-8");
        	//订单名称，必填
        	String subject = new String("Pay".getBytes("ISO-8859-1"),"UTF-8");
        	//商品描述，可空
        	String body = new String("".getBytes("ISO-8859-1"),"UTF-8");
        	
        	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
        			+ "\"total_amount\":\""+ total_amount +"\"," 
        			+ "\"subject\":\""+ subject +"\"," 
        			+ "\"body\":\""+ body +"\"," 
        			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        	
        	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
        	//		+ "\"total_amount\":\""+ total_amount +"\"," 
        	//		+ "\"subject\":\""+ subject +"\"," 
        	//		+ "\"body\":\""+ body +"\"," 
        	//		+ "\"timeout_express\":\"10m\"," 
        	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
            // 请求
        	String result = alipayClient.pageExecute(alipayRequest).getBody();
            // System.out.println(result);
            //AlipayConfig.logResult(result);// 记录支付日志
            response.setContentType("text/html; charset=utf8");
            PrintWriter out = response.getWriter();
            out.print(result);
        	return null;
		}else{
			throw new Exception("订单查询失败");
		}
    }
    
    /**
     * 前台用户订单列表
     * @param model
     * @param request
     * @return
     */
    @RequiresUser
    @RequestMapping("/list")
	public String orderList(Model model, String pageNumber, String pageSize, HttpServletRequest request) {
    	User user = (User)request.getSession().getAttribute("user");
    	if(!StringUtils.isNotBlank(pageNumber)){
            pageNumber="1";
        }
        if(!StringUtils.isNotBlank(pageSize))
        {
        	pageSize="10";
        }
        //分页 pageNumber--》页数    pageSize--》每页显示数据的条数
        int page_Num = Integer.parseInt(pageNumber);
        int page_Size = Integer.parseInt(pageSize);
        Map map = new HashMap();
		map.put("user_id", user.getId());
        Page<Orders> selectPage = ordersService.findOrdersList(
        		new Page<Orders>(page_Num, page_Size), map);
        //System.out.println(selectPage.getRecords().get(0).getOrderItems().get(0).getItem());
        model.addAttribute("orders", selectPage.getRecords());
		return "front/order/orderList";
	}
}
