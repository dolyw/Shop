package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Role;

/**
 * 角色
 * @author Wang926454
 * @date 2018/7/30 18:47
 */
public interface IRoleService extends IService<Role>{
	/**
	 * null
	 * @param page
	 * @param map
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.Role>
	 * @author Wang926454
	 * @date 2018/7/30 18:48
	 */
	Page<Role> findRoleListByUser(Page<Role> page, Map map);
}
