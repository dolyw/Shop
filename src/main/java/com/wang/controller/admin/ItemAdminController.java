package com.wang.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baomidou.mybatisplus.plugins.Page;
import com.wang.controller.BaseController;
import com.wang.model.Item;
import com.wang.model.ItemCategoryDetail;
import com.wang.model.ItemDetail;
import com.wang.service.IItemCategoryDetailService;
import com.wang.service.IItemCategoryService;
import com.wang.service.IItemDetailService;
import com.wang.service.IItemService;
import com.wang.util.FileUtil;
import com.wang.util.PropertiesUtil;
import com.wang.util.RandomUtil;

/**
 * 后台商品控制器
 * @author wang926454
 *
 */
@Controller
@RequestMapping("/admin")
public class ItemAdminController extends BaseController {
	
	private final IItemService itemService;
	private final IItemDetailService itemDetailService;
	private final IItemCategoryService itemCategoryService;
	private final IItemCategoryDetailService itemCategoryDetailService;
	
    @Autowired
    public ItemAdminController(IItemService itemService, IItemCategoryService itemCategoryService, 
    		IItemCategoryDetailService itemCategoryDetailService, IItemDetailService itemDetailService) {
        this.itemService = itemService;
        this.itemCategoryService = itemCategoryService;
        this.itemCategoryDetailService = itemCategoryDetailService;
        this.itemDetailService = itemDetailService;
    }
    
    /**
     * 后台商品列表页面映射
     * @return
     */
    @RequiresPermissions(value={"item:list"}, logical= Logical.OR)
    @RequestMapping("/item/list")
	public String itemList() {
		return "admin/item/itemList";
	}
    
