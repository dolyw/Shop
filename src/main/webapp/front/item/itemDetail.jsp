<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	
	<title>商品详细</title>
	
	<%@include file="/common/front.jspf"%>
	
	
	<link href="${ctxstatic}/front/goods.css" rel="stylesheet" type="text/css">
	
	</head>
<body>

<div id="wrapper">
	<div style="display: none;" id="userTokenPost" data-token=""></div>
<div id="loginDFCN" style="position: fixed;top: 0;left: 0;width: 200px;height: 50px;border: 3px solid #000000;display: none;">
	
</div>
	<%@include file="/front/common/headerFrame.jsp"%>
	
	<div id="container" data-gid="1604">
		<div class="top">
			<div class="crumbs">
				<div class="lf">
					当前位置: <a href="">首页</a> &gt;${item.name}</div>
			</div>
			<div class="clear"></div>
			<div class="topCon">
				<div class="thumbBook lf">
					<div class="lf img">
						<div class="imgInfo">
							<img src="${nginxPic}/${item.picture}" data-original="${nginxPic}/${item.picture}" >
					    </div>
					</div>
					<div class="lf conImg">
												<!-- <span class="spanTop">︿</span> -->
						<div class="gallery">
							<ul>
								<c:if test="${item.picture != null}">
																<li>
									<a href="javascript:;" data-url="${nginxPic}/${item.picture}" title="">
										<img src="${nginxPic}/${item.picture}" data-original="${nginxPic}/${item.picture}"  class="onbg">
									</a>
								</li>
								</c:if>
								<c:if test="${itemDetail.picture1 != null}">
																<li>
									<a href="javascript:;" data-url="${nginxPic}/${itemDetail.picture1}" title="">
										<img src="${nginxPic}/${itemDetail.picture1}" data-original="${nginxPic}/${itemDetail.picture1}"  class="onbg">
									</a>
								</li>
								</c:if>	
								<c:if test="${itemDetail.picture2 != null}">
																<li>
									<a href="javascript:;" data-url="${nginxPic}/${itemDetail.picture2}" title="">
										<img src="${nginxPic}/${itemDetail.picture2}" data-original="${nginxPic}/${itemDetail.picture2}"  class="autobg">
									</a>
								</li>
								</c:if>
								<c:if test="${itemDetail.picture3 != null}">
																<li>
									<a href="javascript:;" data-url="${nginxPic}/${itemDetail.picture3}" title="">
										<img src="${nginxPic}/${itemDetail.picture3}" data-original="${nginxPic}/${itemDetail.picture3}"  class="autobg">
									</a>
								</li>
								</c:if>
								<c:if test="${itemDetail.picture4 != null}">
																<li>
									<a href="javascript:;" data-url="${nginxPic}/${itemDetail.picture4}" title="">
										<img src="${nginxPic}/${itemDetail.picture4}" data-original="${nginxPic}/${itemDetail.picture4}"  class="autobg">
									</a>
								</li>
								</c:if>
								<c:if test="${itemDetail.picture5 != null}">
																<li>
									<a href="javascript:;" data-url="${nginxPic}/${itemDetail.picture5}" title="">
										<img src="${nginxPic}/${itemDetail.picture5}" data-original="${nginxPic}/${itemDetail.picture5}"  class="autobg">
									</a>
								</li>
								</c:if>
															</ul>
						</div>
						<!-- <span class="spanBootm">﹀</span> -->
											</div>
				</div>
				<div class="lf conMes">
					<div class="goodsTitle">${item.name}</div>
					<div class="goodsMes" data-stock="37" data-price="60.00" data-promote="0" data-vip="">
						<div class="comPrice"> 
					        <div>
						     	<font class="shopprice" id="ECS_SHOPPRICE">￥${item.price}</font>
						     	<span id="priceOld" name="priceOld" style="display:none">${item.price}</span>
						     	<span id="itemId" name="itemId" style="display:none">${item.id}</span>
						    </div>
					   </div>
				     	 
						<div class="goodsDetial">
							
						    <div class="clearfix">
					    			<div class="name">品牌</div>
					    		<div class="content2">${item.brand}</div>
						    		
							</div>
							
							<div class="clearfix">
					    		
						    	<div class="name">分类</div>
					    		<div class="content2">${item.itemCategoryDetail.name}</div>
							</div>
									    
						    <!-- <div class="clearfix commentSource" data-source="5">
						    	<div class="name">评价</div>
						    	<div class="content rank" data-rank="5">
						    		
						    		已有<b class="commentTotNum">0</b>人评价
						    	</div>
						    </div> -->
						    <!-- <div class="clearfix">
						    	<div class="name"><h4>服务承诺</h4></div>
					    			<div class="content2"><h4></h4></div>
						    	<div class="name"><h4>正品保证</h4></div>
					    			<div class="content2"><h4></h4></div>	
							</div> -->
						    
						    <div class="clearfix">
						    	<div class="name">库存</div>
					    			<div class="content2"><span id="stock" name="stock">${item.stock}</span></div>
							</div>
						    <div class="clearfix">
						    	<div class="name">数量</div>
						    	
						    		<div class="numberSelect">
						    			<a href="javascript:void(0);" onclick="numDel()" class="sub">-</a> 
										<input name="number" id="number" data-type="nochange" type="text" class="inum" value="1" maxlength="2" onblur="modifyNum(this)"
										onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
										onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}">
										<a href="javascript:void(0);" onclick="numAdd()" class="add">+</a>
						    		</div>
						    		
						    	
						    </div>
						    <div class="clearfix">
						    	<div class="name">小计</div>
					    			<div class="content2">￥<span id="price" name="price">${item.price}</span></div>
							</div>
						    
					    </div>	
					    
					</div>
					    <div class="gotoBuy">
							<a data-gid="1604" href="#" onclick="addshop()" class="addCartBtn addCart">加入购物车</a>
							<!-- <a data-gid="1604" href="javascript:;" class="buyNow">立即购买</a> -->
						</div>
				</div>
				
				<!-- <div class="lf conright">备用</div> -->
								
			</div>
		</div>
		<div class="middle">
			<div class="lf">
				<div id="box">
					
					<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
					  <ul class="layui-tab-title">
					    <li class="layui-this"><span style="font-size: 16px;font-weight: bolder;">产品描述</span></li>
					    <li><span style="font-size: 16px;font-weight: bolder;">资料下载</span></li>
					  </ul>
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show">${itemDetail.intro}</div>
					    <div class="layui-tab-item">资料为空</div>
					  </div>
					</div>
					
				</div>
												
			</div>
			
			<div class="rf sider">
				
				<div class="content" id="bowserHitory">
					<a href="javascript:;" class="topTitle">浏览历史</a>
					<ul class="clearfix">
						<c:forEach var="item" items="${historyItems}">
						<li class="goodsimg">
							<a href="${ctx}/itemDetail?id=${item.id}" target="_blank">
							<img class="lazyimg" src="${nginxPic}/${item.picture}" data-original="${nginxPic}/${item.picture}" alt="${item.name}">
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
		<div class="clear"></div>
	</div>
	
