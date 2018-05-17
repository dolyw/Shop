<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>购物车</title>
	<%@include file="/common/front.jspf"%>
	
	<link href="${ctxstatic}/front/flow.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<div id="wrapper">
	<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	

</div>
	
	<%@include file="/front/common/headerFrame.jsp"%>

	<div id="container" data-step="cart">
		<div class="crumbs">
			<div class="lf">
				当前位置: <a href="${ctx}/index">首页</a> &gt; 购物车</div>
		</div>
				<div id="cartFrame">
			<div class="title">
				我的购物车<!-- <span>My Shopping Cart</span> -->
			</div>
			
			<c:if test="${userShops.size() == 0}">
			<div class="cartListMenu">
				<div class="lf">当前购物车为空<span class="totNum"></span></div>
			</div>
			</c:if>
			<c:if test="${userShops.size() != 0}">
			<div class="cartListMenu">
				<div class="lf">全部商品<span class="totNum"></span></div>
				<%-- <div class="rf">总数量：<span class="totWeight">${userShops.size()}</span></div> --%>
			</div>
			
			<div class="cartList">
				<ul>
					
					<li id="desc" class="tr">
						<div class="name">&nbsp;&nbsp;&nbsp;商品名称</div>
						<div class="spec">库存</div>
						<div class="price">单价</div>
						<div class="number">购买数量</div>
						<div class="subtotal">小计</div>
						<div class="options">操作</div>
					</li>
					
					<c:forEach var="userShop" items="${userShops}">
					<li class="td">
						<div class="thumb">
							<a href="${ctx}/itemDetail?id=${userShop.item.id}"><img class="lazyimg" src="${ctxstatic}/vendor/jquery_lazyload-1.7.2/img/grey.gif" data-original="${nginxPic}/${userShop.item.picture}" border="0" title="${userShop.item.name}" alt="${userShop.item.name}">
							</a>
						</div>
						<div class="productName">
							<div class="con">
								<a href="${ctx}/itemDetail?id=${userShop.item.id}">${userShop.item.name}</a>
								<span></span>
							</div>
						</div>
						<div class="spec"><span id="stock">${userShop.item.stock}</span><span id="stockMsg"></span></div>
						
						<div class="price" id="price">
							￥<span id="prices">${userShop.item.price}</span>				</div>
						<div class="number">
							<div class="con">
								<div class="numberSelect">
						    			<a href="javascript:void(0);" onclick="numDel(${userShop.id}, this)" class="sub">-</a> 
										<input name="number" id="number" type="text" class="inum" value="${userShop.count}" onblur="modifyNum(${userShop.id}, this)" maxlength="2"
										onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
										onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}">
										<a href="javascript:void(0);" onclick="numAdd(${userShop.id}, this)" class="add">+</a>
						    	</div>
							</div>
							
						</div>
						
						<div class="subtotal">￥<span id="priceTotal">${userShop.price}</span></div>
						<div class="options">
							<a onclick="del(${userShop.id}, this)" href="#">删除</a>
						</div>
					</li>
				</c:forEach>
				
				</ul>
			</div>
			
			
			
			<div class="totoal">
				<%-- <div class="lf">
					共计<i class="totPrice">${userShops.size()}</i>件商品
				</div> --%>
				<div class="rf">

                    <div class="btnFrame">
				<a href="${ctx}/order/state"><button class="toCheckOutBtn">结算</button></a>
			</div>
					<!-- <span>总重量：<b class="totWeight">0.008</b></span> --><span>总计(不含运费)：<i class="totPrice">￥${total}</i></span>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			</c:if>
				        
	        		</div>
        	</div>

	<%@include file="/front/common/footerFrame.jsp"%>
</div>

<script>

//乘法计算
function accMul(arg1, arg2) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try {
        m += s1.split(".")[1].length;
    }
    catch (e) {
    }
    try {
        m += s2.split(".")[1].length;
    }
    catch (e) {
    }
    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
}

//数量添加
function numAdd(id, objs){
	//alert($(objs).parent().children("#number").val());
	//库存
	var stock = $(objs).parent().parent().parent().parent().children().children("#stock").html();
	var num = Number($(objs).parent().children("#number").val()) + 1;
	if(num > stock){
		layer.msg("库存不足");
	}else{
		$(objs).parent().children("#number").val(num);
		modifyShop(id, objs);
	}
}
// 数量减少
function numDel(id, objs){
	//库存
	var stock = $(objs).parent().parent().parent().parent().children().children("#stock").html();
	var num = Number($(objs).parent().children("#number").val()) - 1;
	if(num > stock){
		layer.msg("库存不足");
	}else{
		if(num > 0){
			$(objs).parent().children("#number").val(num);
		}
		modifyShop(id, objs);
	}
}
// 数量输入框
function modifyNum(id, objs){
	//库存
	var stock = $(objs).parent().parent().parent().parent().children().children("#stock").html();
	//alert($(objs).val());
	var num = $(objs).parent().children("#number").val();
	if($(objs).val() == ''){
		$(objs).val("1");
		//alert($(objs).val());
	}
	if(num > stock){
		$(objs).val(stock);
		layer.msg("库存不足");
	}else{
		modifyShop(id, objs);
	}
}

function modifyShop(id, objs){
	//alert($(objs).parent().parent().parent().parent().children().children("#prices").html());
	// 数量
	var number = $(objs).parent().children("#number").val();
	// 单价
	var prices = $(objs).parent().parent().parent().parent().children().children("#prices").html();
	// 单个商品总价
	var priceTotal = accMul(number, prices);
	$.ajax({
        type: 'POST',
        url: '${ctx}/user/addShop',
        data: {
        	count : number,
        	price : priceTotal,
        	id : id
        },
        dataType: 'json',
        success: function (data) {
        	if (data.success) {
        		$(objs).parent().parent().parent().parent().children().children("#priceTotal").html(priceTotal);
        		// 所有商品总计
        		var totPrice = 0;
        		$("span[id^='priceTotal']").each(function(i) {
        			totPrice = Number(totPrice) + Number($(this).html());
        			//alert($(this).html());
        			//$(this).attr('id');
        		});
        		// 四舍五入保留两位小数
        		totPrice = totPrice.toFixed(2);
        		$(".totPrice").html("￥" + totPrice);
            }else{
                layer.msg(data.msg);
            }
        },
        error: function () {
            layer.msg(data.msg);
        }
    });
}

// 命名obj会和date.obj重名
function del(id, objs){
	//alert("d");
	$.ajax({
            type: 'POST',
            url: '${ctx}/user/shopDelete',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (data) {
            	if (data.success) {
            		layer.msg("删除成功");
            		
                }
            },
            error: function () {
            	layer.msg("删除成功");
            }
        });
	objs.parentNode.parentNode.parentNode.removeChild(objs.parentNode.parentNode);
}
</script>
	<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	
<%@include file="/common/frontLogin.jspf"%>
</body></html>