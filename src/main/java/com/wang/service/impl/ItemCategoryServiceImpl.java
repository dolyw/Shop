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

@Service
public class ItemCategoryServiceImpl extends ServiceImpl<ItemCategoryMapper, ItemCategory> implements IItemCategoryService {
	@Autowired
	private ItemCategoryMapper itemCategoryMapper;

	@Override
	public Page<ItemCategory> findItemCategoryList(Page<ItemCategory> page, Map map) {
		// 不进行 count sql 优化，解决 MP 无法自动优化 SQL 问题
	    // page.setOptimizeCountSql(false);
	    // 不查询总记录数
	    // page.setSearchCount(false);
	    return page.setRecords(itemCategoryMapper.findItemCategoryList(page, map));
	}

	@Override
	public Page<ItemCategory> findItemCategoryListWrapper(Page<ItemCategory> page, Wrapper<ItemCategory> wrapper) {
		// TODO Auto-generated method stub
		return page.setRecords(itemCategoryMapper.findItemCategoryListWrapper(page, wrapper));
	}

}
