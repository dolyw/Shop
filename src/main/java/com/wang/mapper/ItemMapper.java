package com.wang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wang.model.Item;

/**
 * 商品
 * @author wang926454
 */
public interface ItemMapper extends BaseMapper<Item>{
	/**
	 * 查询商品列表
	 * @param page
	 * @param map
	 * @return
	 */
	List<Item> findItemList(Pagination page, Map map);
	/**
	 * 查询商品列表，将map替换为条件构造器
	 * @param page
	 * @param wrapper
	 * @return
	 */
	List<Item> findItemListWrapper(Pagination page, @Param("ew") Wrapper<Item> wrapper); // 条件构造器
	
	/**
	 * 查询商品库存
	 * @param id
	 * @return
	 */
	int findItemStock(Long id);
}
