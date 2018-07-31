package com.wang.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wang.model.User;

/**
 * 用户
 * @author wang926454
 */
public interface UserMapper extends BaseMapper<User>{
	/**
	 * 查询所有用户列表
	 * @param page
	 * @param map
	 * @return
	 */
	List<User> findUserList(Pagination page, Map map);
}
