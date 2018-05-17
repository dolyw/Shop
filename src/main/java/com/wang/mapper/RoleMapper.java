package com.wang.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wang.model.Role;

public interface RoleMapper extends BaseMapper<Role>{
	/**
	 * 根据用户查询角色列表
	 * @param page
	 * @param map
	 * @return
	 */
	List<Role> findRoleListByUser(Pagination page, Map map);
}
