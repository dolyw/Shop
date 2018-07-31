package com.wang.model;

import java.util.Date;

/**
 * 商品
 * @author wang926454
 */
public class Item extends SuperEntity {
	private String name;
	private String price;
	private String brand;
	private String model;
	private int stock;
	private String picture;
	private Date addtime;
	private ItemCategoryDetail itemCategoryDetail;
	private ItemDetail itemDetail;
	private Long itemDetailId;
	private Long itemCategoryDetailId;
	public Long getItemCategoryDetailId() {
		return itemCategoryDetailId;
	}
	public void setItemCategoryDetailId(Long itemCategoryDetailId) {
		this.itemCategoryDetailId = itemCategoryDetailId;
	}
	public Long getItemDetailId() {
		return itemDetailId;
	}
	public void setItemDetailId(Long itemDetailId) {
		this.itemDetailId = itemDetailId;
	}
	public ItemDetail getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(ItemDetail itemDetail) {
		this.itemDetail = itemDetail;
	}
	public ItemCategoryDetail getItemCategoryDetail() {
		return itemCategoryDetail;
	}
	public void setItemCategoryDetail(ItemCategoryDetail itemCategoryDetail) {
		this.itemCategoryDetail = itemCategoryDetail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
}
