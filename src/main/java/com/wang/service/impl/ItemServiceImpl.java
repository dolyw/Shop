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
 * @author MyPC
 */
@Service
public class ItemServiceImpl extends ServiceImpl<ItemMapper, Item> implements IItemService {
	
	@Autowired
	private ItemMapper itemMapper;
	
	@Autowired
	private ItemDetailMapper itemDetailMapper;

	@Override
	public Page<Item> findItemList(Page<Item> page, Map map) {
	    return page.setRecords(itemMapper.findItemList(page, map));
	}

	@Override
	public boolean deleteItem(Long id, Long itemDetailId) {
		itemMapper.deleteById(id);
		itemDetailMapper.deleteById(itemDetailId);
		return true;
	}

	@Override
	public boolean addItem(Item item, ItemDetail itemDetail) {
		itemDetailMapper.insert(itemDetail);
    	item.setItemDetailId(itemDetail.getId());
        itemMapper.insert(item);
		return true;
	}

	@Override
	public boolean updateItem(Item item, ItemDetail itemDetail) {
		itemDetailMapper.updateById(itemDetail);
		itemMapper.updateById(item);
		return true;
	}

	@Override
	public Page<Item> findItemListWrapper(Page<Item> page, Wrapper<Item> wrapper) {
	    return page.setRecords(itemMapper.findItemListWrapper(page, wrapper));
	}
}
