package com.wang.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wang.model.ItemCategoryDetail;

/**
 * 商品详细分类，二类
 * @author MyPC
 */
public interface ItemCategoryDetailMapper extends BaseMapper<ItemCategoryDetail>{
	/**
	 * 查询商品分类详细列表
	 * @param page
	 * @param map
	 * @return
	 */
	List<ItemCategoryDetail> findItemCategoryDetailList(Pagination page, Map map);
}
