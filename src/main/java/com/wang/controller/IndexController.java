package com.wang.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wang.model.IndexCategory;
import com.wang.model.Item;
import com.wang.model.ItemCategory;
import com.wang.model.SearchRecord;
import com.wang.model.User;
import com.wang.service.IIndexCategoryService;
import com.wang.service.IItemCategoryDetailService;
import com.wang.service.IItemCategoryService;
import com.wang.service.IItemService;
import com.wang.service.ISearchRecordService;
import com.wang.service.IUserService;
import com.wang.util.CookieUtils;
import com.wang.util.NetworkUtil;
import com.wang.util.StringUtil;

/**
 * Index控制器
 * @author wang926454
 *
 */
@Controller
public class IndexController extends BaseController {
	
	private final ISearchRecordService searchRecordService;
	private final IItemService itemService;
	private final IUserService userService;
	private final IItemCategoryDetailService itemCategoryDetailService;
	private final IItemCategoryService itemCategoryService;
	private final IIndexCategoryService indexCategoryService;

    @Autowired
    public IndexController(IUserService userService, IItemService itemService,
    		IItemCategoryDetailService itemCategoryDetailService,
    		ISearchRecordService searchRecordService,
    		IItemCategoryService itemCategoryService,
    		IIndexCategoryService indexCategoryService) {
        this.userService = userService;
        this.itemService = itemService;
        this.itemCategoryDetailService = itemCategoryDetailService;
        this.searchRecordService = searchRecordService;
        this.itemCategoryService = itemCategoryService;
        this.indexCategoryService = indexCategoryService;
    }
    
    /**
     * 后台首页，存在session到后台首页，没有session到后台登录界面
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/adminManager")
	public String adminManager(Model model, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null){
			return "admin/login";
		}
		return "admin/index";
	}

	/**
	 * 后台关于
	 */
	@RequiresUser
	@RequestMapping("/adminAbout")
	public String adminAbout() throws Exception{

		return "admin/about";
	}
	
	/**
	 * 无权限跳转页面
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/403")
	public String A403(Model model, HttpServletRequest request) throws Exception{
		return "front/message";
	}
	
	/**
	 * 前台主页
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/index")
	public String index(Model model, HttpServletRequest request) throws Exception{
        // 主页分类存在Application中 // 暂时没有更好的办法
		List<IndexCategory> indexCategorysApplication = indexCategoryService.findIndexCategoryList();
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("indexCategorysApplication", indexCategorysApplication);
		// 分页首页统一获取8条
        // 查询按时间倒序商品
        List<Item> selectPageTimeDesc = itemService.findItemListWrapper(
        		new Page<Item>(1, 8), 
        		new EntityWrapper<Item>().where("1={0}", "1").orderBy("addtime desc")).getRecords();
        // 查询按库存排序商品
        List<Item> selectPageStockAsc = itemService.findItemListWrapper(
        		new Page<Item>(1, 8), 
        		new EntityWrapper<Item>().where("1={0}", "1").orderBy("stock asc")).getRecords();
        model.addAttribute("selectPageTimeDesc", selectPageTimeDesc);
        model.addAttribute("selectPageStockAsc", selectPageStockAsc);
		return "front/index";
	}
	
    /**
     * 前台商品分类界面
     * @return
     */
    @RequestMapping("/itemCategory")
	public String itemCategory(Model model) {
    	List<ItemCategory> itemCategorys = itemCategoryService.findItemCategoryList(
				new Page<ItemCategory>(1, 10000), null).getRecords();
        model.addAttribute("itemCategorys", itemCategorys);
		return "front/item/itemCategory";
	}
    
	/**
     * 前台商品详细界面
     * @return
	 * @throws Exception 
     */
    @RequestMapping("/itemDetail")
	public String itemDetail(Model model, 
			@RequestParam(value = "id", required = true) Long id, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
    	// 从Cookie获取商品浏览记录
    	Cookie[] cookies = request.getCookies();
    	// 创建浏览记录List
    	List<Item> historyItems = new ArrayList<Item>();
    	for (Cookie cookie : cookies) {
            //要获取名字进行比对，而不是直接用==表达式来作比较
    		if (cookie.getName().equals("historyCookie")){  
                String[] historyIds = cookie.getValue().split("#");  
                //得到cookie中存在的id，展现浏览过的商品  
                for (String historyId : historyIds){
                	Map map = new HashMap();
            		map.put("id", historyId);
            		List<Item> items = itemService.findItemList(new Page<Item>(1, 3), map)
            				.getRecords();
            		if(items.size() > 0){
            			historyItems.add(items.get(0));
            		}
                }  
            } 
        }
        //回写cookie。
        String cookieValue = CookieUtils.buildCookie(id.toString(), request);//产生想要的cookie中的值  
        Cookie cookie = new Cookie("historyCookie", cookieValue);  
        cookie.setMaxAge(7*24*60*60);  
        cookie.setPath("/");  
        response.addCookie(cookie);
    	Map map = new HashMap();
		map.put("id", id);
		List<Item> items = itemService.findItemList(new Page<Item>(1, 3), map).getRecords();
		if(items.size() > 0){
			model.addAttribute("item", items.get(0));
			model.addAttribute("itemDetail", items.get(0).getItemDetail());
			model.addAttribute("historyItems", historyItems);
			return "front/item/itemDetail";
		}else{
			throw new Exception("当前商品不存在");
		}
	}
    
    /**
     * 前台商品搜索
     * @return
     */
    @RequestMapping("/itemSearch")
	public String itemSearch(Model model, String key, HttpServletRequest request) {
    	// 从Cookie获取商品浏览记录
    	Cookie[] cookies = request.getCookies();
    	// 创建浏览记录List
    	List<Item> historyItems = new ArrayList<Item>();
    	for (Cookie cookie : cookies) {
            //要获取名字进行比对，而不是直接用==表达式来作比较
    		if (cookie.getName().equals("historyCookie")){  
                String[] historyIds = cookie.getValue().split("\\,");  
                //得到cookie中存在的id，展现浏览过的商品  
                for (String historyId : historyIds){
                	Map map = new HashMap();
            		map.put("id", historyId);
            		List<Item> items = itemService.findItemList(new Page<Item>(1, 3), map)
            				.getRecords();
            		if(items.size() > 0){
            			historyItems.add(items.get(0));
            		}
                }  
            } 
        }
    	
    	// 记录搜索记录 key不为空才会进行保存
    	if(StringUtil.isNotEmpty(key)){
    		HttpSession session = request.getSession();
        	User user = (User)session.getAttribute("user");
        	SearchRecord searchRecord = new SearchRecord();
        	searchRecord.setKeyword(key);
        	searchRecord.setIp(NetworkUtil.getIpAddress(request));
        	searchRecord.setSearchtime(new Date());
        	if(user != null){
        		searchRecord.setAccount(user.getAccount());
        		searchRecord.setUsername(user.getUsername());
        	}
        	this.searchRecordService.insert(searchRecord);
    	}
    	// 查询商品
        Page<Item> selectPage = itemService.findItemListWrapper(
        		new Page<Item>(1, 16), 
        		new EntityWrapper<Item>()
        		.where("1={0}", "1").like("name", key).orderBy("addtime desc"));
        model.addAttribute("items", selectPage.getRecords());
        model.addAttribute("historyItems", historyItems);
		return "front/item/item";
	}
}
