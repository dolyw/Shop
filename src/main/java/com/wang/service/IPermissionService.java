package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Permission;

/**
 * 权限
 * @author Wang926454
 * @date 2018/7/30 18:47
 */
public interface IPermissionService extends IService<Permission>{
	/**
	 * null
	 * @param page
	 * @param map
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.Permission>
	 * @author Wang926454
	 * @date 2018/7/30 18:47
	 */
	Page<Permission> findPermissionListByRole(Page<Permission> page, Map map);
}
