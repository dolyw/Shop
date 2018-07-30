package com.wang.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.ItemDetailMapper;
import com.wang.mapper.ItemMapper;
import com.wang.model.Item;
import com.wang.model.ItemDetail;
import com.wang.service.IItemService;


/**
 * 商品
 * author MyPC
 */
@Service
public class ItemServiceImpl extends ServiceImpl<ItemMapper, Item> implements IItemService {
	
	@Autowired
	private ItemMapper itemMapper;
	
	@Autowired
	private ItemDetailMapper itemDetailMapper;

	@Override
	public Page<Item> findItemList(Page<Item> page, Map map) {
		// 不进行 count sql 优化，解决 MP 无法自动优化 SQL 问题
	    // page.setOptimizeCountSql(false);
	    // 不查询总记录数
	    // page.setSearchCount(false);
	    return page.setRecords(itemMapper.findItemList(page, map));
	}
	
	/**
	 * 商品和商品详细，事物启动，要么一起改动，要么都不变
	 */
	@Override
	public boolean deleteItem(Long id, Long itemDetail_id) {
		itemMapper.deleteById(id);
		itemDetailMapper.deleteById(itemDetail_id);
		return true;
	}
	
	/**
	 * 商品和商品详细，事物启动，要么一起改动，要么都不变
	 */
	@Override
	public boolean addItem(Item item, ItemDetail itemDetail) {
		itemDetailMapper.insert(itemDetail);
    	item.setItemDetail_id(itemDetail.getId());
        itemMapper.insert(item);
		return true;
	}

	/**
	 * 商品和商品详细，事物启动，要么一起改动，要么都不变
	 */
	@Override
	public boolean updateItem(Item item, ItemDetail itemDetail) {
		itemDetailMapper.updateById(itemDetail);
		itemMapper.updateById(item);
		return true;
	}

	@Override
	public Page<Item> findItemListWrapper(Page<Item> page, Wrapper<Item> wrapper) {
		// 不进行 count sql 优化，解决 MP 无法自动优化 SQL 问题
	    // page.setOptimizeCountSql(false);
	    // 不查询总记录数
	    // page.setSearchCount(false);
	    return page.setRecords(itemMapper.findItemListWrapper(page, wrapper));
	}
}
