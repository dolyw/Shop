package com.wang.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wang.controller.BaseController;
import com.wang.model.ItemCategory;
import com.wang.model.ItemCategoryDetail;
import com.wang.service.IItemCategoryDetailService;
import com.wang.service.IItemCategoryService;
import com.wang.service.IItemDetailService;
import com.wang.service.IItemService;

/**
 * 后台商品分类控制器
 * @author wang926454
 *
 */
@Controller
@RequestMapping("/admin")
public class ItemCategoryAdminController extends BaseController {
	
	private final IItemService itemService;
	private final IItemDetailService itemDetailService;
	private final IItemCategoryService itemCategoryService;
	private final IItemCategoryDetailService itemCategoryDetailService;
	
    @Autowired
    public ItemCategoryAdminController(IItemService itemService, IItemCategoryService itemCategoryService, 
    		IItemCategoryDetailService itemCategoryDetailService, IItemDetailService itemDetailService) {
        this.itemService = itemService;
        this.itemCategoryService = itemCategoryService;
        this.itemCategoryDetailService = itemCategoryDetailService;
        this.itemDetailService = itemDetailService;
    }
    
    /**
     * 后台商品分类页面映射
     * @return
     */
    @RequiresPermissions(value={"itemCategory:list"}, logical= Logical.OR)
    @RequestMapping("/itemCategory/list")
	public String itemCategoryList() {
		return "admin/item/itemCategoryList";
	}
    
