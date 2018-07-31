package com.wang.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Item;
import com.wang.model.ItemDetail;

/**
 * TODO：商品
 * @author Wang926454
 * @date 2018/7/30 18:44
 */
public interface IItemService extends IService<Item>{
	/**
	 * TODO： 
	 * @param page
	 * @param map
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.Item>
	 * @author Wang926454
	 * @date 2018/7/30 18:44
	 */
	public Page<Item> findItemList(Page<Item> page, Map map);
	
	/**
	 * TODO： 
	 * @param page
	 * @param wrapper
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.Item>
	 * @author Wang926454
	 * @date 2018/7/30 18:44
	 */
	public Page<Item> findItemListWrapper(Page<Item> page, @Param("ew") Wrapper<Item> wrapper);
	
	/**
	 * TODO：商品和商品详细，事物启动，要么一起改动，要么都不变
	 * @param id
	 * @param itemDetailId
	 * @return boolean
	 * @author Wang926454
	 * @date 2018/7/30 18:45
	 */
	public boolean deleteItem(Long id, Long itemDetailId);
	
	/**
	 * TODO：商品和商品详细，事物启动，要么一起改动，要么都不变
	 * @param item
	 * @param itemDetail
	 * @return boolean
	 * @author Wang926454
	 * @date 2018/7/30 18:45
	 */
	public boolean addItem(Item item, ItemDetail itemDetail);
	
	/**
	 * TODO：商品和商品详细，事物启动，要么一起改动，要么都不变
	 * @param item
	 * @param itemDetail
	 * @return boolean
	 * @author Wang926454
	 * @date 2018/7/30 18:46
	 */
	public boolean updateItem(Item item, ItemDetail itemDetail);
}
