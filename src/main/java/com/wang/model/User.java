package com.wang.model;

import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 用户
 * @author wang926454
 *
 */
@TableName("user")
public class User extends SuperEntity {
	private String account;
	private String password;
	private String username;
	private Date regtime;
	private List<UserAddr> userAddrs;
	private List<Role> roles;

	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public List<UserAddr> getUserAddrs() {
		return userAddrs;
	}
	public void setUserAddrs(List<UserAddr> userAddrs) {
		this.userAddrs = userAddrs;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	
}
