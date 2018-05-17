var S_PATH = new serverPathFun();

jQuery("document").ready(function(){
	checkUserToken();
});

function checkUserToken(){
	var token = $("#userTokenPost").data("token");
	var DFCNDomain = S_PATH.getDFCNMCDomain();
	
	if(token == null || token == "" || token == undefined){
		return;
	}
    iframeStr = '<iframe src="'+ ajaxUrl +'"></iframe>'
}


/* *
 *  列表角标
 */
function setProductArrow(obj){
	var type = obj.data("type");
	var price = obj.data("price");
	var promote = obj.data("promote");
	var ifBest = parseInt(obj.data("best"));
	var ifHot = parseInt(obj.data("hot"));
	var ifNew = parseInt(obj.data("new"));
	var wlR = parseInt(obj.data("wlr"));
	var pNum = 0;
	var htmlStr = '';
	var colorClass = "";
	var textStr = "";
	price = S_PATH.changeMathNum(price);
	promote = S_PATH.changeMathNum(promote);
	obj.css("position","relative");
	if(promote > 0){
		pNum = promote / price;
		pNum = Math.floor(pNum*100);
		pNum = pNum/10;
		textStr = "享"+ pNum +"折";
		htmlStr = ''
		+'<div class="productArrow ">'
		+'	<div class="sales">'
		+'		<div class="arrow"></div>'
		+'		<div class="con">'+ textStr +'</div>'
		+'	</div>'
		+'</div>';
		obj.append(htmlStr);
	}else{
		if(type != "index"){
			setStyle();
		}
	}
	detVideo(obj);
}

/* *
 *  设置视频显示
 */
function detVideo(obj){
	var videoUrl = obj.data("video");
	var imgUrl = obj.data("img");
	var videoBaseW = 450;
	var videoBaseH = 300;
	var imgW = obj.find("img").width();
	var imgH = obj.find("img").height();
	var p = imgH/videoBaseH;
	var videoW = "auto";
	var videoH = "auto";
	var MLNum = 0;
	var htmlStr = '';
	var productUrl = obj.find("a").eq(0).attr("href");
	if(videoUrl == "" || videoUrl == undefined){
		return;
	}
	videoW = videoBaseW * p;
	MLNum = -(videoW - imgW)/2;
	obj.css({"overflow":"hidden"});
	htmlStr = getHtml(productUrl);
	obj.prepend(htmlStr);
	function getHtml(productUrl){
		var htmlStr = ''
		+'<a href="'+ productUrl +'">'
		+'<video class="videoBox" poster="'+ imgUrl +'" loop="true" autoplay="true" width="auto" height="'+ imgH +'" style="margin-left:'+ MLNum +'px">'
		+'	<source src="'+ videoUrl +'" type="video/mp4">'
		+'</video>'
		+'</a>';
		return htmlStr;
	}
}


//基础配置[心跳][退出软件][返回顶部]
function serverPathFun(){
	var oneHart = 100;
	var timer = self.setInterval(_hartOne,oneHart);
	var funNameArr = [];
	var funArr = [];
	var hartNum = 0;
	var st;
	
	try{
		st = parseInt(serverTime)*1000;
	}catch(e){
		st = new Date().getTime();
	}
	
	this.getPassport = function(){
		var passportUrl = "";
		return passportUrl;
	};
	
	this.getBW = function(){
		var BWNum = $(window).width();
		return BWNum;
	};

	this.getBH = function(){
		var BHNum = window.innerHeight;
		return BHNum;
	};
	
	

	this.jumpUrl = function(urlStr){
		document.location.href=urlStr;
	};

	this.trim = function(str){ //删除左右两端的空格
		return str.replace(/(^\s*)|(\s*$)/g, "");
	};
	
	
	
	
	
	
	
	
	
	//获取锚点
	this.getAnchor = function(){
		var urls = window.location.href;
		var result;
		var arr = [];
		try{
			arr = urls.split("#");
			result = arr[1];
		}catch(e){
		}
		return result;
	};
	
	
	//获取商城域名
	this.getDFCNMCDomain = function(){
		var DFCNDomain = '';
		return DFCNDomain;
	}
	
	
	
	
	
	

	
	this.changeMathNum = function(str){
		var result = 0;
		var arr;
		if(str.split("-").length > 1){
			str = str.substr(2,str.length-2);
		}else{
			str = str.substr(1,str.length-1);
		}
		arr = str.split(".");
		str = arr[0];
		if(arr.length == 1){
			arr[1] = "00";
		}else{
			if(arr[1].length == 1){
				arr[1] = arr[1] + "0";
			}
		}
		str = arr[0] + arr[1];
		result = parseInt(str);
		return result;
	};
	
	
	
	this.getHartNum = function(){
		return hartNum;
	};
	
	this.getSt = function(){
		return st;
	};
	
	this.addKeepRunFun = function(funName,fun){
		funNameArr.push(funName);
		funArr.push(fun);
	};

	this.removeKeepRunFun = function(funName){
		var num = getIndex(funName);
		
		funNameArr.splice(num,1);
		funArr.splice(num,1);
		function getIndex(funName){
			var backNum;
			for(var i=0;i<funNameArr.length;i++){
				if(funName == funNameArr[i]){
					backNum = i;
				}
			}
			return backNum;
		}
	};

	function _hartOne(){
		hartNum = hartNum + 1;
		st = st + oneHart;
		
		for(var i=0;i<funArr.length;i++){
			funArr[i]();
		}
	}
}