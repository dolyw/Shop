package com.wang.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.PermissionMapper;
import com.wang.model.Permission;
import com.wang.service.IPermissionService;

/**
 * 权限
 * @author wang926454
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

	@Autowired
	private PermissionMapper permissionMapper;

	@Override
	public Page<Permission> findPermissionListByRole(Page<Permission> page, Map map) {
	    return page.setRecords(permissionMapper.findPermissionListByRole(page, map));
	}
	
}
