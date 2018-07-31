package com.wang.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wang.model.Orders;

/**
 * 订单
 * @author wang926454
 */
public interface OrdersMapper extends BaseMapper<Orders>{
	/**
	 * 前端查询订单
	 * @param page
	 * @param map
	 * @return
	 */
	List<Orders> findOrdersList(Pagination page, Map map);
	
	/**
	 * 后台查询订单
	 * @param page
	 * @param map
	 * @return
	 */
	List<Orders> findOrdersListAdmin(Pagination page, Map map);
}
