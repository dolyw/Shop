package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.User;
import com.wang.model.UserShop;

/**
 * 用户
 * @author Wang926454
 * @date 2018/7/30 18:48
 */
public interface IUserService extends IService<User>{

	/**
	 * null
	 * @param page
	 * @param map
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.User>
	 * @author Wang926454
	 * @date 2018/7/30 18:49
	 */
	public Page<User> findUserList(Page<User> page, Map map);
	
	/**
	 * 添加商品到购物车
	 * @param userShop
	 * @return boolean
	 * @author Wang926454
	 * @date 2018/7/30 18:49
	 */
	public boolean addUserShop(UserShop userShop);
}
