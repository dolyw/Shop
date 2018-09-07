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
 */
@Service
public class UserShopServiceImpl extends ServiceImpl<UserShopMapper, UserShop> implements IUserShopService {

	@Autowired
	private UserShopMapper userShopMapper;

	@Override
	public List<UserShop> findUserShopList(Map map) {
		return userShopMapper.findUserShopList(map);
	}

	@Override
	public String findUserShopTotalByUserId(Long userId) {
		return userShopMapper.findUserShopTotalByUserId(userId);
	}
	
}
