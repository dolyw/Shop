package com.wang.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.ItemCategoryMapper;
import com.wang.model.ItemCategory;
import com.wang.service.IItemCategoryService;

/**
 * TODO：商品分类
 * @author Wang926454
 * @date 2018/7/30 18:50
 */
@Service
public class ItemCategoryServiceImpl extends ServiceImpl<ItemCategoryMapper, ItemCategory> implements IItemCategoryService {
	@Autowired
	private ItemCategoryMapper itemCategoryMapper;

	@Override
	public Page<ItemCategory> findItemCategoryList(Page<ItemCategory> page, Map map) {
	    return page.setRecords(itemCategoryMapper.findItemCategoryList(page, map));
	}

	@Override
	public Page<ItemCategory> findItemCategoryListWrapper(Page<ItemCategory> page, Wrapper<ItemCategory> wrapper) {
		// TODO Auto-generated method stub
		return page.setRecords(itemCategoryMapper.findItemCategoryListWrapper(page, wrapper));
	}

}
