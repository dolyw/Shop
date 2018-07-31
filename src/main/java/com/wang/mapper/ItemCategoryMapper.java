package com.wang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wang.model.ItemCategory;

/**
 * 商品大类，一类
 * @author MyPC
 */
public interface ItemCategoryMapper extends BaseMapper<ItemCategory>{
	/**
	 * 查询商品分类列表
	 * @param page
	 * @param map
	 * @return
	 */
	List<ItemCategory> findItemCategoryList(Pagination page, Map map);
	/**
	 * 查询商品分类列表，将map替换为条件构造器
	 * @param page
	 * @param wrapper
	 * @return
	 */
	List<ItemCategory> findItemCategoryListWrapper(Pagination page, @Param("ew") Wrapper<ItemCategory> wrapper); // 条件构造器
}
