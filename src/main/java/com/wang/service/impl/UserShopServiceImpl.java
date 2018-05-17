package com.wang.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.UserShopMapper;
import com.wang.model.UserShop;
import com.wang.service.IUserShopService;

/**
 * 购物车操作
 * @author wang926454
 *
 */
@Service
public class UserShopServiceImpl extends ServiceImpl<UserShopMapper, UserShop> implements IUserShopService {

	@Autowired
	private UserShopMapper userShopMapper;
	
	/**
	 * 查询购物车商品
	 */
	public List<UserShop> findUserShopList(Map map) {
		// TODO Auto-generated method stub
		return userShopMapper.findUserShopList(map);
	}
	
	/**
	 * 查询购物车总价
	 */
	public String findUserShopTotalByUserId(Long user_id) {
		// TODO Auto-generated method stub
		return userShopMapper.findUserShopTotalByUserId(user_id);
	}
	
}
