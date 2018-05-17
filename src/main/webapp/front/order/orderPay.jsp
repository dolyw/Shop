<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>下单成功</title>
	<%@include file="/common/front.jspf"%>
	<link href="${ctxstatic}/front/flow.css" rel="stylesheet" type="text/css">
	</head>
<body>
<div id="wrapper">
	<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>

	<%@include file="/front/common/headerFrame.jsp"%>
	
<div id="container" data-step="done">
		<div class="crumbs">
			<div class="lf">
				当前位置: <a href="">首页</a> &gt;下单成功</div>
		</div>
        
       <div class="orderSucess">
        	<h2 class="out">下单成功！<!-- <a href="javascript:;">Your Order has been received!</a> --></h2>
        	<div class="con">
        		<h2>感谢您在本站购物！您的订单已提交成功，请记住您的订单号：<a href="javascript:;">${out_trade_no}</a></h2>
        		<div class="name">
        			您的支付宝交易号为: <strong>${trade_no}</strong>，       			
	        		您的付款金额为: <strong>￥${total_amount}</strong>	        		
        		</div>
        				               	
	            <%-- <div class="payOnline">
	               <br><img src="${ctxstatic}/front/Q5.png"><br>支付后点击<a href="#">【此处】</a>查看我的订单	               	
	            </div> 	 	        		
               	<h3>您可以<a href="${ctx}/index"> 返回首页 </a> 或去 <a href="${ctx}/user/user">用户中心</a></h3>--%>
               	<h3></h3>
        	</div>   
      </div>
</div>


<%@include file="/front/common/footerFrame.jsp"%>

</div>
	<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>
<%@include file="/common/frontLogin.jspf"%>
</body></html>