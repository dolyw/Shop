package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.ItemCategoryDetail;

public interface IItemCategoryDetailService extends IService<ItemCategoryDetail>{
	public Page<ItemCategoryDetail> findItemCategoryDetailList(Page<ItemCategoryDetail> page, Map map);
}
