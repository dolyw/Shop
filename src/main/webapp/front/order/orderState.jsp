<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>结算</title>
	<%@include file="/common/front.jspf"%>

	<link href="${ctxstatic}/front/flow.css" rel="stylesheet" type="text/css">
	<link href="${ctxstatic}/front/sign.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrapper">
	<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>
	
	<%@include file="/front/common/headerFrame.jsp"%>
	
	<div id="container" data-step="checkout">
		<div class="crumbs">
			<div class="lf">
				当前位置: <a href="">首页</a> &gt;结算</div>
		</div>
				
				<div id="checkoutFrame">
			<div class="title">
				结算<!-- <span>Checkout</span> -->
			</div>
			
						
			<div class="addressFrame">
				<div class="tit">收货人信息</div>
				
				<div class="list" style="display: block;">
									<ul>
										<c:forEach var="userAddr" items="${userAddrs}">
											<c:if test="${userAddr.defaults eq '1'}">
													<li id="addrSelect" class="ads select" value="${userAddr.id}" onclick="clickAddr(this)">	
														<div class="default" style="display: block;">默认地址</div>	
														<div class="options">
															<%-- <a class="editBtn" onclick="editAddr(${userAddr.id})">编辑</a> --%>
															<a class="delBtn" onclick="deleteAddr(${userAddr.id})">删除&nbsp;&nbsp;&nbsp;</a>
														</div>	
														
														<div class="consignee"><b>${userAddr.name}</b><span>${userAddr.phone}</span></div>	
														<div class="address">${userAddr.addr}</div>
													</li>	
											</c:if>
											
											<c:if test="${userAddr.defaults eq '0'}">
												<li class="ads" value="${userAddr.id}" onclick="clickAddr(this)">	
													<div class="setDefault"><a onclick="defaultAddr(${userAddr.id})">设为默认地址</a></div>	
													<div class="options">
														<%-- <a class="editBtn" onclick="editAddr(${userAddr.id})">编辑</a> --%>
														<a class="delBtn" onclick="deleteAddr(${userAddr.id})">删除&nbsp;&nbsp;&nbsp;</a>
													</div>	
													
													<div class="consignee"><b>${userAddr.name}</b><span>${userAddr.phone}</span></div>	
													<div class="address">${userAddr.addr}</div>
												</li>
											</c:if>
										</c:forEach>
										<li class="forgetPwd" style="display: list-item;"><a class="addNewAddress">新增收货地址</a></li>
									</ul>
				</div>
				
				<div class="clear"></div>
			
			</div>
			
			<div class="defaultFrame payFrame">
				<div class="tit">支付方式</div>
				<ul>
					<li class="small select" onclick="clickPay(this)" value="1">
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>
						<img class="payIcon" src="${ctxstatic}/front/payIcon_3.png" alt="支付宝">
					</li>
					<%-- <li class="small" onclick="clickPay(this)" value="2">
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>
						<img class="payIcon" src="${ctxstatic}/front/payIcon_7.png" alt="微信支付">
					</li> --%>
					<%-- <li class="small " onclick="clickPay(this)" value="3">
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>
						<img class="payIcon" src="${ctxstatic}/front/payIcon_6.png" alt="银联在线支付">
					</li>
					<li class="small " onclick="clickPay(this)" value="4">
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>
						<img class="payIcon" src="${ctxstatic}/front/payIcon_1.png" alt="货到付款">
					</li>
					<li class="big" onclick="clickPay(this)" value="5">
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>
						<img src="${ctxstatic}/front/payIcon_4.png" alt="银行汇款/转帐">
						<span>公司名称：XXXXXXXXXXXX公司<br/>
						开户银行：中国建设银行上海张江支行<br/>
						公司帐号：XXXX XXXX XXXX XXXX XXXX</span>
					</li> --%>
				</ul>
			</div>
			
			<div class="defaultFrame distributionFrame">
				<div class="tit">配送方式</div>
				<ul>
					<li class="big2 select" onclick="clickCourier(this)" value="1">	
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>	
						<img src="${ctxstatic}/front/distribution_14.png" alt="无">	
						<div class="desc">无</div>	<i>￥0</i>
					</li>
					<%-- <li class="big2" onclick="clickCourier(this)" value="2">	
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>	
						<img src="${ctxstatic}/front/distribution_13.png" alt="全球最大快递运输公司。">
						<div class="desc">全球最大快递运输公司。</div>	<i>￥22</i>
					</li> --%>
					<%-- <li class="big2" onclick="clickCourier(this)" value="2">	
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>	
						<img src="${ctxstatic}/front/distribution_15.png" alt="无">	
						<div class="desc">无</div>	<i>￥0</i>
					</li>
					<li class="big2" onclick="clickCourier(this)" value="3">	
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>	
						<img src="${ctxstatic}/front/distribution_11.png" alt="江、浙、沪地区首重为6元/KG，其他地区12元/KG， 续重均为2-8元/KG，以地区而异">	
						<div class="desc">江、浙、沪地区首重为6元/KG，其他地区12元/KG， 续重均为2-8元/KG，以地区而异</div>	<i>￥0</i>
					</li> --%>
					<li class="big2" onclick="clickCourier(this)" value="4">	
						<b><img src="${ctxstatic}/front/payHoverIcon.png" alt="icon"></b>	
						<img src="${ctxstatic}/front/distribution_17.png" alt="邮费到付，包裹收到之后支付邮费给快递。费用以实际收到包裹，快递公司提供价格为准。">	
						<div class="desc">邮费到付，包裹收到之后支付邮费给快递。费用以实际收到包裹，快递公司提供价格为准。</div>	<i>￥0</i>
					</li>
				</ul>
			</div>
			
			<div class="checkoutShopList">
				<div class="tit">商品列表</div>
				<div class="list">
					<ul>
						<li class="tr">
							<div class="name">商品名称</div>
							<!-- <div class="spec"></div> -->
							<div class="price">单价</div>
							<div class="number">购买数量</div>
							<div class="subtotal">小计</div>
						</li>
						
						<c:forEach var="userShop" items="${userShops}">
						<li class="td">
							<div class="thumb">
								<a href="${ctx}/index/itemDetail?id=${userShop.item.id}" target="_blank">
									<img class="lazyimg" src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-original="${nginxPic}/${userShop.item.picture}" border="0" title="${userShop.item.name}" alt="${userShop.item.name}">
								</a>
							</div>
							<div class="productName">
								<div class="con">
									<a href="${ctx}/index/itemDetail?id=${userShop.item.id}" target="_blank">${userShop.item.name}</a>
									<span></span>
								</div>
							</div>
							<!-- <div class="spec"></div> -->
							<div class="price">￥${userShop.item.price}</div>
							<div class="number">${userShop.count}</div>
							<div class="subtotal">￥${userShop.price}</div>
						</li>
						</c:forEach>
											</ul>
				</div>
				<div class="clear"></div>
			</div>
			
						
				<%-- <div class="defaultFrame invoiceFrame">
				<div class="tit">
					<div class="text">开具发票</div>
					<button id="useInvoice"><img src="${ctxstatic}/front/gouxuan.png" alt="selectIcon"></button><span>注：商品总额满200元可申请开具发票</span>
				</div>
				</div> --%>
				
				<div class="defaultFrame discountFrame otherFrame">
				<div class="tit">其他信息</div>
				<div class="inputFrame">
					<ul>
						<li style="height: 70px;">
							<div class="firstTit">备注</div>
							<div class="input">
								<textarea id="remarks" class="remarks" name="" value=""></textarea>
								<!--<input id="remarks" class="remarks" type="text" value=""/>-->
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="defaultFrame totalFrame">
				<div class="li">
					<b id="totShow_goodsprice">￥${total}</b>
					<span>商品总额：</span>
				</div>

				<div class="li">
					<b id="totShow_distribution">￥0</b>
					<span>配送费用：</span>
					<!-- <i id="totShow_weight">0.113KG</i>
					<span>总重量：</span> -->
				</div>
			</div>
			
			<div class="defaultFrame totalFrame">
				<div class="li">
					<b id="totShow_price" class="totalPrice">￥${total}</b>
					<span>应付总额：</span>
				</div>
				
			</div>
			
			<div class="btnFrame">
				<button class="sumbmit" onclick="subOrder()">提交订单</button>
				<a href="${ctx}/user/shop"><button id="backBtn" class="back">返回购物车</button></a>
			</div>
			<form id="checkoutForm" name="checkoutForm" action="${ctx}/order/pay" method="post" style="display: none;">
				<input id="useraddr_id" name="useraddr_id" type="hidden" value="0">
				<input id="pay" name="pay" type="hidden" value="1">
				<input id="courier" name="courier" type="hidden" value="1">
				<input id="price" name="price" type="hidden" value="${total}">
			</form>
		</div>
		

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
						<%-- <input id="userId" name="userId" type="hidden" value="${sessionScope.user.id}"> --%>
						<input id="action" name="action" type="hidden" value="userState">
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
// 默认加载地址
$(window).load(function(){
	$("#useraddr_id").val($("#addrSelect").val());
});

