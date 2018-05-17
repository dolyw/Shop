$(document).ready(function(){
	var pcby = new bigeye(".bigeyeSource",".bigeye");
	
	$.header({type:"showCategory"});
	setFloor();
	
	//楼层菜单脚本
	function setFloor(){
		var floorTitleArr = [];
		var htmlStr = '<div class="floorFrame" style="display:none;">';
		var topNum;
		var beginNum = 300;
		var firstNum = 200;
		var changeNum = 460;
		var endNum;
		var minNum = 70;
		var floorObj;
		
		$(".moduletitle").each(function(index){
			
		});
		
		$("#container").append(htmlStr).ready(function(){
			floorObj = $(".floorFrame");
			endNum = $(document).height() - $("#footerFrame").outerHeight() - $(".floorFrame").outerHeight() - $("#headerFrame").outerHeight() - parseInt($("#footerFrame").css("marginTop"));
			minNum = (window.innerHeight - floorObj.height())/2;
			$(window).scroll(function(e) {
				topNum = $(window).scrollTop();
				if(topNum >= changeNum){
					floorObj.show();
				}else{
					floorObj.hide();
				}
				if(topNum > beginNum){
					floorTopNum = firstNum - topNum - beginNum;
					if(floorTopNum < minNum){
						floorTopNum = minNum;
					}
				}else{
					floorTopNum = firstNum;
				}
				if(topNum > endNum){
					floorObj.css({'top':endNum,'position':'absolute'});
				}else{
					floorObj.css({'top':floorTopNum,'position':'fixed'});
				}
			});
			floorObj.find(".title").each(function(index){
				var obj = $(this);
				obj.on('mousedown',function(){
					var nowId = $(this).data("id");
					var topNum = $("#" + nowId).offset().top - 35;
					$('body,html').animate({ scrollTop: topNum }, 500);
					console.log(topNum)
				});
				
			});
			
		});
	}
});
