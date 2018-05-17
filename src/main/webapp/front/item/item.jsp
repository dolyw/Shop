<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>商品库</title>
	
	<%@include file="/common/front.jspf"%>
	
	<link href="${ctxstatic}/front/category.css" rel="stylesheet" type="text/css">
	
	</head>
<body>
	
	
	<div id="wrapper">
		<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	
</div>
	
	<%@include file="/front/common/headerFrame.jsp"%>
	
		<div id="container">
			
			<div class="crumbs">
				<div class="lf">
					当前位置: <a href="">首页</a> &gt; 商品库				</div>
				<!-- <div class=" rf">
					共<font class="num">22</font>	件相关商品
				</div> -->
			</div>
			<div class="clear"></div>
			
			<div class="content">
				<div class="lf main">				
					<div class="conList">					
						<div class="box_3">
							<div class="screeBox">
								<b>分类：</b>
								<div class="list">
									<span class="select">全部</span>
									<!-- <span><a class="xiaoFont" href="">新品</a></span> -->
								</div>
							</div>
							<div class="clear"></div>
														<div class="line"></div>
							<div class="screeBox clearfix priceBox">
								<div class="f_l2 lf" id="priceRangeSelect">
									<b>价格：</b>
									<span><a class="xiaoFont" href="" data-range="0-0">全部</a></span> 
									<!-- <span><a class="xiaoFont" href="" data-range="0-100">0-100</a></span>
									<span><a class="xiaoFont" href="" data-range="100-500">100-500</a></span>
									<span><a class="xiaoFont" href="" data-range="500-1000">500-1000</a></span>
									<span><a class="xiaoFont" href="" data-range="1000-0">1000以上</a></span> -->
								</div>
								<!-- <div class="f_l2 pl10 rf" id="priceRangePost">
									<span>
										<input class="inputt price_start" data-max="99999" type="text" readonly="readonly" style="cursor: pointer;">
									</span>-
									<span>
										<input class="inputt price_end" data-max="99999" type="text" readonly="readonly" style="cursor: pointer;">
									</span>
									<input value="确定" class="submitbtn" type="submit">
								</div> -->
								<div class="clear"></div>
							</div>
						</div>
												
						
	<form method="get" name="listform">
		
		<!-- <div class="rank clearfix dresGoods">
			<b>排序：</b>
			<a class="dress" data-type="sales" href="javascript:;"><span>销量<i class="icon iconfont"></i></span></a>
			<a class="dress" data-type="last_update" href="javascript:;"><span>新品<i class="icon iconfont"></i></span></a>
			<a class="dress" data-type="shop_price" href="javascript:;"><span>价格[降]</i></span></a>
		</div> -->
		<input type="hidden" name="category" value="217">
		<input type="hidden" name="display" value="grid" id="display">
		<input type="hidden" name="brand" value="0">
		<input type="hidden" name="price_min" value="0">
		<input type="hidden" name="price_max" value="0">
		<input type="hidden" name="filter_attr" value="0">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="sort" value="sort_order">
		<input type="hidden" name="order" value="DESC">
		<!-- <div class="rf showGoods">
			<input type="checkbox" id="showGood" value="仅显示有货" checked="checked"><label for="showGood">仅显示有货</label>
		</div> -->
	</form>

<div class="blank"></div>
<form name="compareForm" class="mainCon" action="" method="post" onsubmit="return compareGoods(this);">
		<div class="clearfix">
						
			<c:forEach var="item" items="${items}">
				<div class="goodsItemh" data-video="" data-price="￥${item.price}" data-promote="" data-best="0" data-hot="0" data-new="1" style="position: relative;">
					<a class="goodImg" href="${ctx}/itemDetail?id=${item.id}"><img class="lazyimg" src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-original="${nginxPic}/${item.picture}" alt="${item.name}">
					</a>
					<a class="name xiaoFont" href="${ctx}/itemDetail?id=${item.id}" title="${item.name}" target="_blank">${item.name}</a>
					<p><strong class="price">￥${item.price}</strong></p>
					<a class="addCart" href="${ctx}/itemDetail?id=${item.id}">查看详情 </a>
					<!-- <a class="addCart" href="">+ 加入购物车 </a> -->
				</div>
						
			</c:forEach>		
			<div style="clear: both;"></div>
	</div>
	</form>
<div class="blank5"></div>
						
<form name="selectPageForm" action="" method="get">
	
	
	<!--分页 { -->
	<div class="pages">
		<div class="lf">
			<span>共 <b>${items.size()}</b> 条相关信息</span>
		</div>
				<input type="hidden" name="category" value="217"> 
				<input type="hidden" name="keywords" value=""> 						
				<input type="hidden" name="sort" value="sort_order"> 						
				<input type="hidden" name="order" value="DESC">
				<input type="hidden" name="cat" value="217"> 						
				<input type="hidden" name="brand" value="0"> 						
				<input type="hidden" name="price_min" value="0"> 						
				<input type="hidden" name="price_max" value="0"> 						
				<input type="hidden" name="filter_attr" value="0"> 						
				<input type="hidden" name="display" value="grid"> 		
				<div class="rf pageJump">
						<a class="previous" href="#">上一页</a>
						<!-- <a href="" class="num current">1</a>
						<a href="" class="num">2</a> -->
						<a class="next" href="#">下一页</a>
					</div>
	</div>
	
	
	</form>
	</div>
					
				</div>
				<div class="rf sider">
					
					<div class="content" id="bowserHitory">
						<a href="javascript:;" class="topTitle">浏览历史</a>
						
						
						<ul class="clearfix">
							<c:forEach var="item" items="${historyItems}">
							<li class="goodsimg">
								<a href="${ctx}/itemDetail?id=${item.id}" target="_blank">
								<img class="lazyimg" src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-original="${nginxPic}/${item.picture}" alt="${item.name}">
								</a>
								<div class="title"><a href="${ctx}/itemDetail?id=${item.id}" target="_blank" title="${item.name}">${item.name}</a></div>
								<div class="price"><font class="f1">￥${item.price}</font></div>
							</li>
							</c:forEach>
							<!-- <li id="clear_history"><a onclick="clear_history()">[清空]</a></li> -->	
						</ul>
					</div>
									
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div style="clear: both;"></div>	
	
	<%@include file="/front/common/footerFrame.jsp"%>
</div>

	<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>
	
<%@include file="/common/frontLogin.jspf"%>
</body></html>