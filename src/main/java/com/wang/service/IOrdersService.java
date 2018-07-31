package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Orders;

/**
 * TODO：订单
 * @author Wang926454
 * @date 2018/7/30 18:46
 */
public interface IOrdersService extends IService<Orders>{
	/**
	 * TODO：生成订单
	 * @param orders
	 * @return boolean
	 * @author Wang926454
	 * @date 2018/7/30 18:46
	 */
	public boolean addOrders(Orders orders);
	
	/**
	 * TODO： 
	 * @param page
	 * @param map
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.Orders>
	 * @author Wang926454
	 * @date 2018/7/30 18:46
	 */
	public Page<Orders> findOrdersList(Page<Orders> page, Map map);
	
	/**
	 * TODO： 
	 * @param page
	 * @param map
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.Orders>
	 * @author Wang926454
	 * @date 2018/7/30 18:47
	 */
	public Page<Orders> findOrdersListAdmin(Page<Orders> page, Map map);
}
