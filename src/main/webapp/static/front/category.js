$(document).ready(function(){
	var parameObj = S_PATH.getParame();
	var nowPriceRange = parameObj.price_min + "-" + parameObj.price_max;
	var priceStart = nowPriceRange.split("-")[0];
	var price_end = nowPriceRange.split("-")[1];
	var nowOrderObj = "";
	var nowOrder = "";
	var sort = "";
	var sortListObj = $(".rankOp .rank .dress");
	var order ="";
	var nowSortObj;
	var stock;
	
	if(nowPriceRange == "undefined-undefined"){
		nowPriceRange = "0-0";
	}
	
	//设置价格区域数字输入插件
	$("#priceRangePost .inputt").each(function(){
		var obj = $(this);
		S_PATH.numKeyBoard(obj,function(){});
	})
	
	//价格区间提交
	$("#priceRangePost .submitbtn").on("mousedown",function(){
		var urls = "";
		parameObj.price_min = $("#priceRangePost .price_start").val();
		parameObj.price_max = $("#priceRangePost .price_end").val();
		urls = S_PATH.getParameUrl(parameObj);
		S_PATH.jumpUrl(urls);
	});
	
	//根据参数设置价格选框
	if(priceStart == "undefined"){
		priceStart = 0;
	}
	
	$("#priceRangePost .price_start").val(priceStart);
	
	if(parseInt(price_end) == 0 || price_end == "undefined"){
		$("#priceRangePost .price_end").val("");
	}else{
		$("#priceRangePost .price_end").val(price_end);
	}
	
	//根据参数设置排序选项样式
	sort = parameObj.sort;
	if(sort == undefined || sort == ""){
		sort = "sort_order";
	}
	
	switch(sort){
		case "sort_order"://上架时间-推荐
			nowSortObj = sortListObj.eq(0);
			break;	
		case "sales"://点击人气-销量
			nowSortObj = sortListObj.eq(1);
			break;
		case "last_update"://更新时间-新品
			nowSortObj = sortListObj.eq(2);
			break;		
		case "shop_price"://价格
			nowSortObj = sortListObj.eq(3);
			break;
	}
	
	nowSortObj.addClass("current");
	sortListObj.find("i").removeClass("icon-xiangxia");
	sortListObj.find("i").removeClass("icon-xiangshang");
	
	nowOrderObj = nowSortObj.find("i");
	if(nowOrderObj.hasClass("icon-xiangxia")){
		nowOrder = "DESC";
	}else{
		nowOrder = "ASC";
	}
	parameObj.os = sort;
	if(sort == parameObj.os){
		order = parameObj.order;
		if(order == undefined || order == ""){
			order = "DESC#goods_list";
		}
		order = order.split("#")[0];
		switch(order){
			case "ASC":
				nowSortObj.find("i").addClass("icon-xiangshang");
				break;
			case "DESC":
				nowSortObj.find("i").addClass("icon-xiangxia");
				break;
		}
	}else{
		nowSortObj.find("i").addClass("icon-xiangxia");
	}
	
	//排序点击事件
	sortListObj.on("mousedown",function(){
		var obj = $(this);
		var type = obj.data("type");
		var urls = "";
		parameObj.sort = type;
		if(parameObj.sort == parameObj.os){
			switch(order){
				case "ASC":
					parameObj.order = "DESC#goods_list";
					break;
				case "DESC":
					parameObj.order = "ASC#goods_list";
					break;
			}
		}else{
			parameObj.order = "DESC#goods_list";
		}
		
		urls = S_PATH.getParameUrl(parameObj);
		S_PATH.jumpUrl(urls);
	});
	
	//快速价格选择
	$("#priceRangeSelect .xiaoFont").each(function(){
		var obj = $(this);
		var ranges = obj.data("range");
		var arr = ranges.split("-");
		var nowUrls = "";
		var nowParameObj = parameObj;
		nowParameObj.price_min = arr[0];
		nowParameObj.price_max = arr[1];
		nowUrls = S_PATH.getParameUrl(nowParameObj);
		if(nowPriceRange == ranges){
			obj.addClass("select");
		}else{
			obj.attr("href",nowUrls);
		}
	});
	//恢复进入时候的价格
	parameObj.price_min = priceStart;
	parameObj.price_max = price_end;
	
	//仅显示有货控制
	stock = parameObj.stock;
	if(stock == undefined){
		stock = "1";
	}
	if(stock == "1"){
		$('#showGood').attr("checked","checked");
	}
	$('#showGood').on("change",function(){
		var obj = $(this);
		var urls;
		if (obj.is(':checked')) {
			parameObj.stock = "1";
		}else{
			parameObj.stock = "0";
		}
		urls = S_PATH.getParameUrl(parameObj);
		S_PATH.jumpUrl(urls);
	});
	

});
