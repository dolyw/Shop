package com.wang.service;

import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.ItemCategoryDetail;

/**
 * TODO：商品详细分类
 * @author Wang926454
 * @date 2018/7/30 16:54
 */
public interface IItemCategoryDetailService extends IService<ItemCategoryDetail>{
	/**
	 * TODO：
	 * @param page
	 * @param map
	 * @return com.baomidou.mybatisplus.plugins.Page<com.wang.model.ItemCategoryDetail>
	 * @author Wang926454
	 * @date 2018/7/30 18:42
	 */
	public Page<ItemCategoryDetail> findItemCategoryDetailList(Page<ItemCategoryDetail> page, Map map);
}
