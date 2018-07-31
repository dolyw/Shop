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
	 * TODO：查询购物车总价
	 * @param userId
	 * @return java.lang.String
	 * @author Wang926454
	 * @date 2018/7/30 18:51
	 */
	String findUserShopTotalByUserId(Long userId);
}
