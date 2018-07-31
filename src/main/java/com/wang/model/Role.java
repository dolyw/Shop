package com.wang.model;

import java.util.List;

/**
 * 角色
 * @author wang926454
 */
public class Role extends SuperEntity {
	private String name;
	private List<Permission> permissions;
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
