package com.wang.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wang.model.Permission;

public interface PermissionMapper extends BaseMapper<Permission>{
	/**
	 * 根据角色查询权限列表
	 * @param page
	 * @param map
	 * @return
	 */
	List<Permission> findPermissionListByRole(Pagination page, Map map);
}
