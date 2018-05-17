<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	
	<title>账户安全</title>
	<%@include file="/common/front.jspf"%>
	
	<link href="${ctxstatic}/front/user_transaction.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrapper">
			<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>
	
	<%@include file="/front/common/headerFrame.jsp"%>
	
	<div id="container">
				<div id="ur_here">
					当前位置: <a href="#">首页</a> &gt; 账户安全</div>
				<div class="lf conLf">
					

<dl>
	
	<dd>
		<h2 class="up">&nbsp;&nbsp;&nbsp;用户中心</h2>
		<ul>
			<li>
				<p><a href="${ctx}/user/user">&nbsp;&nbsp;&nbsp;个人中心</a></p>
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
				<p>	<a class="curs" href="${ctx}/user/security">&nbsp;&nbsp;&nbsp;账户安全</a></p>
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
														
							<div class="safe">
								<h2>安全中心</h2>
								<div class="top">
									安全级别：
									<div class="up"></div>
									<div class="base"></div>
									<a href="javascript:;" class="rank">中级</a>
									<!-- <a href="javascript:;" class="tishi">建议您启动全部安全设置，以保障账户及资金安全</a> -->
								</div>
								<div class="main">
									<div class="lf">
										
									</div>
									<div class="lf">
										<h1>登录密码</h1></div>
									<div class="lf">互联网账户存在被盗风险，建议您定期更改密码以保护账户安全。</div>
									<div class="rf">
										<a href="#"><span id="modifyPWD" onclick="openLayerUrl('${ctx}/front/common/modifyPWD.jsp','372','300','密码修改')">修改</span></a>
									</div>
									<div class="clear"></div>
								</div>
								<hr>
								<!-- <div class="main">
									<div class="lf">
										
									</div>
									<div class="lf">
										<h1>邮箱认证</h1></div>
									<div class="lf">您验证的邮箱：<span>XXXXXXXXXX@XX.com</span>，若已停用，请立即更换，避免账户被盗</div>
									<div class="rf">
										<a href="#">修改</a>
									</div>
									<div class="clear"></div>
								</div> 
								<hr> -->
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