<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<%-- <meta http-equiv="refresh" content="3;URL=${ctx}"> --%>
    	
	<title>系统提示</title>
	
	<%@include file="/common/front.jspf"%>

	<script language="javascript">
		var nn = 2;
		function num()
		{
		 if(document.getElementById("nuber").innerHTML == 1){
			 window.location.href = "${ctx}/";
		 }else{
			 document.getElementById("nuber").innerHTML = nn;
			 nn --;
		 }
		}
		function SetNum()
		{
		 setInterval("num()",1000);
		}
	</script>
	
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
				当前位置: <a href="#">首页</a> &gt; 系统提示			</div>
		</div>
		<div class="messageFrame">
			<img src="${ctxstatic}/img/403.png" width="554px" height="256px" />
			<h2>登录失效或者没有权限访问</h2>
			<%-- <h2>${message}</h2> --%>
			<ul>
				<!-- <li><a href="javascript:history.go(-1)">返回上一页</a></li> -->
				<li><span id="nuber" style="color:#FF0000;">3</span>秒后返回主页...</p></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	
	<%@include file="/front/common/footerFrame.jsp"%>
</div>
<script>
    //javascript:history.go(-1);
</script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	<%@include file="/common/frontLogin.jspf"%>
</body></html>