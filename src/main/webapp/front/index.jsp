<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>Shop</title>
	
	<%@include file="/common/front.jspf"%>
	
	</head>
<body>

<div id="wrapper">	
	<span style="font-size:14px;"><meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">  
</span>  
	<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	
</div>
	
	<%@include file="/front/common/headerFrame.jsp"%>
	
	<div id="container">
		<div class="iflashFrame">
	<div class="bigeyeSource" data-size="1000_442" style="display: none;">
	  	<ul>
	    	<li data-src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/transparent.gif" data-url="#" data-original="${nginxPic}/2018001.jpg"></li>
		  	<li data-src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-url="#" data-original="${nginxPic}/2018002.jpg"></li>
			<li data-src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-url="#" data-original="${nginxPic}/2018003.jpg"></li>
		</ul>
	</div>
	<div class="bigeye" data-size="1000_442" data-num="1" style="position: relative; height: 442px;">
		<div class="list" style="position: relative; height: 442px; width: 100%; overflow: hidden;">	
		<ul style="position: absolute; height: 442px; width: 3000px; margin-left: -1000px;">
			<li style="float: left; height: 442px; width: 1000px; position: relative;">
				<a href=""><img class="lazyimg" width="100%"  data-original="${nginxPic}/2018001.jpg" alt=""></a>
			</li>
			<li style="float: left; height: 442px; width: 1000px; position: relative;">	
				<a href=""><img class="lazyimg" width="100%"  data-original="${nginxPic}/2018002.jpg" alt=""></a>
			</li>
			<li style="float: left; height: 442px; width: 1000px; position: relative;">	
				<a href=""><img class="lazyimg" width="100%"  data-original="${nginxPic}/2018003.jpg" alt=""></a>
			</li>
		</ul>
		</div>
	</div>
</div>
		<div class="clear"></div>
		        
				<div class="floorModule floor_0">
			<div class="floorCon">
				<div class="fl moduletitle">新品推荐</div>
				<div class="newShop ">
                	<div class="content ">

<c:forEach var="itemTimeDesc" items="${selectPageTimeDesc}">
<div class="shopList productBlock" data-img="" data-video="" data-type="index" data-price="￥${itemTimeDesc.price}" data-promote="" data-best="0" data-hot="0" data-new="1" style="position: relative;">
	<a href="${ctx}/itemDetail?id=${itemTimeDesc.id}" title="${itemTimeDesc.name}" target="_blank">
		<img class="lazyimg" src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-original="${nginxPic}/${itemTimeDesc.picture}" alt="${itemTimeDesc.name}" >
	</a>
	<a class="name" href="${ctx}/itemDetail?id=${itemTimeDesc.id}" title="${itemTimeDesc.name}" target="_blank">${itemTimeDesc.name}</a>
	<p>
		<a class="addCart" href="${ctx}/itemDetail?id=${itemTimeDesc.id}">查看详情</a>
					<strong class="price">￥${itemTimeDesc.price}</strong>
			</p>
</div>
</c:forEach>

          
                	</div>
            	</div>
			</div>
		</div>
				<div class="floorModule floor_1">
			<div class="floorCon">
				<div class="fl moduletitle">
					热卖推荐				</div>
				<div class="newShop ">
                	<div class="content ">
                		
<c:forEach var="itemStockAsc" items="${selectPageStockAsc}">
<div class="shopList productBlock" data-img="" data-video="" data-type="index" data-price="￥${itemStockAsc.price}" data-promote="" data-best="0" data-hot="0" data-new="1" style="position: relative;">
	<a href="${ctx}/itemDetail?id=${itemStockAsc.id}" title="${itemStockAsc.name}" target="_blank">
		<img class="lazyimg" src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-original="${nginxPic}/${itemStockAsc.picture}" alt="${itemStockAsc.name}">
	</a>
	<a class="name" href="${ctx}/itemDetail?id=${itemStockAsc.id}" title="${itemStockAsc.name}" target="_blank">${itemStockAsc.name}</a>
	<p>
		<a class="addCart" href="${ctx}/itemDetail?id=${itemStockAsc.id}">查看详情</a>
					<strong class="price">￥${itemStockAsc.price}</strong>
			</p>
</div>
</c:forEach>
          
                	</div>
            	</div>
			</div>
		</div>
				
				
			<div class="clear"></div>
</div>
	
	
	<%@include file="/front/common/footerFrame.jsp"%>

</div>
<script type="text/javascript" src="${ctxstatic}/front/index.js"></script>
<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>	
<script type="text/javascript" src="${ctxstatic}/front/bigeye.js"></script>
<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
<script type="text/javascript" src="${ctxstatic}/front/hammer.min.js"></script>
<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>

<%@include file="/common/frontLogin.jspf"%>
</body></html>