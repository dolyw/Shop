package com.wang.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.wang.model.IndexCategory;

/**
 * TODO：IIndexCategoryService
 * @author Wang926454
 * @date 2018/7/30 16:54
 */
public interface IIndexCategoryService extends IService<IndexCategory> {
	public List<IndexCategory> findItemCategoryList();
	
	public List<IndexCategory> findIndexCategoryList();
	
	public IndexCategory findIndexCategory(Long id);
	
	public void updateItemcategory_id(Long id);
}
