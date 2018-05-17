package com.wang.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.plugins.Page;
import com.wang.model.Permission;
import com.wang.model.Role;
import com.wang.model.User;
import com.wang.service.IPermissionService;
import com.wang.service.IRoleService;
import com.wang.service.IUserService;
/**
 * Shiro自定义Realm
 * @author wang926454
 *
 */
public class UserRealm extends AuthorizingRealm {

	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IPermissionService permissionService;
	
	// 认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
		String pwd = new String(token.getPassword());
		//System.out.println(pwd.equals("phone"));
		// 密码为phone是手机短信登录
		if(pwd.equals("phone")){
			Map map = new HashMap();
			map.put("account", token.getUsername());
			if(userService.findUserList(new Page<User>(1, 3), map).getRecords().size() == 0){
				throw new UnknownAccountException();
			}
			List<User> users = userService.findUserList(new Page<User>(1, 3), map).getRecords();
			if(users.size() == 1){
				SecurityUtils.getSubject().getSession().setAttribute("user", users.get(0));
				return new SimpleAuthenticationInfo(token.getUsername(), token.getPassword(), getName());
			}
		}else{
			Map map = new HashMap();
			map.put("account", token.getUsername());
			if(userService.findUserList(new Page<User>(1, 3), map).getRecords().size() == 0){
				throw new UnknownAccountException();
			}
			// token.getPassword()的返回值是char[]，必须转换成String
			map.put("password", pwd);
			List<User> users = userService.findUserList(new Page<User>(1, 3), map).getRecords();
			if(users.size() == 1){
				// 在session中设定user
				SecurityUtils.getSubject().getSession().setAttribute("user", users.get(0));
				return new SimpleAuthenticationInfo(token.getUsername(), token.getPassword(), getName());
			}else{
				throw new IncorrectCredentialsException();
			}
		}
		return null;
	}
	
	// 授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String account = (String) principals.getPrimaryPrincipal();
        //System.out.println(account);
        
        Map map = new HashMap();
		map.put("account", account);
        List<Role> roles = roleService.findRoleListByUser(
        		new Page<Role>(1, 50), map).getRecords();
        
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        if(roles.size() != 0){
			for(Role role:roles){
				//将数据库中的角色标签符放入
				Map pmap = new HashMap();
				pmap.put("name", role.getName());
				//System.out.println(role.getName());
				List<Permission> permissions = permissionService.findPermissionListByRole(
		        		new Page<Permission>(1, 1000), pmap).getRecords();
				if(permissions.size() != 0){
					for(Permission permission:permissions){
						//将数据库中的权限标签符放入
						authorizationInfo.addStringPermission(permission.getPercode());
					}
				}
				authorizationInfo.addRole(role.getName());
			}
		}
        return authorizationInfo;
	}
}
