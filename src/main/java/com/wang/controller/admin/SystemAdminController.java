package com.wang.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wang.controller.BaseController;
import com.wang.model.IndexCategory;
import com.wang.service.IIndexCategoryService;
import com.wang.service.IItemCategoryService;
import com.wang.service.IItemService;
import com.wang.service.IOrdersService;
import com.wang.service.IUserAddrService;
import com.wang.service.IUserService;
import com.wang.service.IUserShopService;

/**
 * 后台系统设置控制器
 * @author wang926454
 *
 */
@Controller
@RequestMapping("/admin")
public class SystemAdminController extends BaseController {
	
	private final IUserService userService;
	private final IUserShopService userShopService;
	private final IUserAddrService userAddrService;
	private final IItemService itemService;
	private final IItemCategoryService itemCategoryService;
	private final IOrdersService ordersService;
	private final IIndexCategoryService indexCategoryService;

    @Autowired
    public SystemAdminController(IUserService userService, IItemService itemService, IUserAddrService userAddrService,
    		IUserShopService userShopService, IOrdersService ordersService,
    		IItemCategoryService itemCategoryService,
    		IIndexCategoryService indexCategoryService) {
        this.userService = userService;
        this.itemService = itemService;
        this.userAddrService = userAddrService;
        this.userShopService = userShopService;
        this.ordersService = ordersService;
        this.itemCategoryService = itemCategoryService;
        this.indexCategoryService = indexCategoryService;
    }
    
    /**
     * 系统设置的主页分类设置界面映射
     * @param model
     * @param request
     * @return
     */
    @RequiresPermissions(value={"system:indexCategory"}, logical= Logical.OR)
    @RequestMapping("/system/indexCategory")
	public String indexCategory(Model model, HttpServletRequest request) {
    	List<IndexCategory> indexCategorys = indexCategoryService.findItemCategoryList();
    	model.addAttribute("indexCategorys", indexCategorys);
    	return "admin/system/indexCategory";
	}
    
    /**
     * 主页分类保存，一共12个
     * @param itemCategory_ids
     * @param request
     * @return
     */
    @RequiresPermissions(value={"system:indexCategory"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/system/indexCategorySave")
	public Object indexCategorySave(
			@RequestParam("itemCategory_id")Long[] itemCategory_ids, 
			HttpServletRequest request) {
    	IndexCategory indexCategory = new IndexCategory();
    	for(int i=0;i<itemCategory_ids.length;i++){
    		Long l = new Long((long)i); // int转换Long
    		Long j = new Long((long)itemCategory_ids[i]); // int转换Long
    		if(j == 0){
    			if(indexCategoryService.findIndexCategory(l+1).getItemCategory_id() == null){
    				continue;
        		}else{
            		indexCategoryService.updateItemcategory_id(l+1);
        		}
			}else{
				indexCategory.setId(l+1); // 从1开始
        		indexCategory.setItemCategory_id(j);
        		indexCategoryService.updateById(indexCategory);
			}
    		//System.out.println(itemCategory_ids[i]);
    	}
    	// 更新前台
    	List<IndexCategory> indexCategorysApplication = indexCategoryService.findIndexCategoryList();
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("indexCategorysApplication", indexCategorysApplication);
    	return renderSuccess("更新成功");
	}
}
