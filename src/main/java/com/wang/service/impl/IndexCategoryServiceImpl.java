package com.wang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wang.mapper.IndexCategoryMapper;
import com.wang.model.IndexCategory;
import com.wang.service.IIndexCategoryService;

/**
 * 主页12个分类显示
 * @author wang926454
 *
 */
@Service
public class IndexCategoryServiceImpl extends ServiceImpl<IndexCategoryMapper, IndexCategory> implements IIndexCategoryService {
	
	@Autowired
	private IndexCategoryMapper indexCategoryMapper;
	
	@Override
	public List<IndexCategory> findItemCategoryList() {
		// TODO Auto-generated method stub
		return indexCategoryMapper.findItemCategoryList();
	}

	@Override
	public List<IndexCategory> findIndexCategoryList() {
		// TODO Auto-generated method stub
		return indexCategoryMapper.findIndexCategoryList();
	}

	@Override
	public IndexCategory findIndexCategory(Long id) {
		// TODO Auto-generated method stub
		return indexCategoryMapper.findIndexCategory(id);
	}

	@Override
	public void updateItemcategory_id(Long id) {
		// TODO Auto-generated method stub
		indexCategoryMapper.updateItemcategory_id(id);
	}
}
