package com.wang.model;

/**
 * 主页分类配置
 * @author wang926454
 *
 */
public class IndexCategory extends SuperEntity {

	private Long itemCategory_id;
	private ItemCategory itemCategory;
	public Long getItemCategory_id() {
		return itemCategory_id;
	}
	public void setItemCategory_id(Long itemCategory_id) {
		this.itemCategory_id = itemCategory_id;
	}
	public ItemCategory getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(ItemCategory itemCategory) {
		this.itemCategory = itemCategory;
	}
}
