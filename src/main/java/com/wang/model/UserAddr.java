package com.wang.model;

import java.util.Date;

/**
 * 收获地址
 * @author MyPC
 *
 */
public class UserAddr extends SuperEntity {
	private String addr;
	private Date addtime;
	private String name;
	private String phone;
	private int defaults;
	private Long user_id;
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getDefaults() {
		return defaults;
	}
	public void setDefaults(int defaults) {
		this.defaults = defaults;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
}
