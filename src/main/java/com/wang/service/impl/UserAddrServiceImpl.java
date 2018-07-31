package com.wang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.UserAddrMapper;
import com.wang.model.UserAddr;
import com.wang.service.IUserAddrService;

/**
 * 用户收货地址
 * @author wang926454
 */
@Service
public class UserAddrServiceImpl extends ServiceImpl<UserAddrMapper, UserAddr> implements IUserAddrService {
	
	@Autowired
	private UserAddrMapper userAddrMapper;

	@Override
	public Boolean updateUserAddrDefault(Long id) {
		// TODO Auto-generated method stub
		List<UserAddr> userAddrOlds = userAddrMapper.selectList(
		        new EntityWrapper<UserAddr>().eq("defaults", 1));
		if(userAddrOlds.size() == 1){
			UserAddr userAddrOld = userAddrOlds.get(0);
			userAddrOld.setDefaults(0);
			userAddrMapper.updateById(userAddrOld);
		}
		UserAddr userAddr = userAddrMapper.selectById(id);
		userAddr.setDefaults(1);
		userAddrMapper.updateById(userAddr);
		return true;
	}
	
}
