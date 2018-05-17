package com.wang.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wang.model.IndexCategory;

public interface IndexCategoryMapper extends BaseMapper<IndexCategory>{
	/**
	 * 后台系统设置主页分类获取当前设置
	 * @return
	 */
	List<IndexCategory> findItemCategoryList();
	/**
	 * 查询主页分类12项在前台展现出来
	 * @return
	 */
	List<IndexCategory> findIndexCategoryList();
	/**
	 * 查询当前设置项是否为null
	 * @param id
	 * @return
	 */
	IndexCategory findIndexCategory(Long id);
	/**
	 * 更新主页分类为null，不设置
	 * @param id
	 */
	void updateItemcategory_id(Long id);
}
