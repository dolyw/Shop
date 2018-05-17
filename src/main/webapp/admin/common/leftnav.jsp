<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="${ctx}/adminManager"  class=""><i class="lnr lnr-home"></i><span>主页</span></a></li>
						<shiro:hasPermission name="user:list">
						<li>
							<a href="#userPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-user"></i><span>用户管理</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="userPages" class="collapse ">
								<ul class="nav">
									<li><a href="${ctx}/admin/user/list"  class="">用户列表</a></li>
									<li><a href="${ctx}/admin/user/searchRecord"  class="">搜索记录</a></li>
								</ul>
							</div>
						</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="item:list">
						<li>
							<a href="#itemPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-heart"></i><span>商品管理</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="itemPages" class="collapse ">
								<ul class="nav">
									<li><a href="${ctx}/admin/item/list"  class="">商品列表</a></li>
									<%-- <li><a href="${ctx}/item/itemEdit"  class="">商品添加</a></li> --%>
								</ul>
							</div>
						</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="itemCategory:list">
						<li>
							<a href="#itemCategoryPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-inbox"></i><span>商品分类</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="itemCategoryPages" class="collapse ">
								<ul class="nav">
									<li><a href="${ctx}/admin/itemCategory/list"  class="">大类列表</a></li>
									
									<li><a href="${ctx}/admin/itemCategoryDetail/list"  class="">小类列表</a></li>
									
								</ul>
							</div>
						</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="order:payList">
						<li>
							<a href="#orderPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-bookmark"></i><span>订单管理</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="orderPages" class="collapse ">
								<ul class="nav">
									<li><a href="${ctx}/admin/order/payList"  class="">等待付款</a></li>
									<li><a href="${ctx}/admin/order/courierList"  class="">付款完成</a></li>
								</ul>
							</div>
						</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="system:indexCategory">
						<li>
							<a href="#sysSet" data-toggle="collapse" class="collapsed"><i class="lnr lnr-pencil"></i><span>系统设置</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="sysSet" class="collapse ">
								<ul class="nav">
									<li><a href="${ctx}/admin/system/indexCategory"  class="">主页分类</a></li>
								</ul>
							</div>
						</li>
						</shiro:hasPermission>
						<li>
							<a href="#roomSet" data-toggle="collapse" class="collapsed"><i class="lnr lnr-location"></i><span>权限管理</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="roomSet" class="collapse ">
								<ul class="nav">
									<li><a href="${ctx}/adminAbout"  class="">关于</a></li>
								</ul>
							</div>
						</li>
						<%-- <li>
							<a href="#permissionSet" data-toggle="collapse" class="collapsed"><i class="lnr lnr-pencil"></i><span>权限管理</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="permissionSet" class="collapse ">
								<ul class="nav">
									<li><a href="${ctx}/admin/system/indexCategory"  class="">添加角色</a></li>
								</ul>
							</div>
						</li> --%>
						<!-- <li><a href="tables.html"  class=""><i class="lnr lnr-dice"></i><span>关于</span></a></li> -->
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->