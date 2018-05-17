package com.wang.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.RoleMapper;
import com.wang.model.Role;
import com.wang.service.IRoleService;

/**
 * 角色
 * @author wang926454
 *
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public Page<Role> findRoleListByUser(Page<Role> page, Map map) {
		// 不进行 count sql 优化，解决 MP 无法自动优化 SQL 问题
	    // page.setOptimizeCountSql(false);
	    // 不查询总记录数
	    // page.setSearchCount(false);
	    return page.setRecords(roleMapper.findRoleListByUser(page, map));
	}
	

}
