package com.wang.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.wang.model.IndexCategory;

public interface IIndexCategoryService extends IService<IndexCategory> {
	public List<IndexCategory> findItemCategoryList();
	
	public List<IndexCategory> findIndexCategoryList();
	
	public IndexCategory findIndexCategory(Long id);
	
	public void updateItemcategory_id(Long id);
}
