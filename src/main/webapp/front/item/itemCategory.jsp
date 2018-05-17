<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>分类详细</title>
	
	<%@include file="/common/front.jspf"%>
	
</head>

<body onLoad="SetNum();">
<div id="wrapper">	
	<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>
	
	<%@include file="/front/common/headerFrame.jsp"%>
	
	<div id="container">
		<div class="crumbs">
			<div class="lf">
				当前位置: <a href="#">首页</a> &gt; 分类详细			</div>
		</div>
		<div class="categoryFrame">
			<div class="category">
				<c:forEach var="itemCategory" items="${itemCategorys}">
				<div class="categoryname">
					<div class="layui-row">
					   <div class="layui-col-xs6">
					      <div class="grid-demo">${itemCategory.name}</div>
					   </div>
					</div>
				</div>
				<br/>
				<c:if test="${itemCategory.itemCategoryDetails.size() != 0}">
				<div class="categorydetail">
				  
					<div class="layui-row">
					    <c:forEach var="itemCategoryDetail" items="${itemCategory.itemCategoryDetails}">
					    <div class="layui-col-xs3">
					      <div class="grid-demo"><a href="#"><!-- <span style="padding-right: 5px;">&bull;</span> -->${itemCategoryDetail.name}</a></div>
					    </div>
					    </c:forEach>
				  	</div>
				</div>
				</c:if>
				<hr/>
				</c:forEach>
				
			</div>
		<div class="clear"></div>
	</div>
	
	<%@include file="/front/common/footerFrame.jsp"%>
</div>
<script async="" src="${ctxstatic}/front/analytics.js"></script>
	
	<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>
	
	<!-- 让IE8/9支持媒体查询，从而兼容栅格
	<!--[if lt IE 9]> -->
	<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	
<%@include file="/common/frontLogin.jspf"%>
</body></html>