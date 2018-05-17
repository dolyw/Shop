(function(window,document){
	var parObj;
	var bgObj;
	var codeObj;
	var fontObj;
	var changeObj;
	var codeW = 100;
	var codeH = 28;
	var fontSize = 25;
	var codeLeg = 4;
	var fontColor = "#000000";
	var codeResult = '';
	var codeHtmlStr = '';
	var create = function(obj,str){
		var htmlStr = ''
		+'<div style="float: left;width: '+ codeW +'px;height: '+ codeH +'px;border:1px solid #c3c3c3;margin-right: 20px;background: #eeeeee;position: relative;">'
		+'	<div class="bg" style="position: absolute;"></div>'
		+'	<div class="code" style="position: absolute;margin-top: 2px;"></div>'
		+'</div>'
		+'<div style="float: left;line-height: 30px;font-size: 14px;">看不清？<a class="change" href="javascript:;">换一张</a></div>'
		
		parObj = obj;
		parObj.html(htmlStr).ready(function(){
			bgObj = parObj.find(".bg");
			codeObj = parObj.find(".code");
			changeObj = parObj.find(".change");
			setBG();
			createCode();
			changeObj.on("mousedown",function(){
				createCode();
			});
		});
	};
	
	function createCode(){
		codeHtmlStr = "";
		for(var i=0;i<codeLeg;i++){
			var fObj = getFont();
			codeResult = codeResult + fObj.rNum;
			codeHtmlStr = codeHtmlStr + fObj.htmlStr;
		}
		codeObj.html(codeHtmlStr);
		parObj.data("code",codeResult);
	}
	
	function setBG(){
		var blockStr = '';
		for(var m=0;m<codeH;m++){
			for(var n=0;n<codeW;n++){
				var rNum = Math.floor(Math.random(1)*100);
				var color;
				if(rNum > 50){
					color = "background:#737373;";
				}else{
					color = "background:#eeeeee;";
				}
				
				blockStr = blockStr + '<div style="float:left;width:1px;height:1px;'+ color +'"></div>';
			}
		}
		bgObj.html(blockStr);
	}
	
	function getFont(){
		var fontBook = {
			"0" : [6,7,8,9,10,11,12,13,14,15,16,17,30,31,32,33,34,35,36,37,38,39,40,41,42,43,55,56,57,58,59,60,61,62,63,64,65,66,67,68,80,81,82,90,91,92,93,105,106,114,115,116,117,118,130,131,138,139,140,142,143,155,156,163,164,167,168,180,181,188,192,193,205,206,212,213,217,218,230,231,237,238,242,243,255,256,262,267,268,280,281,286,287,292,293,305,306,311,312,317,318,330,331,336,342,343,355,356,360,361,367,368,380,381,385,386,392,393,405,406,409,410,417,418,430,431,434,435,442,443,455,456,458,459,467,468,480,481,483,484,492,493,505,506,507,508,517,518,530,531,532,533,542,543,555,556,557,558,559,560,561,562,563,564,565,566,567,568,580,581,582,583,584,585,586,587,588,589,590,591,592,593,606,607,608,609,610,611,612,613,614,615,616,617],
			"1" : [11, 12, 13, 35, 36, 37, 38, 59, 60, 61, 62, 63, 83, 84, 85, 86, 87, 88, 111, 112, 113, 136, 137, 138, 161, 162, 163, 186, 187, 188, 211, 212, 213, 236, 237, 238, 261, 262, 263, 286, 287, 288, 311, 312, 313, 336, 337, 338, 361, 362, 363, 386, 387, 388, 411, 412, 413, 436, 437, 438, 461, 462, 463, 486, 487, 488, 511, 512, 513, 536, 537, 538, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593],
			"2" : [85, 86, 87, 108, 109, 110, 111, 112, 113, 132, 133, 134, 135, 136, 137, 138, 139, 156, 157, 158, 159, 162, 163, 164, 165, 180, 181, 182, 183, 188, 189, 190, 205, 206, 207, 214, 215, 216, 230, 231, 239, 240, 241, 263, 264, 265, 287, 288, 289, 311, 312, 313, 335, 336, 337, 359, 360, 361, 383, 384, 385, 407, 408, 409, 431, 432, 433, 455, 456, 457, 458, 459, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516],
			"3" : [6,7,8,9,10,11,12,13,14,15,16,17,18,31,32,33,34,35,36,37,38,39,40,41,42,43,56,57,58,59,60,61,62,63,64,65,66,67,68,91,92,93,116,117,118,141,142,143,166,167,168,191,192,193,216,217,218,241,242,243,266,267,268,283,284,285,286,287,288,289,290,291,292,293,308,309,310,311,312,313,314,315,316,317,318,341,342,343,366,367,368,391,392,393,416,417,418,441,442,443,466,467,468,491,492,493,516,517,518,541,542,543,556,557,558,559,560,561,562,563,564,565,566,567,568,581,582,583,584,585,586,587,588,589,590,591,592,593,606,607,608,609,610,611,612,613,614,615,616,617,618],
			"4" : [36,37,60,61,62,63,84,85,87,88,109,110,112,113,133,134,137,138,158,159,162,163,182,183,187,188,207,208,212,213,231,232,237,238,256,262,263,280,281,287,288,305,306,312,313,329,330,337,338,353,354,362,363,378,379,380,381,387,388,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,430,431,432,433,434,435,436,437,438,439,440,441,442,462,463,487,488,512,513,537,538],
			"5" : [37,38,61,62,85,86,109,110,111,112,113,114,115,116,117,118,119,133,134,135,136,137,138,139,140,141,157,158,159,181,182,183,205,206,207,211,212,229,230,231,234,235,236,237,238,254,255,256,258,259,260,261,262,263,264,279,280,281,282,283,284,285,288,289,290,305,306,307,308,314,315,316,331,332,340,341,365,366,389,390,413,414,415,437,438,439,461,462,480,481,484,485,486,503,504,505,506,507,508,509,510,529,530,531,532,533],
			"6" : [40,63,64,87,88,89,111,112,113,135,136,137,159,160,183,184,207,208,209,231,232,233,256,257,260,261,262,263,280,281,282,283,284,285,286,287,288,289,305,306,307,308,309,310,314,315,316,329,330,331,332,341,342,354,355,356,367,368,378,379,380,392,393,404,405,417,418,429,430,442,443,455,456,466,467,468,480,481,482,491,492,506,507,508,509,514,515,516,531,532,533,534,535,537,538,539,540,558,559,560,561,562,563,585,586,587],
			"7" : [57,58,59,60,61,62,63,64,65,66,67,68,81,82,83,84,85,86,87,88,89,90,91,92,93,94,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,141,142,143,166,167,190,191,192,214,215,216,238,239,240,262,263,264,287,288,289,311,312,313,335,336,337,360,361,362,385,386,387,410,411,412,435,436,437,460,461,462,485,486,487,510,511,512,535,536,537,561,562],
			"8" : [6,7,8,9,10,11,12,13,14,15,16,17,30,31,32,33,34,35,36,37,38,39,40,41,42,43,55,56,57,58,59,60,61,62,63,64,65,66,67,68,80,81,91,92,93,105,106,116,117,118,130,131,141,142,143,155,156,166,167,168,180,181,191,192,193,205,206,216,217,218,230,231,241,242,243,255,256,266,267,268,280,281,282,283,284,285,286,287,288,289,290,291,292,293,305,306,307,308,309,310,311,312,313,314,315,316,317,318,330,331,341,342,343,355,356,366,367,368,380,381,391,392,393,405,406,416,417,418,430,431,441,442,443,455,456,466,467,468,480,481,491,492,493,505,506,516,517,518,530,531,541,542,543,555,556,557,558,559,560,561,562,563,564,565,566,567,568,580,581,582,583,584,585,586,587,588,589,590,591,592,593,606,607,608,609,610,611,612,613,614,615,616,617],
			"9" : [33,34,35,36,37,38,39,40,41,42,57,58,59,60,61,62,63,64,65,66,67,68,82,83,91,92,93,107,108,117,118,132,133,142,143,157,158,167,168,182,183,192,193,207,208,217,218,232,233,242,243,257,258,259,260,261,262,263,264,265,266,267,268,283,284,285,286,287,288,289,290,291,292,293,317,318,342,343,367,368,392,393,417,418,442,443,467,468,492,493,517,518,542,543],
		};
		var randomNum = Math.floor(Math.random(10)*10);
		return {rNum:randomNum,htmlStr:getOneFont(fontBook[randomNum])};
	}
	
	function getOneFont(arr){
		var length = fontSize*fontSize;
		var fontStr = '<div class="oneFont" style="float:left;position: relative;width:'+ fontSize +'px;height:'+ fontSize +'px;">';
		var bg = '';
		for(var i=0;i<length;i++){
			if(arr.indexOf(i) >= 0){
				bg = 'background:'+ fontColor +';';
			}else{
				bg = "";
			}
			fontStr = fontStr + '<div style="float:left;width:1px;height:1px;'+ bg +'"></div>';
		}
		fontStr = fontStr + '</div>';
		return fontStr;
	}
	
	function createFont(arr){
		var length = fontSize*fontSize;
		fontSize = "250";
		var fontStr = '<div class="oneFont" style="border:1px solid #000;background:#ffffff;position: relative;width:'+ fontSize +'px;height:'+ fontSize +'px;">';
		var bg = '';
		
		for(var i=0;i<length;i++){
			if(arr.indexOf(i) >= 0){
				bg = 'background:'+ fontColor +';';
			}else{
				bg = "";
			}
			fontStr = fontStr + '<div style="float:left;width:10px;height:10px;'+ bg +'"></div>';
		}
		fontStr = fontStr + '</div>';
		fontStr = fontStr + '<div class="getArrBtn" style="background:#ffffff;cursor: pointer;">获取数组</div>';
		fontStr = fontStr + '<div style="background:#ffffff;"><textarea></textarea></div>';
		bgObj.html(fontStr).ready(function(){
			var getArrBtnObj = bgObj.find(".getArrBtn");
			
			bgObj.find(".oneFont div").on("mouseenter",function(){
				var obj = $(this);
				obj.css({"boxShadow":"0 0 10px #000000"});
			});
			bgObj.find(".oneFont div").on("mouseleave",function(){
				var obj = $(this);
				obj.css({"boxShadow":"none"});
			});
			bgObj.find(".oneFont div").on("mousedown",function(){
				var obj = $(this);
				var type = obj.data("t");
				if(type == undefined || type == "off"){
					obj.css({"background":"#000000"});
					obj.data("t","on");
				}else{
					obj.css({"background":"none"});
					obj.data("t","off");
				}
			});
			getArrBtnObj.on("mousedown",function(){
				var resultArr = [];
				var tipsStr;
				
				bgObj.find(".oneFont div").each(function(index){
					var type = $(this).data("t");
					if(type == "on"){
						resultArr.push(index);
					}
				});
				
				tipsStr = JSON.stringify(resultArr);
				bgObj.find("textarea").html(tipsStr)
			});
		});
	}
	
	function randomCode(obj,str){
		this._init(obj,str);
	}
	
	function getCode(){
		console.log(codeResult)
	}
	
	randomCode.prototype = {
		_init:function(obj,str){
			create(obj,str);
		},
		_getCode:function(){
			getCode();
		}
	};
	
	window.randomCode = randomCode;
})(window, document);
