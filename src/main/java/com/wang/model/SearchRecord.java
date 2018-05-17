package com.wang.model;

import java.util.Date;

/**
 * 搜索记录
 * @author MyPC
 *
 */
public class SearchRecord extends SuperEntity {
	private String account;
	private String username;
	private String keyword;
	private String ip;
	private Date searchtime;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getSearchtime() {
		return searchtime;
	}
	public void setSearchtime(Date searchtime) {
		this.searchtime = searchtime;
	}
	
}
