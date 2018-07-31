package com.wang.model;

import java.util.Date;
import java.util.List;

/**
 * 商品大类，一类
 * @author MyPC
 */
public class ItemCategory extends SuperEntity {
	private String name;
	private Date addtime;
	private List<ItemCategoryDetail> itemCategoryDetails;
	
	public List<ItemCategoryDetail> getItemCategoryDetails() {
		return itemCategoryDetails;
	}
	public void setItemCategoryDetails(List<ItemCategoryDetail> itemCategoryDetails) {
		this.itemCategoryDetails = itemCategoryDetails;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	
}
