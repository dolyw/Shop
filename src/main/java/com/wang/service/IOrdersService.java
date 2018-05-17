package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Orders;

public interface IOrdersService extends IService<Orders>{
	public boolean addOrders(Orders orders);
	
	public Page<Orders> findOrdersList(Page<Orders> page, Map map);
	
	public Page<Orders> findOrdersListAdmin(Page<Orders> page, Map map);
}
