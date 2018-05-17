$(document).ready(function(){
	var step = $("#container").data("step");
	
	//隐藏MiniCart
	$.header({type:"hide"});
	
	$(".fpThumb").each(function(){
		var obj = $(this);
		var thumb = obj.data("thumb");
		var QNDomain = $.imgupload({type:"getdomain"});
		if(thumb.indexOf("QN") >= 0){
			thumb = thumb.replace("QN/",QNDomain)
		}
		
		obj.attr("src",thumb);
	});
	
	switch(step){
		case "cart":
			//购物车页面，初始化
			$.cartPage({type:"init"});
			//收藏列表和相关产品列表交互
			$(".simpleProductList").each(function(){
				var obj = $(this);
				simpleProductList(obj);
			});
			break;
		case "checkout":
			$.checkOut({type : "init"});
			break;
	}
	
	//判断是否是心愿单产品
	$("#cartFrame .cartList .td").each(function(index){
		var obj = $(this);
		var wid = obj.data("gid");
		var isWishlist = obj.data("wishlist") + "";
		if(isWishlist == "1"){
			setWishlistInfo(obj,wid);
		}
	});
	
	//心愿单产品数据显示
	function setWishlistInfo(liObj,wid){
		$.wishlist({type:"getone",wid:wid,fun:function(jsonObj){
			var htmlStr = wishlistProductListHtml(jsonObj.child);
			var essence = jsonObj.recommend + "";
			liObj.css({height:"auto"});
			liObj.append(htmlStr).ready(function(){
				liObj.find(".btn button").on("mousedown",function(){
					var btnObj = $(this);
					var ifShowAll = btnObj.data("showall");
					liObj.find(".subList .li").show();
					btnObj.parent().remove();
				});
			});
			if(essence == "2"){
				var oldNameStr = liObj.find(".productName .con").html();
				oldNameStr = '<img class="essence" src="themes/dfcn_v3/images/essence.png" alt="essence">' + oldNameStr;
				liObj.find(".productName .con").html(oldNameStr);
			}
		}});
		function wishlistProductListHtml(data){
			var htmlStr = '';
			var beginShowNum = 3;
			var leg = data.length;
			
			htmlStr = ''
			+'<div class="subList">';
			for(var i in data){
				var hideClass = "";
				var imageUrl = data[i].image;
				var QNDomain = $.imgupload({type:"getdomain"});
				
				if(i > (beginShowNum - 1)){
					hideClass = "display:none;"
				}else{
					hideClass = "display:block;"
				}
				
				if(imageUrl.indexOf("QN") >= 0){
					imageUrl = imageUrl.replace("QN/",QNDomain)
				}
				
				htmlStr = htmlStr
				+'	<div class="li" style="'+ hideClass +'">'
				+'		<div class="line"></div>'
				+'		<div class="thumb"><img src="'+ imageUrl +'" alt="productimage"></div>'
				+'		<div class="name"><div class="con">'+ data[i].name +'</div></div>'
				+'		<div class="num">'+ data[i].number +'</div>'
				+'	</div>';
			}
			if(leg > beginShowNum){
				htmlStr = htmlStr
				+'	<div class="btn"><button data-showall="0">显示全部</button></div>';
			}
			htmlStr = htmlStr
			+'</div>';
			return htmlStr;
		}
	}
	
	//简单列表切换
	function simpleProductList(parObj){
		var listObj = parObj.find("ul");
		var pageObj = parObj.find(".title .rf");
		var pBtn = pageObj.find(".prevBtn");
		var nBtn = pageObj.find(".nextBtn");
		var pageNameObj = pageObj.find("b");
		var leg = listObj.find("li").length;
		var totWNum,liWNum=242,maxPage,nowPage=0;
		var num = 5;
		var moveOneNum = liWNum * num;
		
		if(leg < 1){
			return;
		}
		
		if(leg % num == 0){
			maxPage = leg/num;
		}else{
			maxPage = Math.ceil(leg/num);
		}
		
		totWNum = liWNum * leg;
		listObj.width(totWNum);
		pageNameObj.html(nowPage+1);
		nHide();
		
		pBtn.on('mousedown',function(){
			nowPage = nowPage - 1;
			if(nowPage < 0){
				nowPage = 0;
			}
			move();
		});
		
		nBtn.on('mousedown',function(){
			nowPage = nowPage + 1;
			if(nowPage > (maxPage-1)){
				nowPage = maxPage - 1;
			}
			move();
		});
		
		function move(){
			var moveNum = -(moveOneNum * nowPage);
			pageNameObj.html(nowPage+1);
			if(nowPage == (maxPage - 1)){
				pHide();
			}else if(nowPage == 0){
				nHide();
			}else{
				npShow();
			}
			listObj.animate({marginLeft:moveNum},function(){});
		}
		function nHide(){
			nBtn.css({"opacity":1,"cursor":"pointer"});
			pBtn.css({"opacity":0,"cursor":"default"});
		}
		function npShow(){
			nBtn.css({"opacity":1,"cursor":"pointer"});
			pBtn.css({"opacity":1,"cursor":"default"});
		}
		function pHide(){
			nBtn.css({"opacity":0,"cursor":"default"});
			pBtn.css({"opacity":1,"cursor":"pointer"});
		}
	}
});