// 收获地址验证添加
function addrAdd(){
	//alert($("#cmbProvince").val());
	if($("#name").val().length <= 0){
		layer.msg("姓名不能为空");
	}else if($("#phone").val().length <= 0){
		layer.msg("手机号码不能为空");
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

// 提交订单
function subOrder(){
	if($("#useraddr_id").val() == 0){
		layer.msg("请选择收货地址");
	}else{
		document.checkoutForm.submit();
	}
}

// 计算总价格
function totalPrice(){
	var price = $("#totShow_price").html().substring(1);
	$("#price").val(price);
	//alert($("#price").val());
}

// 获取收货地址
function clickAddr(obj){
	$(obj).parent().children("li").removeClass("ads select");
	$(obj).parent().children("li").addClass("ads");
	$(obj).addClass("ads select");
	$("#useraddr_id").val($(obj).val());
	//alert($("#useraddr_id").val());
}

// 获取支付方式
function clickPay(obj){
	$(obj).parent().children("li").removeClass("small select");
	$(obj).parent().children("li").addClass("small");
	$(obj).addClass("small select");
	$("#pay").val($(obj).val());
	//alert($("#pay").val());
}

// 获取快递方式
function clickCourier(obj){
	$(obj).parent().children("li").removeClass("big2 select");
	$(obj).parent().children("li").addClass("big2");
	$(obj).addClass("big2 select");
	$("#courier").val($(obj).val());
	totalPrice();
	//alert($("#courier").val());
}

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
            	location.href='${ctx}/order/state';
            }
        },
        error: function () {
            alert("出现错误！");
        }
    });
}

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
            	location.href='${ctx}/order/state';
            }
        },
        error: function () {
            alert("出现错误！");
        }
    });
}
</script>
	<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/randomCode.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/sign.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>
<%@include file="/common/frontLogin.jspf"%>
</body></html>