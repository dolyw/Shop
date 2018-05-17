<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
	<title>Login</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${ctxstatic}/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctxstatic}/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${ctxstatic}/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${ctxstatic}/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="${ctxstatic}/css/demo.css">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="${ctxstatic}//img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${ctxstatic}//img/favicon.png">
	<%@include file="/common/adminCss.jspf"%>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix">
					<div class="content">
						
						<div class="logo text-center"><span style="font-size: 20px;">后台管理</span><%-- <img src="${ctxstatic}/img/logo-dark.png" alt="Klorofil Logo"> --%></div>
						
						<form class="form-auth-small" method="post" id="form" name="form">
								<div class="form-group">
									<label for="signin-email" class="control-label sr-only">Account</label>
									<input type="text" class="form-control" id="account" name="account" placeholder="帐号" onkeydown="KeyDown()">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" class="form-control" id="password" name="password" placeholder="密码" onkeydown="KeyDown()">
								</div>
								<!-- <div class="form-group clearfix">
									<label class="fancy-checkbox element-left">
										<input type="checkbox">
										<span>Remember me</span>
									</label>
								</div> -->
								
								
								<!-- <div class="bottom">
									<span class="helper-text"><i class="fa fa-lock"></i> <a href="#">Forgot Password?</a></span>
								</div> -->
							</form>
							<button class="btn btn-primary btn-lg btn-block" id="input1" name="input1" onclick="adminLogin()" >登录</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	
	<script src="${ctxstatic}/vendor/jquery/jquery.min.js"></script>
	<script src="${ctxstatic}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctxstatic}/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${ctxstatic}/scripts/klorofil-common.js"></script>
	
	<%@include file="/common/adminJs.jspf"%>
	<script>
	function KeyDown()
	{
	  if (event.keyCode == 13)
	  {
	    event.returnValue=false;
	    event.cancel = true;
	    adminLogin();
	  }
	}

	function adminLogin() {
		$.ajax({
            type: 'POST',
            url: '${ctx}/admin/login',
            data: $('#form').serialize(),
            dataType: 'json',
            success: function (data) {
                	if(data.success){
                		swal(
    			               	{   
    	               		      title: "提示信息",   
    	               		      text: data.msg,  
    	               		      type: "info",
    	               		      allowOutsideClick: false,
    	               		      background: '#FFF',
    	               		      confirmButtonColor: '#64C9C1',
    	               		      confirmButtonText: "确定"
    		               		  }).then(
    		               		      function () {
    		               		      	location.href='${ctx}/adminManager';
    		               		      }
    		             		)
                	}else{
                		swal(
    			               	{   
    	               		      title: "提示信息",   
    	               		      text: data.msg,  
    	               		      type: "info",
    	               		      allowOutsideClick: false,
    	               		      background: '#FFF',
    	               		      confirmButtonColor: '#64C9C1',
    	               		      confirmButtonText: "确定"
    		               		  }).then(
    		               		      function () {
    		               		      	
    		               		      }
    		             		)
                	}
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            
            		 //alert(XMLHttpRequest.status);
            		 //alert(XMLHttpRequest.readyState);
            		 //alert(textStatus);

           		  swal(
    			               	{   
    	               		      title: "提示信息",   
    	               		      text: "请勿重复登录",  
    	               		      type: "info",
    	               		      allowOutsideClick: false,
    	               		      background: '#FFF',
    	               		      confirmButtonColor: '#64C9C1',
    	               		      confirmButtonText: "确定"
    		               		  }).then(
    		               		      function () {
    		               		      	location.href='${ctx}/adminManager';
    		               		      }
    		             		)
            }
        });
    }

	</script>
</body>

</html>
