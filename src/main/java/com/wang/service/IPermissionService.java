package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Permission;

public interface IPermissionService extends IService<Permission>{
	Page<Permission> findPermissionListByRole(Page<Permission> page, Map map);
}
