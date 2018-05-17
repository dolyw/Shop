<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户中心</title>
	<%@include file="/common/front.jspf"%>
	
	<link href="${ctxstatic}/front/user_clips.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrapper">
	<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>

	<%@include file="/front/common/headerFrame.jsp"%>

<div id="container">
		<div id="ur_here">
  			当前位置: <a href="#">首页</a> &gt; 个人中心 		</div>
	    <div class="lf conLf">
	    	

<dl>
	
	<dd>
		<h2 class="up">&nbsp;&nbsp;&nbsp;用户中心</h2>
		<ul>
			<li>
				<p><a class="curs" href="${ctx}/user/user">&nbsp;&nbsp;&nbsp;个人中心</a></p>
			</li>
			<li>
				<p><a rel="nofollow" href="${ctx}/order/list">&nbsp;&nbsp;&nbsp;我的订单</a></p>
			</li>
			<!-- <li>
				<p><a rel="nofollow" href="">&nbsp;&nbsp;&nbsp;我的评价</a></p>
			</li> -->
		</ul>
		

		<h2 class="up">&nbsp;&nbsp;&nbsp;账户设置</h2>
		<ul>
			<li>
				<p>	<a href="${ctx}/user/security">&nbsp;&nbsp;&nbsp;账户安全</a></p>
			</li>
			<li>
				<p>	<a href="${ctx}/user/addr">&nbsp;&nbsp;&nbsp;收货地址</a></p>
			</li>
		</ul>
	</dd>
</dl>
	    </div>
	    <div class="rf conRf">
	    	<div class="box">
	    		<div class="userCenter">
	    		
	    		<%-- <div class="allTop">广告:店铺活动：开学精选装备  学生专享优惠满199立减10|满399立减40|满699立减80</div> --%>

	    			<div class="bodyBlack" hidden="true"></div>
											<div class="baseMes">
							<div class="top">
								<span>我的信息</span>
							</div>
							<div class="bottom">
								<div class="lf myMes">
									
									<p class="mesID">${sessionScope.user.username}</p>
									<p class="mesTel">${sessionScope.user.account}</p>
									<!-- <div class="userRankLine" data-min="100" data-max="2499" data-point="300">
										<p class="mesdengjiImg">
											<span class="lf">
												V1会员											</span>
											<span class="rf">
												V2会员											</span>
										</p>
										<div class="mesBase"></div>
										<div class="mesUp" style="width: 20px;"></div>
									</div> -->
								</div>
								
							</div>
						</div>
											
			<%-- <div class="myFavorite">
				<p>
					<span class="lf">我的收藏</span>
					<span class="rf"><a href="#" class="f6">查看更多
					</a></span>
				</p>						
				<div class="content">
														<div class="shopList">
							<a href="#" title="XXXX" target="_blank">
								<img class="fpThumb" src="" data-thumb="" alt="">
							</a>
							<br>
							<a class="name" href="#" title="XXXXXX" target="_blank">
								XXXXXXXX										</a>
							<p>
								<a class="addCart" href="javascript:addToCart(1634);">+ 加入购物车</a>
																				<strong class="price">￥34.30</strong>
																		</p>
						</div>																
													<div class="clear"></div>	

				</div>
			</div>	 --%>
			
	    		</div>
	    	</div>
	    </div>
		<div class="clear"></div>
	</div>
	
	<%@include file="/front/common/footerFrame.jsp"%>

</div>
<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>

<%@include file="/common/frontLogin.jspf"%>
</body></html>