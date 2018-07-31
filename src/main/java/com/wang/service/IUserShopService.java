package com.wang.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.wang.model.UserShop;

/**
 * TODO：购物车操作
 * @author Wang926454
 * @date 2018/7/30 18:49
 */
public interface IUserShopService extends IService<UserShop>{
	
	/**
	 * TODO：查询购物车商品
	 * @param map
	 * @return java.util.List<com.wang.model.UserShop>
	 * @author Wang926454
	 * @date 2018/7/30 18:49
	 */
	public List<UserShop> findUserShopList(Map map);
	
	/**
	 * TODO：查询购物车总价
	 * @param userId
	 * @return java.lang.String
	 * @author Wang926454
	 * @date 2018/7/30 18:50
	 */
	public String findUserShopTotalByUserId(Long userId);
}
