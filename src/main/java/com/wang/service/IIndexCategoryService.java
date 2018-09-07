package com.wang.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.wang.model.IndexCategory;

/**
 * 主页12个分类显示
 * @author Wang926454
 * @date 2018/7/30 16:54
 */
public interface IIndexCategoryService extends IService<IndexCategory> {
	/**
	 * null
	 * @param 
	 * @return java.util.List<com.wang.model.IndexCategory>
	 * @author Wang926454
	 * @date 2018/7/30 18:40
	 */
	public List<IndexCategory> findItemCategoryList();
	
	/**
	 * null
	 * @param 
	 * @return java.util.List<com.wang.model.IndexCategory>
	 * @author Wang926454
	 * @date 2018/7/30 18:41
	 */
	public List<IndexCategory> findIndexCategoryList();
	
	/**
	 * null
	 * @param id
	 * @return com.wang.model.IndexCategory
	 * @author Wang926454
	 * @date 2018/7/30 18:41
	 */
	public IndexCategory findIndexCategory(Long id);
	
	/**
	 * null
	 * @param id
	 * @return void
	 * @author Wang926454
	 * @date 2018/7/30 18:41
	 */
	public void updateItemcategoryId(Long id);
}
