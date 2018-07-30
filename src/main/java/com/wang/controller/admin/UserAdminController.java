package com.wang.controller.admin;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresGuest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wang.controller.BaseController;
import com.wang.model.SearchRecord;
import com.wang.model.User;
import com.wang.service.ISearchRecordService;
import com.wang.service.IUserService;

/**
 * 后台用户控制器
 * @author wang926454
 *
 */
@Controller
@RequestMapping("/admin")
public class UserAdminController extends BaseController {
	
	private final IUserService userService;
	private final ISearchRecordService searchRecordService;

    @Autowired
    public UserAdminController(IUserService userService,
    		ISearchRecordService searchRecordService) {
        this.userService = userService;
        this.searchRecordService = searchRecordService;
    }
	
    /**
     * 后台登录
     * @param user
     * @param action
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequiresGuest
    @ResponseBody
    @RequestMapping("/login")
    public Object login(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	try{
            UsernamePasswordToken token = new UsernamePasswordToken(user.getAccount(),
            		user.getPassword());  
            Subject currentUser = SecurityUtils.getSubject();  
            if (!currentUser.isAuthenticated()){
                // 使用shiro来验证
                // 记住密码
                //token.setRememberMe(true);
                // 验证角色和权限
                currentUser.login(token);
                return renderSuccess("登录成功");
            } 
        }catch(UnknownAccountException ex){
        	return renderError("该帐号未注册");
        }catch(IncorrectCredentialsException ex){
        	return renderError("密码错误");
        }
    	return renderError("密码错误");
    }
    
    /**
     * 后台用户列表界面映射
     * @return
     */
    @RequiresPermissions(value={"user:list"}, logical= Logical.OR)
    @RequestMapping("/user/list")
	public String userList() {
		return "admin/user/userList";
	}
    
    /**
     * 后台AJAX获取分页形式用户列表
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @RequiresPermissions(value={"user:list"}, logical= Logical.OR)
    @ResponseBody
	@RequestMapping("/user/getList")
    public Object getUserList(String pageNumber, String pageSize) {
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
        Page<User> selectPage = userService.findUserList(
        		new Page<User>(page_Num, page_Size), null);
        //bootstrap-table要求服务器返回的json须包含：total，rows，用rows一直接收不到，改成data好了。。。
        Map<String, Object> map = new HashMap<String, Object>(16);
        map.put("total", selectPage.getTotal());
        map.put("data", selectPage.getRecords());
        return map;
    }
    
    /**
     * 后台用户删除
     * @param id
     * @return
     */
    @RequiresPermissions(value={"user:delete"}, logical= Logical.OR)
	@ResponseBody
    @RequestMapping("/user/delete")
    public Object userDelete(@RequestParam(value = "id", required = false) Long id) {
        return userService.deleteById(id) ? renderSuccess("删除成功") : renderError("删除失败");
    }
	
	/**
	 * 后台用户编辑界面获取用户的参数，如果ID为空就进行添加操作
	 * @param model
	 * @param id
	 * @return
	 */
    @RequiresPermissions(value={"user:save"}, logical= Logical.OR)
	@RequestMapping("/user/edit")
    public String userEdit(Model model, @RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			Map map = new HashMap(16);
			map.put("id", id);
			List<User> users = userService.findUserList(new Page<User>(1, 3), map).getRecords();
			model.addAttribute("userEdit", users.get(0));
        }
		return "admin/user/userEdit";
    }
	
	/**
	 * 后台用户添加，如果存在ID就更新
	 * @param user
	 * @return
	 */
    @RequiresPermissions(value={"user:save"}, logical= Logical.OR)
	@ResponseBody
    @RequestMapping("/user/save")
    public Object userSave(User user, HttpServletRequest request) {
        if (user.getId() == null) {
        	user.setRegtime(new Date());
            return userService.insert(user) ? renderSuccess("成功") : renderError("失败");
        } else {
            if(userService.updateById(user)){
            	return renderSuccess("修改成功");
            }else{
            	return renderError("修改失败");
            }
        }
    }
	
	/**
     * 后台搜索记录界面映射
     * @return
     */
    @RequiresPermissions(value={"user:searchRecord"}, logical= Logical.OR)
    @RequestMapping("/user/searchRecord")
	public String itemSearch() {
		return "admin/user/searchRecord";
	}
    
    /**
     * 后台AJAX获取分页形式搜索记录
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @RequiresPermissions(value={"user:searchRecord"}, logical= Logical.OR)
    @ResponseBody
	@RequestMapping("/user/getSearchRecordList")
    public Object getSearchRecordList(String pageNumber, String pageSize) {
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
        Page<SearchRecord> selectPage = this.searchRecordService.selectPage(
        		new Page<SearchRecord>(page_Num, page_Size), 
        		new EntityWrapper<SearchRecord>().where("1={0}", "1").orderBy("searchtime desc"));
        //bootstrap-table要求服务器返回的json须包含：total，rows，用rows一直接收不到，改成data好了。。。
        Map<String, Object> map = new HashMap<String, Object>(16);
        map.put("total", selectPage.getTotal());
        map.put("data", selectPage.getRecords());
        return map;
    }
}
