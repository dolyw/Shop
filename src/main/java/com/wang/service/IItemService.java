package com.wang.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.Item;
import com.wang.model.ItemDetail;

public interface IItemService extends IService<Item>{
	public Page<Item> findItemList(Page<Item> page, Map map);
	
	public Page<Item> findItemListWrapper(Page<Item> page, @Param("ew") Wrapper<Item> wrapper);
	
	public boolean deleteItem(Long id, Long itemDetail_id);
	
	public boolean addItem(Item item, ItemDetail itemDetail);
	
	public boolean updateItem(Item item, ItemDetail itemDetail);
}
