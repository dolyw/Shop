package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.User;
import com.wang.model.UserShop;

public interface IUserService extends IService<User>{

	public Page<User> findUserList(Page<User> page, Map map);
	
	public boolean addUserShop(UserShop userShop);
}
