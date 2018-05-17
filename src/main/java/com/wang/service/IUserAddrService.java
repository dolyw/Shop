package com.wang.service;

import com.baomidou.mybatisplus.service.IService;
import com.wang.model.UserAddr;

public interface IUserAddrService extends IService<UserAddr>{
	public Boolean updateUserAddrDefault(Long id);
}
