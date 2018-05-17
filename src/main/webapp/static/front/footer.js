$(document).ready(function(){
	//列表标签设置
	$(".productBlock").each(function(){
		setProductArrow($(this));
	});
	
	//返回顶部
	$(window).scroll(function() {
		var $scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop; //兼容浏览器
		if($scrollTop > 200) { //滚动高度可调，也可以为某个div的scrollTop，需要的可以自行修改
			$(".backTop").show();
		} else {
			$(".backTop").hide();
		}
	});
	$(".backTop").click(function() {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
	});
	//QQTalk控制
	//qqTalk();
});

function qqTalk(){
	var ifFrameObj,imgObj,conObj,siderObj,topNum;
	siderObj = $(".sideBar");
	//垂直剧中
	topNum = (window.innerHeight - siderObj.outerHeight())/2;
	siderObj.css("top",topNum);
	//购物车，结算页不现实侧边栏
	var step = $("#container").data("step");
	if(step == "cart" || step == "checkout"){
		siderObj.hide();
		return;
	}
	//QQTalk控制
	S_PATH.addKeepRunFun("addListenerQQTalk",function(){
		var talkFrameObj;
		var ifQQIframe;
		var talkSideBarObj = $(".sideBar");
		var talkConFrameObj = $("#qqTalkFrame");
		var topNum = talkSideBarObj.css("top");
		var leftNum = talkSideBarObj.offset().left;
		topNum = parseInt(topNum.split("px")[0]) + 33;
		$("iframe").each(function(){
			ifQQIframe = $(this).contents().find("#launchBtn");
			if(ifQQIframe.length > 0){
				talkFrameObj = $(this);
			}
		});
		if(talkFrameObj != undefined){
			talkFrameObj.css({
				"position" : "fixed",
				"zIndex" : "2",
				"top" : topNum,
				"left" : leftNum,
				"width":"65px",
				"height":"62px"
			});
			//S_PATH.removeKeepRunFun("addListenerQQTalk");
			//doFun();
		}
		function doFun(){
			conObj = $(".sideBar .qqTalk");
			launchBtn = talkFrameObj.contents().find("#launchBtn");
			launchBtn.css({
				"opacity":"0",
				"width":"65px",
				"height":"62px"
			});
			conObj.show();
		}
	});
}
