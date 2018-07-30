package com.wang.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wang.model.ItemCategory;

/**
 * TODO：商品分类
 * @author Wang926454
 * @date 2018/7/30 16:59
 */
public interface IItemCategoryService extends IService<ItemCategory>{
	public Page<ItemCategory> findItemCategoryList(Page<ItemCategory> page, Map map);
	
	public Page<ItemCategory> findItemCategoryListWrapper(Page<ItemCategory> page, @Param("ew") Wrapper<ItemCategory> wrapper);
}
