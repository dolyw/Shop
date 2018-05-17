package com.wang.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wang.model.UserShop;

/**
 * 购物车操作
 * @author wang926454
 *
 */
public interface UserShopMapper extends BaseMapper<UserShop>{
	/**
	 * 查询购物车商品
	 * @param map
	 * @return
	 */
	List<UserShop> findUserShopList(Map map);
	/**
	 * 查询购物车总价
	 * @param user_id
	 * @return
	 */
	String findUserShopTotalByUserId(Long user_id);
}
