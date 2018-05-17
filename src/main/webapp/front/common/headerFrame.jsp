<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<div id="headerFrame">
	
	<c:if test="${empty sessionScope.user}">	
	<div class="top">
		<div class="lf">
		
		</div>
		<div class="rf">
			<span id="ECS_MEMBERZONE"> 欢迎光临本站
			<a href="#" onclick="openLayerUrl('${ctx}/front/common/login.jsp','372','385','登录')"><span id="login">请登录</span></a> 或
			 <a href="#" onclick="openLayerUrl('${ctx}/front/common/register.jsp','372','385','注册')"><span id="register">注册</span></a>
 			</span>
		</div>
	</div>
	</c:if>
	
	<c:if test="${not empty sessionScope.user}">
	<div class="top">
		<div class="lf">
			<span id="ECS_MEMBERZONE"> 您好，<font class="f1">
						<c:if test="${empty sessionScope.user.username}">
							<a href="${ctx}/user/user">${sessionScope.user.account}</a>
						</c:if>
						<a href="${ctx}/user/user">${sessionScope.user.username}</a>
				</font>，欢迎您回来！<a href="${ctx}/user/logout">退出</a>
 			</span>
		</div>
		<div class="rf">
			<span>
				<a href="${ctx}/order/list">我的订单</a>&nbsp;&nbsp;&nbsp;
				<a href="${ctx}/user/shop">我的购物车</a>
 			</span>
		</div>
	</div>
	</c:if>
	
	<div class="contentFrame">
		<div class="contentBox">
			<div class="logoFrame">
				<br/>
				<br/>
				<b style="font-size: 35px; margin-left: 16px;color: #337ab7;">Shopping</b>
			</div>
			<div class="searchFrame">
				<form id="searchForm" name="searchForm" action="${ctx}/itemSearch" method="post">
					<div class="input-group col-md-8" style="margin-top:0px positon:relative">  
					       <input type="text" id="key" name="key" class="form-control input-lg" placeholder="请输入搜索关键字">  
					            <span class="input-group-btn">  
					               <button class="btn btn-primary btn-lg" type="submit">搜索</button>  
					            </span>  
					 </div>
				</form>
			</div>
			
			<!-- <div class="cartFrame">
									<div id="mycart">
										 <div class="btn">
						<a href="#">
							<div class="text"></i>我的购物车</div>
							<div class="talkbubble"><span class="topcart totNum">0</span></div>
						</a>
										</div>
					<div class="miniCart">
						<div class="con">
							<ul>
										</ul>
						</div>
						<div class="totoal">
							<div>共<span class="totNum">0</span>件商品   总计：<span class="totPrice">0</span>元</div>
							<div class="miniCartBtn">
								
								<a title="去结算" href=""><button>去结算</button></a>
							</div>
						</div>
					</div>
					<div class="mask"></div> 				</div>
			</div> -->
			
			<div class="categoryNavFrame">
				<div class="btn">
					<a class="allClassBtn" href="javascript:;">推荐商品分类</a>
				</div>
				<div class="list" style="display: none;">
					<ul>
						<!-- <li>
							<div class="navFrame" align="center" style="margin-right: 20px;">
								<a href="#" title="newProduct">新品推荐</a>
							</div>
						</li>
												<li>
                            <div class="navFrame" align="center" style="margin-right: 20px;">
                                <a href="#" title="newProduct">热卖推荐</a>
                            </div>
                        </li> -->
                        
                        <c:forEach var="indexCategory" items="${applicationScope.indexCategorysApplication}">
                        <c:if test="${indexCategory.itemCategory.name != null}">
                        <li>
		        			<div class="navFrame" align="left" style="margin-left: 38px;">
		        				<a href="#" title="${indexCategory.itemCategory.name}">${indexCategory.itemCategory.name}</a>
							</div>
		        			<div class="subNavFrame">
		        				<div class="subNav">
	        						<div class="box">
			        					<h4><a href="#" title="${indexCategory.itemCategory.name}">${indexCategory.itemCategory.name}</a></h4>
			        					<span>
			        						<c:forEach var="itemCategoryDetail" items="${indexCategory.itemCategory.itemCategoryDetails}">
		                                	<a href="#">${itemCategoryDetail.name}</a>
		                                	</c:forEach>
                 		        		</span>
	        						</div>
		        				</div>
		        			</div>
		        		</li>
		        		</c:if>
			            </c:forEach>
			            <li>
		        			<div class="navFrame" align="left" style="margin-left: 38px;">
		        				<a href="${ctx}/itemCategory" title="更多商品分类">更多商品分类</a>
							</div>
		        		</li>
					</ul>
					<div class="subNavCon">
						<div class="lf">
							
						</div>
						<div class="rf">
							
						</div>
					</div>
				</div>
			</div>
			<div class="topNavFrame">
                  <nav class="navbar navbar-default" role="navigation" style="background-color:#FFFFFF;height: 40px;min-height: 40px;" >
				    <div>
				        <ul class="nav navbar-nav">
				            <li><a href="${ctx}/">首页</a> </li>

				            <!-- <li class="dropdown">
				                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
				                    Java
				                    <b class="caret"></b>
				                </a>
				                <ul class="dropdown-menu">
				                    <li><a href="#">jmeter</a></li>
				                    <li><a href="#">EJB</a></li>
				                    <li><a href="#">Jasper Report</a></li>
				                    <li class="divider"></li>
				                    <li><a href="#">分离的链接</a></li>
				                    <li class="divider"></li>
				                    <li><a href="#">另一个分离的链接</a></li>
				                </ul>
				            </li> -->
				        </ul>
				    </div>
				    </nav> 
				   </div>
				
			</div>
		</div>
	</div>
</div>