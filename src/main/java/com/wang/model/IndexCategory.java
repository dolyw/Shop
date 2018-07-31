package com.wang.model;

/**
 * 主页分类配置
 * @author wang926454
 */
public class IndexCategory extends SuperEntity {

	private Long itemCategoryId;
	private ItemCategory itemCategory;
	public Long getItemCategoryId() {
		return itemCategoryId;
	}
	public void setItemCategoryId(Long itemCategoryId) {
		this.itemCategoryId = itemCategoryId;
	}
	public ItemCategory getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(ItemCategory itemCategory) {
		this.itemCategory = itemCategory;
	}
}
