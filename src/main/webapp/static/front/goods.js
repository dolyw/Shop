$(document).ready(function(){
	var specId = -1,num = 1,haveSpec = false;
	var allPrice=0;
	
	thumbBook();
	changeSelectNum($(".goodsDetial .numberSelect"));
	setComment();
	specSelect();
	setCommentsList();
	countdown();
	
	//计算组合总价格
	$("#container .middle .sider .pro ul li").each(function() {			
			s = $(this).children('font').text();
			s = s.substring(1);
			s = parseInt(s);
			allPrice += +s;
		});
	$('#container .middle .sider .cp_price #totalPrice').text('￥'+allPrice);
	$(".collect").each(function(){
		var obj = $(this);
		var gId = obj.data("gid");
		collect(gId,obj,"get");
		obj.on('mousedown',function(){
			var nowObj = $(this);
			var nowGId = nowObj.data("gid");
			collect(nowGId,nowObj);
		});
	});
	
	$(".addCartBtn").on('mousedown',function(){
		var obj = $(this);
		var gId = obj.data("gid");
		var num = $(".goodsDetial .numberSelect .inum").val();
		var options = {
			quick : 1,
			spec : -1,
			number : num,
			parent : 0
		};
		options.spec = specId;
		addToCart(gId,options);
	});
	
	$(".buyNow").on('mousedown',function(){
		var obj = $(this);
		var gId = obj.data("gid");
		var num = $(".goodsDetial .inum").val();
		var options;
		
		specId = gId;
		
		if(isNaN(num)){
			num = 1;
		}
		
		options = {
			quick : 1,
			spec : -1,
			number : parseInt(num),
			parent : 0
		};
		
		console.log(haveSpec,specId)
		
		if(haveSpec == true && specId < 1){
			S_PATH.tips("必须选择一个款式！");
			return;
		}
		options.spec = specId;
		
		console.log(options)
		
		if(obj.hasClass("destroy")){
			return;
		}
		addToCart(gId,options,function(){
			S_PATH.jumpUrl("");
		});
	});
	
	$(".commentSource .rank").on("mousedown",function(){
		jumpComment();
	});
	
	$(".prodectComment").on("mousedown",function(){
		jumpComment();
	});
	
	$(".prodectRelevant").on("mousedown",function(){
		jumpRelevant();
	});
	
	$(".thumbBook .imgInfo img").on("mousedown",function(){
		var obj = $(this);
		showBigPhone(obj);
	});
	mdShow();
	partsListShow();
	//心愿单配件列表
	function partsListShow(){
		var parObj = $("#goodDescFrame");
		var listObj = parObj.find("#partsList");
		var ifWishlist = parObj.data("ifwl") + "";
		var wid = listObj.data("gid");
        
		if(ifWishlist != "0"){
			$.wishlist({type:"getpartslist",wid:wid,fun:function(htmlStr){
				listObj.html(htmlStr).ready(function(){
					var salesObj = listObj.find(".partsTitle");
					var salesNum = salesObj.data("sales");
					$(".wlSales i").html(salesNum).ready(function(){
						$(".wlSales").show();
					});
				});
			}});
		}
	}
	//心愿单Makedown显示模式调整
	function mdShow(){
		var parObj = $("#goodDescFrame");
		var ifWishlist = parObj.data("ifwl") + "";
        
		if(ifWishlist != "0"){
			var testEditor;
	        $(function() {
	            testEditor = editormd("mdShowBox", {
	                width           : "100%",
	                height          : "auto",
	                autoHeight      : true,
	                path            : "js/mdediter/MELib/",
	                watch           : true,           // disable watch
	                readOnly        : true,
	                styleActiveLine : false,   // disable active line
	                lineNumbers     : false,      // hide line numbers
	                emoji           : true,//emoji表情，默认关闭
                    taskList        : true,
                    tocm            : true, // Using [TOCM]
                    tex             : true,// 开启科学公式TeX语言支持，默认关闭
                    flowChart       : true,//开启流程图支持，默认关闭
                    sequenceDiagram : true,//开启时序/序列图支持，默认关闭,
	                onload          : function(){
	                	onresizeFun();
	                },
	                onresize : function(){
	                	onresizeFun();
	                }
	            });
	        });
		}else{
			$("#mdShowBox").hide();
			$("#partsList").hide();
			$("#htmlShowBox").show();
		}
		function onresizeFun(){
			//隐藏编辑模式并整理调整
        	var MDEObj = $("#mdShowBox");
        	var editerObj = MDEObj.find(".CodeMirror-wrap");
        	var previewObj = MDEObj.find(".editormd-preview");
        	var previewConObj = previewObj.find(".editormd-preview-container");
        	MDEObj.css({"border":"none"});
        	editerObj.hide();
        	previewObj.css({"position":"relative","width":"100%","overflow":"hidden"});
        	previewConObj.css({"padding":"0","overflow":"hidden"});
		}
	}
	//图片放大显示
	function showBigPhone(obj){
		var imgUrl = obj.attr("src");
		var html;
		if(imgUrl.indexOf("?") > 0){
			imgUrl = imgUrl.split("?")[0];
		}
		html = getHtml(imgUrl);
		$("#wrapper").append(html).ready(function(){
			var parObj = $("#thumbShow");
			var imgFrameObj = parObj.find(".bigImage");
			var imgObj = imgFrameObj.find("img");
			var maskObj = parObj.find(".maskBG");
			var hNum = $(window).height();
			var wNum = $(window).width();
			var imgWNum = imgObj.width();
			var imgHNum = imgObj.height();
			var imgLNum = (wNum - imgWNum)/2;
			var imgTNum = (hNum - imgHNum)/2;
			
			S_PATH.addKeepRunFun("sourceThumbListen",function(){
				var w = imgObj[0].width;
				if(parseInt(w) > 0){
					imgWNum = imgObj.width();
					imgHNum = imgObj.height();
					imgLNum = (wNum - imgWNum)/2;
					imgTNum = (hNum - imgHNum)/2;
					parObj.css({height:hNum});
					maskObj.css({height:hNum});
					imgFrameObj.css({top:imgTNum,left:imgLNum});
					removeListen();
				}
			});
			
			maskObj.on("mousedown",function(){
				parObj.remove();
				removeListen();
			});
			
			function removeListen(){
				S_PATH.removeKeepRunFun("sourceThumbListen");
			}
		});
		function getHtml(imgUrl){
			var htmlStr = ''
			+'<div id="thumbShow">'
			+'	<div class="bigImage">'
			+'		<img src="'+ imgUrl +'" alt="productImage">'
			+'	</div>'
			+'	<div class="maskBG"></div>'
			+'</div>';
			return htmlStr;
		}
	}
	
	function countdown(){
		var parObj = $(".comPrice .surplusTime");
		var eTime = parObj.data("end");
		var bTime = 0;
		var nowTime = 0;
		var day = 0;
		var hour = 0;
		var minute = 0;
		var second = 0;
		var htmlStr = "";
		var oldHtml = "";
		
		if(bTime == undefined || eTime == undefined){
			return;
		}
		S_PATH.addKeepRunFun("countdownFun",function(){
			bTime = new Date().getTime();
			bTime = Math.floor(bTime/1000);
			nowTime = (eTime - bTime)/1;
			nowTime = Math.ceil(nowTime);
			day = Math.floor(nowTime/60/60/24);
			hour = Math.floor(nowTime/60/60);
			hour = hour%24;
			minute = Math.floor(nowTime/60);
			minute = minute%60;
			second = nowTime%60;
			htmlStr = day + '天' + hour + '小时' + minute + "分" + second + "秒";
			if(oldHtml != htmlStr){
				oldHtml = htmlStr;
				parObj.find("b").html(htmlStr);
			}
		});
	}
	
	function jumpRelevant(){
		var num = $(".about").offset().top - 70;
		$('body,html').animate({ scrollTop: num }, 500);
	}
	
	function jumpComment(){
		var num = $("#commentsFrame").offset().top - 70;
		$('body,html').animate({ scrollTop: num }, 500);
	}
	
	function setCommentsList(){
		var parameObj = S_PATH.getParame();
		var good_id = $("#container").data("gid");
		var pageNum = 1;
		var maxPageNum = 0;
		var totNum = 0;
		var size = 0;
		var moreBtn = $("#pageBar .moreBtn");
		var ifSetPage = false;
		var htmlStr = '';
		
		getList(good_id);
		//设置列表
		function setList(jsonObj){
			var commentTotNum = jsonObj.pager.record_count;
			$(".commentSource .commentTotNum").html(commentTotNum);
			if(commentTotNum == 0){
				$("#commentsFrame").hide();
				return;
			}
			for(var i in jsonObj.comment_list){
				htmlStr = htmlStr + getLiHtml(jsonObj.comment_list[i]);
			}
			$(".commentList").html(htmlStr).ready(function(){
				if(!ifSetPage){
					ifSetPage = true;
					setPage(jsonObj.pager);
				}
				$(".commentList .word .content img").on("mousedown",function(){
					var obj = $(this);
					showBigPhone(obj);
				});
			});
		}
		
		function setPage(data){
			totNum = parseInt(data.record_count);
			size = parseInt(data.size);
			$("#commentsFrame .peoCom .f1").html(totNum);
			
			if(totNum%size == 0){
				maxPageNum = totNum / size;
			}else{
				maxPageNum = Math.ceil(totNum / size);
			}
			
			moreBtn.on("mousedown",function(){
				pageNum = pageNum + 1;
				checkPage();
			});
		}
		
		function checkPage(){
			if(pageNum > maxPageNum){
				pageNum = maxPageNum;
			}else if(pageNum == maxPageNum){
				moreBtn.hide();
				getList(good_id);
			}else{
				getList(good_id);
			}
		}
		
		//获取
		function getLiHtml(data){
			var htmlstr = '';
			var imgHtml = '';
			var rankHtml = '';
			var replyHtml = '';
			
			if(data.photo1 != "" && data.photo1 != undefined){
				imgHtml = '<img src="'+ data.photo1 +'" alt="commentImage" />'
			}
			
			data.userHead = "themes/dfcn_v3/images/head.png";
			data.comment_rank = parseInt(data.comment_rank);
			
			for(var i=0;i<5;i++){
				if(i<data.comment_rank){
					rankHtml = rankHtml + '<i class="iconfont icon-five-pointed-star"></i>';
				}else{
					rankHtml = rankHtml + '<i class="iconfont icon-shoucang"></i>';
				}
			}
			
			if(data.admin_comment != "" && data.admin_comment != undefined){
				replyHtml = '<div class="adminComment"><span>掌柜回复：</span><p>'+ data.admin_comment +'</p></div>';
			}
			
			htmlstr = ''
			+'<div class="word">'
	   		+'	<div class="headFrame">'
	   		+'		<img src="'+ data.userHead +'" alt="" />'
	   		+'	</div>'
	   		+'	<div class="info">'
	   		+'		<p class="name">'+ data.user_name +'</p>'
	   		+'		<p class="time">'+ data.formated_add_time +'</p>'
	   		+'	</div>'
	   		+'	<div class="con">'
	   		+'		<div class="rank" data-rank="5">'+ rankHtml +'</div>'
	       	+'		<div class="content">'
	       	+ 			imgHtml
	       	+'			<p>'+ data.content +'</p>'
	       	+			replyHtml
	       	+'		</div>'
	   		+'	</div>'
	   		+'	<div class="clear"></div>'
	        +'</div>';
	        
	        return htmlstr;
		}
		
		//请求列表Ajax
		function getList(good_id){
			
		}
	}
	
	function specSelect(){
		var parObj = $(".goodsMes");
		var priceObj = $(".shopprice");
		var basePrice = Number(parObj.data("price"));
		var baseStock = Number(parObj.data("stock"));
		var promotePrice = Number(parObj.data("promote"));
		var specParObj = $(".goodsDetial .spec .content");
		var stockObj = $(".totStock b");
		var specPriceArr = [];
		var specStockArr = [];
		var totStock = 0;
		var nowParObj = $(".goodsMes");
		var nowStock = nowParObj.data("stock");
		var result;
		
		if(promotePrice < basePrice && promotePrice > 0){
			basePrice = promotePrice;
		}
		
		//有款式的情况
		if(specParObj.find("span").length > 0){
			haveSpec = true;
			specParObj.find("span").each(function(index){
				var nowGId = $(this).data("gid");
				var nowSId = $(this).data("sgid");
				if(nowGId == nowSId){
					$(this).addClass("select");
				}else{
					$(this).removeClass("select");
				}
			});
		}
		//库存显示
		if(nowStock <= 0){
			result = "该商品暂时缺货";
			$(".buyNow").addClass("destroy");
		}else{
			result = nowStock;
		}
		stockObj.html(result);
	}
	
	function thumbBook(){
		var parObj = $(".thumbBook");
		var topBtn = parObj.find(".spanTop");
		var bottomBtn = parObj.find(".spanBootm");
		var listObj = parObj.find(".gallery ul");
		var imgObj = parObj.find(".imgInfo img");
		var pageNum = 0;
		var maxNum = parObj.find(".gallery li").length / 5 - 1;
		
		parObj.find(".gallery li a").on('mousedown',function(){
			var urls = $(this).data("url");
			imgObj.attr("src",urls);
		});
		
		if(maxNum%1 != 0){
			maxNum = Math.ceil(maxNum);
		}
	
		topBtn.on('mousedown',function(){
			pageNum = pageNum - 1;
			if(pageNum < 0){
				pageNum = 0;
			}
			moveFun();
		});
	
		bottomBtn.on('mousedown',function(){
			pageNum = pageNum + 1;
			if(pageNum >= maxNum){
				pageNum = maxNum;
			}
			moveFun();
		});
		
		function moveFun(){
			var moveNum = -pageNum * 440;
			listObj.animate({"top":moveNum},300);
		}
	}
	
	function setComment(){
		var parObj = $(".commentSource");
		var num = parObj.data("source");
		parObj.find(".content .stars").each(function(index){
			var obj = $(this);
			if(index < num){
				obj.addClass("son");
			}
		});
	}
});
