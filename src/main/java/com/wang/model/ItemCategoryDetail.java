package com.wang.model;

import java.util.Date;

/**
 * 商品详细分类，二类
 * @author MyPC
 */
public class ItemCategoryDetail extends SuperEntity {
	private String name;
	private Date addtime;
	private Long itemCategoryId;
	public Long getItemCategoryId() {
		return itemCategoryId;
	}
	public void setItemCategoryId(Long itemCategoryId) {
		this.itemCategoryId = itemCategoryId;
	}
	private ItemCategory itemCategory;
	public ItemCategory getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(ItemCategory itemCategory) {
		this.itemCategory = itemCategory;
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
