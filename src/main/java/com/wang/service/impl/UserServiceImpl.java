package com.wang.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.ItemMapper;
import com.wang.mapper.UserMapper;
import com.wang.mapper.UserShopMapper;
import com.wang.model.User;
import com.wang.model.UserShop;
import com.wang.service.IUserService;
import com.wang.util.StringUtil;

/**
 * 用户
 * @author wang926454
 *
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ItemMapper itemMapper;
	@Autowired
	private UserShopMapper userShopMapper;

	public Page<User> findUserList(Page<User> page, Map map) {
		// 不进行 count sql 优化，解决 MP 无法自动优化 SQL 问题
	    // page.setOptimizeCountSql(false);
	    // 不查询总记录数
	    // page.setSearchCount(false);
	    return page.setRecords(userMapper.findUserList(page, map));
	}

	/**
	 * 添加商品到购物车
	 */
	public boolean addUserShop(UserShop userShop) {
		/*int stock = itemMapper.findItemStock(item.getId()) - userShop.getCount();
		if(stock < 0){
			throw new Exception("商品库存为负!");
		}
		item.setStock(stock);
		itemMapper.updateById(item);*/
		
		Map map = new HashMap();
		map.put("user_id", userShop.getUser_id());
		map.put("item_id", userShop.getItem_id());
		List<UserShop> userShops = this.userShopMapper.findUserShopList(map);
		// 判断当前商品有没有存在购物车中，有就加上当前数量，没有就新增
		if(userShops.size() == 0){
			userShopMapper.insert(userShop);
		}else{
			userShop.setId(userShops.get(0).getId());
			int count = userShops.get(0).getCount() + userShop.getCount();
			userShop.setCount(count);
			
			float price = StringUtil.strTofloat(userShops.get(0).getPrice()) + StringUtil.strTofloat(userShop.getPrice());
			userShop.setPrice(String.valueOf(price));
			userShopMapper.updateById(userShop);
		}
		return true;
	}

}
