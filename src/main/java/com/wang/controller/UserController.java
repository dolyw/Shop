package com.wang.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresGuest;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.exceptions.ClientException;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wang.model.Item;
import com.wang.model.User;
import com.wang.model.UserAddr;
import com.wang.model.UserShop;
import com.wang.service.IItemService;
import com.wang.service.IUserAddrService;
import com.wang.service.IUserService;
import com.wang.service.IUserShopService;
import com.wang.util.AliSmsUtil;

/**
 * 前端用户控制器
 * @author wang926454
 *
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	private final IUserService userService;
	private final IUserAddrService userAddrService;
	private final IItemService itemService;
	private final IUserShopService userShopService;

    @Autowired
    public UserController(IUserService userService, IUserAddrService userAddrService, IItemService itemService,
    		IUserShopService userShopService) {
        this.userService = userService;
        this.userAddrService = userAddrService;
        this.itemService = itemService;
        this.userShopService = userShopService;
    }
	
	/**
	 * 注册
	 * @param user
	 * @param action
	 * @return
	 * @throws Exception 
	 */
    @RequiresGuest
	@ResponseBody
	@RequestMapping("/register")
    public Object register(User user, HttpServletRequest request) throws Exception {
		//System.out.println(user.getAccount());
		Map map = new HashMap(16);
		map.put("account", user.getAccount());
		List<User> users = userService.findUserList(new Page<User>(1, 3), map).getRecords();
		if(users.size() > 0){
			return renderError("该手机号已注册");
		}else if(user.getPassword().length() < 6){
			return renderError("密码不得少于6位");
		}else{
			user.setRegtime(new Date());
			userService.insert(user);
			try{
	            UsernamePasswordToken token = new UsernamePasswordToken(user.getAccount(),
	            		user.getPassword());  
	            Subject currentUser = SecurityUtils.getSubject();  
	            if (!currentUser.isAuthenticated()){
	                // 使用shiro来验证
					// 验证角色和权限
	                currentUser.login(token);
	            }
			}
	        catch(Exception ex){
	        	throw new Exception("注册出现异常，请重试");
	        }
			return renderSuccess("注册成功");
		}
    }
	
    /**
     * 查询用户是否已注册
     * @param user
     * @param request
     * @return
     * @throws Exception
     */
    @RequiresGuest
	@ResponseBody
	@RequestMapping("/existUser")
    public Object existUser(User user, HttpServletRequest request) throws Exception {
		//System.out.println(user.getAccount());
		Map map = new HashMap(16);
		map.put("account", user.getAccount());
		List<User> users = userService.findUserList(new Page<User>(1, 3), map).getRecords();
		if(users.size() > 0){
			return renderError("该手机号已注册");
		}else{
			return renderSuccess("OK");
		}
    }
    
	/**
	 * 获取短信验证码
	 * @param user
	 * @param request
	 * @return
	 * @throws InterruptedException 
	 * @throws ClientException 
	 */
    @RequiresGuest
	@ResponseBody
	@RequestMapping("/getSms")
    public Object getSms(String account) throws ClientException, InterruptedException {
		// 使用短信验证码要自行填写AliSmsUtil配置信息，再打开真实接口
		// 真实接口
		// Map map = AliSmsUtil.smsStatus(account);
		// 测试接口
		Map map = AliSmsUtil.smsStatus();
		return renderSuccess(map);
    }
	
	/**
	 * 登录
	 * @param user
	 * @param action
	 * @param request
	 * @return
	 * @throws IOException 
	 */
    @RequiresGuest
	@ResponseBody
	@RequestMapping("/login")
    public Object login(User user, HttpServletRequest request) throws Exception {
		try{
            UsernamePasswordToken token = new UsernamePasswordToken(user.getAccount(),
            		user.getPassword());  
            Subject currentUser = SecurityUtils.getSubject();  
            if (!currentUser.isAuthenticated()){
                // 使用shiro来验证
				// 记住密码
                //token.setRememberMe(true);
                currentUser.login(token);
				// 验证角色和权限
                return renderSuccess("登录成功");
            } 
        }catch(UnknownAccountException ex){
        	return renderError("该手机号未注册");
        }catch(IncorrectCredentialsException ex){
        	return renderError("密码错误");
        }
		return renderError("密码错误");
    }

	/**
	 * 短信登录
	 * @param user
	 * @param request
	 * @return
	 * @throws IOException 
	 */
    @RequiresGuest
	@ResponseBody
	@RequestMapping("/loginMessage")
    public Object loginMessage(User user, HttpServletRequest request) throws Exception {
		try{
            UsernamePasswordToken token = new UsernamePasswordToken(user.getAccount(),
            		"phone");  
            Subject currentUser = SecurityUtils.getSubject();  
            if (!currentUser.isAuthenticated()){
                // 使用shiro来验证
				// 记住密码
                //token.setRememberMe(true);
                currentUser.login(token);
				// 验证角色和权限
                return renderSuccess("登录成功");
            } 
        }catch(UnknownAccountException ex){
        	return renderError("该手机号未注册");
        }
		return renderError("密码错误");
    }

	/**
	 * 密码修改
	 * @param password
	 * @param request
	 * @return
	 */
    @RequiresUser
	@ResponseBody
	@RequestMapping("/modifyPWD")
    public Object modifyPWD(String password, HttpServletRequest request) {
		User user = new User();
		HttpSession session = request.getSession();
		user.setId(((User)session.getAttribute("user")).getId());
		user.setPassword(password);
		return userService.updateById(user) ? renderSuccess("修改成功") : renderError("修改失败");
    }
	
	/**
	 * 前台用户个人中心
	 * @return
	 */
    @RequiresUser
	@RequestMapping("/user")
	public String user() {
		return "front/user/user";
	}
	
	/**
	 * 前台用户安全中心
	 * @return
	 */
    @RequiresUser
	@RequestMapping("/security")
	public String userSecurity() {
		return "front/user/userSecurity";
	}
	
	/**
	 * 用action判断，有值就说明是用户收货地址表单提交过来的参数，再看ID是否为空，为空就添加，否则更新，action没值就是用户收货地址界面映射
	 * @param model
	 * @param userAddr
	 * @param action
	 * @param request
	 * @param cmbProvince
	 * @param cmbCity
	 * @param cmbArea
	 * @return
	 */
    @RequiresUser
	@RequestMapping("/addr")
	public String userAddr(Model model, UserAddr userAddr, String action, HttpServletRequest request
			, String cmbProvince, String cmbCity, String cmbArea) {
		User user = (User)request.getSession().getAttribute("user");
		if(StringUtils.isNotBlank(action)){
			if (userAddr.getId() == null){
				userAddr.setDefaults(0);
				userAddr.setAddtime(new Date());
				userAddr.setUser_id(user.getId());
				String addrDetail = cmbProvince + "省" + cmbCity + cmbArea + userAddr.getAddr();
				userAddr.setAddr(addrDetail);
				this.userAddrService.insert(userAddr);
			}else{
				String addrDetail = cmbProvince + "省" + cmbCity + cmbArea + userAddr.getAddr();
				userAddr.setAddr(addrDetail);
				this.userAddrService.updateById(userAddr);
			}
		}
		List<UserAddr> userAddrs = userAddrService.selectList(
		        new EntityWrapper<UserAddr>().eq("user_id", user.getId())
				);
		model.addAttribute("userAddrs", userAddrs);
		
		if(action != null && "userState".equals(action)){
			return "redirect:/order/state";
		}else{
			return "front/user/userAddr";
		}
	}
	
	/**
	 * AJAX动态获取当前用户的当前收货地址的参数
	 * @param model
	 * @param id
	 * @return
	 */
    @RequiresUser
	@ResponseBody
    @RequestMapping("/addrEdit")
    public Object userAddrEdit(Model model, @RequestParam(value = "id", required = false) Long id) {
    	return renderSuccess(userAddrService.selectById(id));
    }
	
	/**
	 * 用户收货地址删除
	 * @param id
	 * @return
	 */
    @RequiresUser
	@ResponseBody
    @RequestMapping("/addrDelete")
    public Object userAddrDelete(@RequestParam(value = "id", required = false) Long id) {
        return userAddrService.deleteById(id) ? renderSuccess("删除成功") : renderError("删除失败");
    }
	
	/**
	 * 设置默认收获地址
	 * @param id
	 * @return
	 */
    @RequiresUser
	@ResponseBody
    @RequestMapping("/addrDefault")
    public Object userAddrDefault(@RequestParam(value = "id", required = false) Long id) {
        return userAddrService.updateUserAddrDefault(id) ? renderSuccess("设置成功") : renderError("设置失败");
    }
	
	/**
	 * 前台用户添加商品到购物车 //判断有没有id传过来，有就是update
	 * @param userShop
	 * @param item
	 * @param request
	 * @return
	 * @throws Exception 
	 */
    @RequiresUser
	@ResponseBody
	@RequestMapping("/addShop")
	public Object userAddShop(UserShop userShop, HttpServletRequest request) {
		if(userShop.getId() == null)
		{
			User user = (User)request.getSession().getAttribute("user");
			// 判断商品数量和价格是否异常
			Item item = new Item();
			if(user != null && userShop.getCount() != 0 && userShop.getPrice() != null){
				userShop.setUser_id(user.getId());
				userShop.setAddtime(new Date());
				
				item.setId(userShop.getItem_id());
				// 事物处理，商品添加到购物车的同时，商品库存减一  // 搞错了，应该是订单才这样处理，只需要添加到购物车就好
				userService.addUserShop(userShop);
				return renderSuccess("成功加入购物车");
			}
			return renderError("加入购物车失败");
		}
		else{
			return userShopService.updateById(userShop) ? renderSuccess("修改成功") : renderError("修改失败");
		}
	}
	
	/**
	 * 前台用户购物车界面映射
	 * @param model
	 * @return
	 */
    @RequiresUser
	@RequestMapping("/shop")
	public String userShop(Model model, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		Map map = new HashMap(16);
		map.put("user_id", user.getId());
		List<UserShop> userShops = this.userShopService.findUserShopList(map);
		model.addAttribute("userShops", userShops);
		// 获取商品总价
		model.addAttribute("total", userShopService.findUserShopTotalByUserId(user.getId()));
		return "front/user/userShop";
	}
	
	/**
	 * 前台购物车删除
	 * @param id
	 * @return
	 */
    @RequiresUser
	@RequestMapping("/shopDelete")
	public Object userShopDelete(@RequestParam(value = "id", required = false) Long id) {
		return userShopService.deleteById(id) ? renderSuccess("删除成功") : renderError("删除失败");
	}
	
}
