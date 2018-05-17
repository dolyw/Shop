<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	
	<title>我的订单</title>
	<%@include file="/common/front.jspf"%>

	<link href="${ctxstatic}/front/user_transaction.css" rel="stylesheet" type="text/css">
	
	</head><body>
	<div id="wrapper">
			<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>

	<%@include file="/front/common/headerFrame.jsp"%>
	
			<div id="container">
				<div id="ur_here">
					当前位置: <a href="#">首页</a> &gt; 我的订单</div>
				<div class="lf conLf">

<dl>
	<dd>
		<h2 class="up">&nbsp;&nbsp;&nbsp;用户中心</h2>
		<ul>
			<li>
				<p><a href="${ctx}/user/user">&nbsp;&nbsp;&nbsp;个人中心</a></p>
			</li>
			<li>
				<p><a class="curs" rel="nofollow" href="${ctx}/order/list">&nbsp;&nbsp;&nbsp;我的订单</a></p>
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
					<div class="box" style="">
						<div class="userCenter">
							<div class="bodyBlack" hidden="true"></div>
							
												
							<div class="myorderListship">
								<c:if test="${orders.size() == 0}">
									<h4>当前订单为空</h4>
								</c:if>
								<c:if test="${orders.size() != 0}">	
								<div class="top">
									<ul>
										<li flag="100" class="li current">全部订单
											<!-- <a class="flag100">5</a> -->
										</li>
										<!-- <li flag="0" class="li">待付款
											<a class="flag0">0</a>
										</li>
										<li flag="2" class="li">待发货
											<a class="flag2">0</a>
										</li>
										<li flag="3" class="li">待收货
											<a class="flag3">0</a>
										</li>
										<li flag="4" class="li"> 待评价 
											<a class="flag4">0</a>
										</li>-->
										<li class="searchKeyFrame" style="display:none;">
											<input type="text" name="search" placeholder="输入商品名称/商品编号/订单号搜索" class="btnSearch"><input type="submit" class="btnSub" value="搜索">
										</li> 
									</ul>
									<div class="clear"></div>
								</div>
								<div class="line"></div>
								<div class="midTop">
									
									<a href="javascript:;" class="lf listDeti">订单详情</a>
									
									<a href="javascript:;" class="lf operat">操作</a>
								</div>
								<div class="middle">
									<div class="loadImg" style="block">
										
									</div>
									<div class="main">
									<c:forEach var="order" items="${orders}">
										<div class="content">	
											<div class="top">    	
												<span class="shipTime"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.addtime}" /></span>		
												<span style="text-indent: 40px;display: inline-block;">订单号：
													<span class="shipName">		
														<input type="hidden" value="33422">				
															<a class="shipNumber">${order.no}</a>			
													</span>			
													<span class="shipName">	</span>	
												</span>	
												
												<span style="text-indent: 40px;display: inline-block;">
													<c:if test="${order.courier eq '1'}">顺丰快递</c:if>
													<c:if test="${order.courier eq '2'}">韵达快递</c:if>
													<c:if test="${order.courier eq '3'}">申通快递</c:if>
													<c:if test="${order.courier eq '4'}">顺丰到付</c:if>
													<span class="shipName">	快递号：</span>	
													<span class="shipName">		
														<input type="hidden" value="33422">				
															<a class="shipNumber">
															<c:if test="${empty order.courierno}">无</c:if>
															<c:if test="${not empty order.courierno}">${order.courierno}</c:if>
															</a>			
													</span>			
													
												</span>
												
											</div>	
											
											
											<div class="bottom" style="height: ${order.orderItems.size()*135 - 1}px;">	
												<div class="lf botlf">
													
													<c:forEach var="orderItem" items="${order.orderItems}">
													<div class="con">	
														<a href="${ctx}/itemDetail?id=${orderItem.item.id}">	<img class="lazyimg" src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-original="${nginxPic}/${orderItem.item.picture}">	</a>	
														<a href="${ctx}/itemDetail?id=${orderItem.item.id}"><span class="name">${orderItem.item.name}</span>	
														</a>	
														<span class="num">数量：${orderItem.count}</span>  
														<a href="javascript:;" class="shipPrice">￥${orderItem.price}</a>
													</div>
													</c:forEach>
												</div>		
												<div class="lf shipStatus" style="height: ${order.orderItems.size()*135 - 1}px;"><span><br/>￥${order.price}</span></div>	
												<div class="lf">
													<br/><br/><br/>
													<c:if test="${order.state == 1}">
													<a href="${ctx}/order/directPay?no=${order.no}" >马上付款</a>	
													</c:if>	
													<c:if test="${order.state == 2}">
													<a>等待发货</a>	
													</c:if>
													<c:if test="${order.state == 3}">
													<a>等待收货</a>	
													</c:if>
													<c:if test="${order.state == 4}">
													<a>交易完成</a>	
													</c:if>
												</div>
												<div class="clear"></div>	
											</div>
											
											
										</div>
									</c:forEach>
								</div>
									
									<!-- 分页 -->
									<div class="pager rf">
										<a href="javascript:;" class="lf prev" style="display: block;">上一页</a>
										<!-- <div class="page lf"><a href="javascript:;" class="lf current num">1</a></div> -->
										<a href="javascript:;" class="lf next" style="display: block;">下一页</a>
										<div class="clear"></div>
									</div>
									<div class="clear"></div>
								</div>
								</c:if>	
							</div>
													
						
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