(function (window, $) {
	"use strict";
	var debug = false;
	var changeNum = 460;
	var conObj,logoObj,miniLogoObj,cartObj,categoryObj,searchObj,catBtnObj,SPBtnObj,catListObj,navObj,ifShow;
	var topNum = 0;
	var oldST = -1;
	var sd = "";
	var showCategory = false;
	
	var _init = function(){
		$(document).ready(function(){
			var addWishlistBtn = $("#mycart .miniCartBtn .wBtn");
			conObj = $("#headerFrame .contentFrame");
			logoObj = conObj.find(".logoFrame");
			miniLogoObj = conObj.find(".miniLogoFrame");
			cartObj = conObj.find(".cartFrame");
			categoryObj = conObj.find(".contentBox .categoryNavFrame");
			catBtnObj = categoryObj.find(".btn");
			catListObj = categoryObj.find(".list");
			searchObj = conObj.find(".searchFrame");
			navObj = conObj.find(".topNavFrame");
			SPBtnObj = conObj.find(".categoryNavFrame");
			
			
			if(showCategory){
				catListObj.show();
			}else{
				SPBtnObj.on('mouseenter',function(){
					catListObj.show();
				});
				
				SPBtnObj.on('mouseleave',function(){
					catListObj.hide();
				});
				
				catListObj.hide();
			}
			miniLogoObj.on('mouseenter',function(){
				if(ifShow){
					catListObj.show();
				}
			});
			catListObj.on('mouseleave',function(){
				if(ifShow){
					catListObj.hide();
				}
			});
			
			
			if(S_PATH.getAnchor() == undefined){
				$('body,html').animate({ scrollTop: 0 }, 500);
			};
			
			
		});
	};
	
	var _showCategory = function(){
		showCategory = true;
	};
	
	
	
	
	$.header = function(options) {
		var type = options.type;
		var obj = options.obj;
		var fun = options.fun;
		var result = options.result;
		
		if(typeof(fun) != 'function'){
			fun = function(){};
		}
		
		switch (type) {
			case 'init':
				_init();
				break;
			case 'hide':
				_hideCart();
				break;
			case 'showCategory':
				_showCategory();
				break;
			case 'upDataCart':
				_upDataCart(result);
				break;
			case 'removeOne':
				_removeOne(result);
				break;
		}
	};
})(window, jQuery);
$.header({type:"init"});