    /**
     * 后台分页获取商品列表
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @RequiresPermissions(value={"item:list"}, logical= Logical.OR)
    @ResponseBody
	@RequestMapping("/item/getList")
    public Object getItemList(String pageNumber, String pageSize) {
        if(!StringUtils.isNotBlank(pageNumber)){
            pageNumber="1";
        }
        if(!StringUtils.isNotBlank(pageSize))
        {
        	pageSize="10";
        }
        //分页 pageNumber--》页数    pageSize--》每页显示数据的条数
        int page_Num = Integer.parseInt(pageNumber);
        int page_Size = Integer.parseInt(pageSize);
        Page<Item> selectPage = itemService.findItemList(
        		new Page<Item>(page_Num, page_Size), null);
        //bootstrap-table要求服务器返回的json须包含：total，rows，用rows一直接收不到，改成data好了。。。
        Map<String, Object> map = new HashMap<String, Object>(16);
        map.put("total", selectPage.getTotal());
        map.put("data", selectPage.getRecords());
        return map;
    }
    
    /**
     * 使用事物，商品和商品详细，要么一起添加或更新，要么不加或不更新，图片处理这块先这样把，判断是否存在ID，有就更新，没有就添加
     * @param item 商品类
     * @param itemDetail 商品详细类
     * @param item_id 商品ID
     * @param itemDetail_id 商品详细ID
     * @param pic 主图
     * @param pic1 图一
     * @param pic2 图二
     * @param pic3 图三
     * @param pic4 图四
     * @param pic5 图五
     * @param request
     * @return
     * @throws IOException 
     */
    @RequiresPermissions(value={"item:save"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/item/save")
    public Object itemSave(Item item, ItemDetail itemDetail, @RequestParam(value = "item_id", required = false) Long item_id
    		, @RequestParam(value = "itemDetail_id", required = false) Long itemDetail_id, MultipartFile pic
    		, MultipartFile pic1, MultipartFile pic2, MultipartFile pic3, MultipartFile pic4, MultipartFile pic5 
    		, HttpServletRequest request) throws IOException {
    	item.setId(item_id);
    	itemDetail.setId(itemDetail_id);
    	
    	//上传图片
    	//上传到相对路径
        String path = request.getSession().getServletContext().getRealPath("static/upload");
    	//动态获取上传的绝对路径
        //PropertiesUtil.readProperties("upload.properties"); // 获取properties配置文件
    	//String path = PropertiesUtil.getProperty("uploadPicUrl"); // 获取路径
    	if(pic.getOriginalFilename() != ""){
    		String newFileName =  RandomUtil.getPicName() + ".jpg";
        	item.setPicture(newFileName);
            //System.out.println(path + newFileName);  
        	File targetFile = new File(path, newFileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();
            }
            // 保存
            pic.transferTo(targetFile);
            // 设置755权限
            FileUtil.changeFolderPermission(targetFile);
    	}
    	if(pic1.getOriginalFilename() != ""){
            String newFileName =  RandomUtil.getPicName() + ".jpg";
        	itemDetail.setPicture1(newFileName);
        	File targetFile = new File(path, newFileName); 
        	//System.out.println(path + newFileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();  
            }
            pic1.transferTo(targetFile);
            FileUtil.changeFolderPermission(targetFile);
    	}
    	if(pic2.getOriginalFilename() != ""){
    		String newFileName =  RandomUtil.getPicName() + ".jpg";
        	itemDetail.setPicture2(newFileName);
        	File targetFile = new File(path, newFileName);  
        	//System.out.println(path + newFileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();  
            } 
            pic2.transferTo(targetFile);
            FileUtil.changeFolderPermission(targetFile);
    	}
    	if(pic3.getOriginalFilename() != ""){
    		String newFileName =  RandomUtil.getPicName() + ".jpg";
        	itemDetail.setPicture3(newFileName);
        	File targetFile = new File(path, newFileName); 
        	//System.out.println(path + newFileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();  
            }
            pic3.transferTo(targetFile);
            FileUtil.changeFolderPermission(targetFile);
    	}
    	if(pic4.getOriginalFilename() != ""){
    		String newFileName =  RandomUtil.getPicName() + ".jpg";
        	itemDetail.setPicture4(newFileName);
        	File targetFile = new File(path, newFileName); 
        	//System.out.println(path + newFileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();
            }
            pic4.transferTo(targetFile);
            FileUtil.changeFolderPermission(targetFile);
    	}
    	if(pic5.getOriginalFilename() != ""){
    		String newFileName =  RandomUtil.getPicName() + ".jpg";
        	itemDetail.setPicture5(newFileName);
        	File targetFile = new File(path, newFileName);  
        	//System.out.println(path + newFileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();
            } 
            pic5.transferTo(targetFile);
            FileUtil.changeFolderPermission(targetFile);
    	}
    	
    	if (item.getId() == null) {
        	item.setAddtime(new Date());
            return itemService.addItem(item, itemDetail) ? renderSuccess("添加成功") : renderError("添加失败");
        } else {
        	
            return itemService.updateItem(item, itemDetail) ? renderSuccess("修改成功") : renderError("修改失败");
        }
    }
    
    /**
     * 使用事物，商品和商品详细，要么一起删，要么不删
     * @param id
     * @param itemDetail_id
     * @return
     */
    @RequiresPermissions(value={"item:delete"}, logical= Logical.OR)
    @ResponseBody
    @RequestMapping("/item/delete")
    public Object itemDelete(@RequestParam(value = "id", required = false) Long id, Long itemDetail_id) {
    	return itemService.deleteItem(id, itemDetail_id) ? renderSuccess("删除成功") : renderError("删除失败");
    }
    
    /**
     * 后台商品编辑界面获取当前商品的各个参数
     * @param model
     * @param id
     * @return
     */
    @RequiresPermissions(value={"item:save"}, logical= Logical.OR)
    @RequestMapping("/item/edit")
    public String itemEdit(Model model, @RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			Map map = new HashMap(16);
			map.put("id", id);
			Item item = itemService.findItemList(new Page<Item>(1, 3), map).getRecords().get(0);
			model.addAttribute("item", item);
        }
		// 获取商品分类
		List<ItemCategoryDetail> itemCategoryDetails = itemCategoryDetailService.findItemCategoryDetailList(
        		new Page<ItemCategoryDetail>(1, 1000), null).getRecords();
		model.addAttribute("itemCategoryDetails", itemCategoryDetails);
		return "admin/item/itemEdit";
    }
    
}