    /**
     * 后台AJAX分页获取商品分类列表
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @RequiresPermissions(value={"itemCategory:list"}, logical= Logical.OR)
    @ResponseBody
	@RequestMapping("/itemCategory/getList")
    public Object getItemCategoryList(String pageNumber, String pageSize) {
        if(StringUtils.isBlank(pageNumber)){
            pageNumber = "1";
        }
        if(StringUtils.isBlank(pageSize))
        {
        	pageSize = "10";
        }
        //分页 pageNumber--》页数    pageSize--》每页显示数据的条数
        Page<ItemCategory> selectPage = itemCategoryService.findItemCategoryListWrapper(
        		new Page<ItemCategory>(Integer.parseInt(pageNumber), Integer.parseInt(pageSize)),
        		new EntityWrapper<ItemCategory>().where("1={0}", "1").orderBy("addtime desc"));
        //bootstrap-table要求服务器返回的json须包含：total，rows，用rows一直接收不到，改成data好了。。。
        Map<String, Object> map = new HashMap<String, Object>(16);
        map.put("total", selectPage.getTotal());
        map.put("data", selectPage.getRecords());
        
        return map;
    }
    
    /**
     * 后台商品分类添加或更新，判断是否存在ID，有就更新，没有就添加
     * @param itemCategory
     * @return
     */
    @RequiresPermissions(value={"itemCategory:save"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/itemCategory/save")
    public Object itemCategorySave(ItemCategory itemCategory) {
        if (itemCategory.getId() == null) {
        	itemCategory.setAddtime(new Date());
            return itemCategoryService.insert(itemCategory) ? renderSuccess("添加成功") : renderError("添加失败");
        } else {
            return itemCategoryService.updateById(itemCategory) ? renderSuccess("修改成功") : renderError("修改失败");
        }
    }
    
    /**
     * 后台商品分类AJAX获取当前商品分类的参数
     * @return
     */
    @RequiresPermissions(value={"itemCategory:save"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/itemCategory/edit")
    public Object itemCategoryEdit(Model model, @RequestParam(value = "id", required = false) Long id) {
    	Page<ItemCategory> page = new Page<ItemCategory>(1, 3);
    	Map map = new HashMap(16);
    	map.put("id", id);
    	return renderSuccess(itemCategoryService.findItemCategoryList(page, map).getRecords().get(0));
    }
    
    /**
     * 后台商品分类删除
     * @param id
     * @return
     */
    @RequiresPermissions(value={"itemCategory:delete"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/itemCategory/delete")
    public Object itemCategoryDelete(@RequestParam(value = "id", required = false) Long id) {
        return itemCategoryService.deleteById(id) ? renderSuccess("删除成功") : renderError("删除失败");
    }
    
    /**
     * 后台商品详细分类页面映射
     * @return
     */
    @RequiresPermissions(value={"itemCategoryDetail:list"}, logical= Logical.OR)
    @RequestMapping("/itemCategoryDetail/list")
	public String itemCategoryDetailList() {
		return "admin/item/itemCategoryDetailList";
	}
    
    /**
     * 后台AJAX分页获取商品详细分类列表
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @RequiresPermissions(value={"itemCategoryDetail:list"}, logical= Logical.OR)
    @ResponseBody
	@RequestMapping("/itemCategoryDetail/getList")
    public Object getItemCategoryDetailList(String pageNumber, String pageSize) {
        if(StringUtils.isBlank(pageNumber)){
            pageNumber = "1";
        }
        if(StringUtils.isBlank(pageSize))
        {
        	pageSize = "10";
        }
        //分页 pageNumber--》页数    pageSize--》每页显示数据的条数
        Page<ItemCategoryDetail> selectPage = itemCategoryDetailService.findItemCategoryDetailList(
        		new Page<ItemCategoryDetail>(Integer.parseInt(pageNumber), Integer.parseInt(pageSize)), null);
        //bootstrap-table要求服务器返回的json须包含：total，rows，用rows一直接收不到，改成data好了。。。
        Map<String, Object> map = new HashMap<String, Object>(16);
        map.put("total", selectPage.getTotal());
        map.put("data", selectPage.getRecords());
        return map;
    }
    
    /**
     * 后台商品详细分类添加或更新，判断是否存在ID，有就更新，没有就添加
     * @param itemCategoryDetail
     * @return
     */
    @RequiresPermissions(value={"itemCategoryDetail:save"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/itemCategoryDetail/save")
    public Object itemCategoryDetailSave(ItemCategoryDetail itemCategoryDetail) {
        if (itemCategoryDetail.getId() == null) {
        	itemCategoryDetail.setAddtime(new Date());
            return itemCategoryDetailService.insert(itemCategoryDetail) ? renderSuccess("添加成功") : renderError("添加失败");
        } else {
            return itemCategoryDetailService.updateById(itemCategoryDetail) ? renderSuccess("修改成功") : renderError("修改失败");
        }
    }
    
    /**
     * 后台AJAX商品分类获取当前商品详细分类的参数
     * @param model
     * @param id
     * @return
     */
    @RequiresPermissions(value={"itemCategoryDetail:save"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/itemCategoryDetail/edit")
    public Object itemCategoryDetailEdit(Model model, @RequestParam(value = "id", required = false) Long id) {
    	Map map = new HashMap(16);
    	map.put("id", id);
    	return renderSuccess(itemCategoryDetailService.findItemCategoryDetailList(
    			new Page<ItemCategoryDetail>(1, 3), map).getRecords().get(0));
    }
    
    /**
     * 后台AJAX商品分类获取所有商品分类到 商品详细添加界面
     * @return
     */
    @RequiresPermissions(value={"itemCategoryDetail:save"}, logical= Logical.OR)
    @ResponseBody
	@RequestMapping("/itemCategoryDetail/getItemCategoryList")
    public Object getItemCategoryListJson() {
        List<ItemCategory> itemCategorys = itemCategoryService.findItemCategoryList(
        		new Page<ItemCategory>(1, 100), null).getRecords();
        return renderSuccess(itemCategorys);
    }
    
    /**
     * 后台商品详细分类删除
     * @param id
     * @return
     */
    @RequiresPermissions(value={"itemCategoryDetail:delete"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/itemCategoryDetail/delete")
    public Object itemCategoryDetailDelete(@RequestParam(value = "id", required = false) Long id) {
        return itemCategoryDetailService.deleteById(id) ? renderSuccess("删除成功") : renderError("删除失败");
    }
    
}
