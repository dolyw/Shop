package com.wang.service;

import com.baomidou.mybatisplus.service.IService;
import com.wang.model.UserAddr;

/**
 * 用户收货地址
 * @author Wang926454
 * @date 2018/7/30 18:48
 */
public interface IUserAddrService extends IService<UserAddr>{
	/**
	 * 设置默认地址，使用事物，必须先把之前默认设置非默认，再把当前设置默认，必须一起完成，失败就回退
	 * @param id
	 * @return java.lang.Boolean
	 * @author Wang926454
	 * @date 2018/7/30 18:48
	 */
	public Boolean updateUserAddrDefault(Long id);
}
