package com.wang.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.ItemCategoryDetailMapper;
import com.wang.model.ItemCategoryDetail;
import com.wang.service.IItemCategoryDetailService;

/**
 * 商品详细分类
 * @author wang926454
 */
@Service
public class ItemCategoryDetailServiceImpl extends ServiceImpl<ItemCategoryDetailMapper, ItemCategoryDetail> implements IItemCategoryDetailService {
	
	@Autowired
	private ItemCategoryDetailMapper itemCategoryDetailMapper;

	@Override
	public Page<ItemCategoryDetail> findItemCategoryDetailList(Page<ItemCategoryDetail> page, Map map) {
	    return page.setRecords(itemCategoryDetailMapper.findItemCategoryDetailList(page, map));
	}
}