<%@include file="/front/common/footerFrame.jsp"%>
</div>

<script>

function numAdd(){
	if(Number($("#number").val()) > Number($("#stock").html())){
		layer.msg("库存不足");
	}else{
		var num = Number($("#number").val()) + 1;
		$("#number").val(num);
	}
	prices();
}

function numDel(){
	if(Number($("#number").val()) > 1){
		var num = Number($("#number").val()) - 1;
		$("#number").val(num);
	}
	prices();
}

//数量输入框
function modifyNum(objs){
	//库存
	var stock = $("#stock").html();
	//alert($(objs).val());
	if($(objs).val() == ''){
		$(objs).val("1");
		//alert($(objs).val());
	}
	if($(objs).val() > stock){
		$(objs).val(stock);
		layer.msg("库存不足");
	}
	prices();
}

function addshop(){
	//alert($("#number").val());
	//alert($("#stock").html());
	var stock = $("#stock").html() - $("#number").val();
	if(stock < 0){
		layer.msg("库存不足");
	}else if(${empty sessionScope.user}){
		layer.msg("请登录后再加入购物车");
	}else{
		$.ajax({
            type: 'POST',
            url: '${ctx}/user/addShop',
            data: {
            	count : $("#number").val(),
            	price : $("#price").html(),
            	itemId : $("#itemId").html()
            },
            dataType: 'json',
            success: function (data) {
            	if (data.success) {
                	//$("#stock").html(data.obj.stock);
                	layer.msg(data.msg);
                }else{
                	layer.msg(data.msg);
                }
            },
            error: function () {
            	layer.msg("error");
            	//alert("error");
            }
        });
	}
	
}

// 价格小计
function prices(){
	//var priceOld = $("#price").html();
	var price = accMul($("#priceOld").html(), $("#number").val());
	$("#price").html(price);
}

// 乘法计算
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
</script>
	<script type="text/javascript" src="${ctxstatic}/front/config.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/header.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/footer.js"></script>
	<script type="text/javascript" src="${ctxstatic}/front/goods.js"></script>
		
<%@include file="/common/frontLogin.jspf"%>
</body></html>