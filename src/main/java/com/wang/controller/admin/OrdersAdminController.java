package com.wang.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;
import com.wang.controller.BaseController;
import com.wang.model.Orders;
import com.wang.service.IItemService;
import com.wang.service.IOrdersService;
import com.wang.service.IUserAddrService;
import com.wang.service.IUserService;
import com.wang.service.IUserShopService;

/**
 * 后台订单控制器
 * @author wang926454
 *
 */
@Controller
@RequestMapping("/admin")
public class OrdersAdminController extends BaseController {
	
	private final IUserService userService;
	private final IUserShopService userShopService;
	private final IUserAddrService userAddrService;
	private final IItemService itemService;
	private final IOrdersService ordersService;

    @Autowired
    public OrdersAdminController(IUserService userService, IItemService itemService, IUserAddrService userAddrService,
    		IUserShopService userShopService, IOrdersService ordersService) {
        this.userService = userService;
        this.itemService = itemService;
        this.userAddrService = userAddrService;
        this.userShopService = userShopService;
        this.ordersService = ordersService;
    }
    
    /**
     * 后台付款确认（未付款）订单界面映射
     * @param model
     * @param request
     * @return
     */
    @RequiresPermissions(value={"order:payList"}, logical= Logical.OR)
    @RequestMapping("/order/payList")
	public String orderPayList(Model model, HttpServletRequest request) {
		return "admin/order/orderPayList";
	}
    
    /**
     * 后台付款完成（已付款）订单界面映射
     * @param model
     * @param request
     * @return
     */
    @RequiresPermissions(value={"order:courierList"}, logical= Logical.OR)
    @RequestMapping("/order/courierList")
	public String orderCourierList(Model model, HttpServletRequest request) {
		return "admin/order/orderCourierList";
	}
    
    /**
     * 后台订单界面数据AJAX获取
     * @param pageNumber
     * @param pageSize
     * @param state 订单状态，用来查询条件查询那个订单列表
     * @return
     */
    @RequiresPermissions(value={"order:payList","order:courierList"}, logical= Logical.OR)
    @ResponseBody
	@RequestMapping("/order/getList")
    public Object getOrderList(String pageNumber, String pageSize, String state) {
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
        Map mapSelect = new HashMap(16);
        //查询订单状态 1未付款 2已付款
        mapSelect.put("state", state);
        Page<Orders> selectPage = ordersService.findOrdersListAdmin(
        		new Page<Orders>(page_Num, page_Size), mapSelect);
        //bootstrap-table要求服务器返回的json须包含：total，rows，用rows一直接收不到，改成data好了。。。
        Map<String, Object> map = new HashMap<String, Object>(16);
        map.put("total", selectPage.getTotal());
        map.put("data", selectPage.getRecords());
        return map;
    }
    
    /**
     * 后台AJAX确认收款按钮
     * @param id
     * @return
     */
    @RequiresPermissions(value={"order:setPay"}, logical= Logical.OR)
	@ResponseBody
    @RequestMapping("/order/setPay")
    public Object setOrderPay(Long id) {
        Orders order = new Orders();
        order.setId(id);
        order.setState(2);
        return ordersService.updateById(order) ? renderSuccess("修改成功") : renderError("修改失败");
    }
}
