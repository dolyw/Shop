package com.wang.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.wang.model.UserShop;

public interface IUserShopService extends IService<UserShop>{
	
	public List<UserShop> findUserShopList(Map map);
	
	public String findUserShopTotalByUserId(Long user_id);
}
