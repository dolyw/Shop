<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	
	<title>收货地址</title>
	<%@include file="/common/front.jspf"%>
	
	<link href="${ctxstatic}/front/user_transaction.css" rel="stylesheet" type="text/css">
	
	<link href="${ctxstatic}/front/sign.css" rel="stylesheet" type="text/css">
	</head>
<body>	
		<div id="wrapper">
			<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>
		
		<%@include file="/front/common/headerFrame.jsp"%>
		
			<div id="container">
				<div id="ur_here">
					当前位置: <a href="#">首页</a> &gt; 收货地址</div>
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
				<p>	<a href="${ctx}/user/security">&nbsp;&nbsp;&nbsp;账户安全</a></p>
			</li>
			<li>
				<p>	<a class="curs" href="${ctx}/user/addr">&nbsp;&nbsp;&nbsp;收货地址</a></p>
			</li>
		</ul>
	</dd>
</dl>
				</div>
				<div class="rf conRf">
					<div class="box" style="">
						<div class="userCenter">
								<div class="bodyBlack" hidden="true"></div>
									<div class="addressFrame">
								<div class="tit">收货人信息</div>
								
								
								<div class="list" style="display: block;">
									<ul>
										<c:forEach var="userAddr" items="${userAddrs}">
											<li class="ads select" data-aid="8904" data-status="1">	
												
												<c:if test="${userAddr.defaults eq '1'}">
													<div class="default" style="display: block;">默认地址</div>	
												</c:if>
												
												<c:if test="${userAddr.defaults eq '0'}">
													<div class="setDefault"><a onclick="defaultAddr(${userAddr.id})">设为默认地址</a></div>	
												</c:if>
												
												<div class="options">
													<%-- <a class="editBtn" onclick="editAddr(${userAddr.id})">编辑</a> --%>
													<a class="delBtn" onclick="deleteAddr(${userAddr.id})">删除&nbsp;&nbsp;&nbsp;</a>
												</div>	
												
												<div class="consignee"><b>${userAddr.name}</b><span>${userAddr.phone}</span></div>	
												<div class="address">${userAddr.addr}</div>
											</li>
										</c:forEach>
										<li class="forgetPwd" style="display: list-item;"><a class="addNewAddress">新增收货地址</a></li>
										<!-- <a class="forgetPwd" href="javascript:;"><li class="addNewAddress">新增收货地址</li></a> -->
									</ul>
								</div>
								
								
								<div class="clear"></div>
								<!-- <div class="more">
									<button data-type="off">展开更多<i class="iconfont icon-xiangxia"></i></button>
								</div> -->
							</div>
							
						</div>

					</div>
				</div>
				<div class="clear"></div>
				
			</div>
			
		<%@include file="/front/common/footerFrame.jsp"%>
	
<!-- 模态框（Modal） -->
<div id="frogetPwdFrame">
	
	<div class="con">
		<div class="box">
		<form name="userAddr" action="${ctx}/user/addr" method="post">
			<div class="stepFrame">
				<ul>
					<li>
						<div class="inputFrame">
							<div class="about">请输入姓名</div>
							<input id="name" name="name" class="input" type="text" value="">
						</div>
						<div class="inputFrame">
							<div class="about">请输入联系方式</div>
							<input id="phone" name="phone" class="input" type="text" value="">
						</div>
						
						<div class="inputFrame">
							<div class="about">请输入地址</div>
							<select id="cmbProvince" name="cmbProvince"></select>    
							<select id="cmbCity" name="cmbCity"></select>    
							<select id="cmbArea" name="cmbArea"></select>
						</div>
						
						
						<div class="inputFrame">
							<div class="about">请输入详细地址</div>
							<input id="addr" name="addr" class="input" type="text" value="">
						</div>
						
						<br/><br/>
						<button type="button" onclick="addrAdd()" class="btn btn-primary">保存</button>
						<%-- <input id="user_id" name="user_id" type="hidden" value="${sessionScope.user.id}"> --%>
						<input id="action" name="action" type="hidden" value="action">
						<input id="id" name="id" type="hidden" />
					</li>
				</ul>
			</div>
		</form>
		</div>
	</div>
	<div class="maskBG"></div>
</div>


</div>

<script type="text/javascript" src="${ctxstatic}/scripts/address.js" charset="UTF-8"></script>
<script>
//加载省市县
addressInit('cmbProvince', 'cmbCity', 'cmbArea');  

//收获地址验证添加
function addrAdd(){
	//alert($("#cmbProvince").val());
	if($("#name").val().length <= 0){
		layer.msg("姓名不能为空");
	}else if($("#phone").val().length <= 0){
		layer.msg("电话不能为空");
	}else if($("#cmbProvince").val() == "请选择省份"){
		layer.msg("请选择省份");
	}else if($("#addr").val().length <= 0){
		layer.msg("详细地址不能为空");
	}else{
	   var myreg = /^[1][3,4,5,6,7,8][0-9]{9}$/;  
	   if (!myreg.test($("#phone").val())) {  
		   layer.msg("手机号码输入有误");
	   }else{
		   document.userAddr.submit();
	   }
	}
}

// 删除地址
function deleteAddr(id){
		$.ajax({
            type: 'POST',
        url: '${ctx}/user/addrDelete',
        data: {
            id: id
        },
        dataType: 'json',
        success: function (data) {
            if (data.success) {
            	location.href='${ctx}/user/addr';
            }
        },
        error: function () {
            alert("出现错误！");
        }
    });
}

// 设置默认地址
function defaultAddr(id){
	$.ajax({
        type: 'POST',
        url: '${ctx}/user/addrDefault',
        data: {
            id: id
        },
        dataType: 'json',
        success: function (data) {
            if (data.success) {
            	location.href='${ctx}/user/addr';
            }
        },
        error: function () {
            alert("出现错误！");
        }
    });
}

/*function editAddr(id){
	//forgetPwd();
	//changeStep();
	 $.ajax({
        type: 'POST',
        url: '${ctx}/user/userAddrEdit',
        data: {
            id: id
        },
        dataType: 'json',
        success: function (data) {
        	alert("出现错误！");
            if (data.success) {
            	//location.href='${ctx}/user/userAddr';
            	alert("出现错误！");
            	$("#id").val(data.obj.id);
            	$("#name").val(data.obj.name);
            	$("#phone").val(data.obj.phone);
            	$("#addr").val(data.obj.addr);
            }
        },
        error: function () {
            alert("出现错误！");
        }
    }); 
}*/
</script>
	<script type="text/javascript" src="${ctxstatic}/front/randomCode.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/sign.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>
	<script type="text/javascript" src="${ctxstatic}/scripts/address.js" charset="UTF-8"></script>
	
<%@include file="/common/frontLogin.jspf"%>
</body></html>