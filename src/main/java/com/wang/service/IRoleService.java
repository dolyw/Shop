package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Role;

public interface IRoleService extends IService<Role>{
	Page<Role> findRoleListByUser(Page<Role> page, Map map);
}
