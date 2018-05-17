<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<%@include file="/common/front.jspf"%>

<link rel="stylesheet" href="${ctxstatic}/vendor/verifySlider/css/drag.css">
<script src="${ctxstatic}/vendor/verifySlider/js/drag.js"></script>

<script src="${ctxstatic}/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctxstatic}/vendor/layui/layui.all.js"></script>

<style>
@charset "utf-8";
	/* track base Css */
.container {
	margin-top:15px;
}
.red {
	color:red;
}
#ehong-code-input {
	width:42px;
	letter-spacing:2px;
	margin:0px 8px 0px 0px;
}
.ehong-code-val-tip {
	font-size:12px;
	color:#1098EC;
	top:0px;
	*top:-3px;
	position:relative;
	margin:0px 0px 0px 4px;
	cursor:pointer;
}

.handler_bg{
    background: #FFF url("${ctxstatic}/vendor/verifySlider/img/slider.png") no-repeat center;
}
.handler_ok_bg{
    background: #FFF url("${ctxstatic}/vendor/verifySlider/img/complet.png") no-repeat center;
} 
</style>


<div class="container">
	<div class="col-md-6 col-md-offset-3">
        <form method="post" id="form" name="form">

			<div class="form-group has-feedback">
                
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				  <ul class="layui-tab-title">
				    <li class="layui-this">密码登录</li>
				    <li><a href="loginMessage.jsp">短信验证码登录</a></li>
				    <li><a href="register.jsp">立即注册</a></li>
				  </ul>
				</div> 
            </div>
            <br/>
            <div class="form-group has-feedback">
                
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input id="account" name="account" class="form-control" placeholder="手机号" maxlength="11" type="text">
                </div>

                <%--<span style="color:red;display: none;" class="tips"></span>
                <span style="display: none;" class=" glyphicon glyphicon-remove form-control-feedback"></span>
                <span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>--%>
            </div>

            <div class="form-group has-feedback">
                
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input id="password" name="password" class="form-control" placeholder="密码" maxlength="16" type="password">
                </div>

                <%--<span style="color:red;display: none;" class="tips"></span>
                <span style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                <span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>--%>
            </div>
            
            <div class="form-group has-feedback">
            	<div id="drag">
			        <div class="drag_bg"></div>
			        <div class="drag_text slidetounlock" onselectstart="return false;" unselectable="on">
			            	请按住滑块，拖动到最右边
			        </div>
			        <div class="handler handler_bg"></div>
			    </div>
            </div>

			<div class="form-group">

            </div>
        </form>
        <div class="form-group">
            <button class="form-control btn btn-primary" id="submit" >立&nbsp;&nbsp;即&nbsp;&nbsp;登&nbsp;&nbsp;录</button>
        </div>
    </div>
</div>

<script>

$('#drag').drag();

//alert($('.drag_text').html());

var settings = {
	    e: 'idcode',
	    codeType: {
	        name: 'follow',
	        len: 4
	    }, //len是修改验证码长度的
	    codeTip: '',
	    inputID: 'idcode-btn' //验证元素的ID
	};

	var _set = {
	    storeLable: 'codeval',
	    store: '#ehong-code-input',
	    codeval: '#ehong-code'
	}
	$.idcode = {
	    getCode: function(option) {
	        _commSetting(option);
	        return _storeData(_set.storeLable, null);
	    },
	    setCode: function(option) {
	        _commSetting(option);
	        _setCodeStyle("#" + settings.e, settings.codeType.name, settings.codeType.len);

	    },
	    validateCode: function(option) {
	        _commSetting(option);
	        var inputV;
	        if (settings.inputID) {
	            inputV = $('#' + settings.inputID).val();

	        } else {
	            inputV = $(_set.store).val();
	        }
	        if (inputV.toUpperCase() == _storeData(_set.storeLable, null).toUpperCase()) { //修改的不区分大小写
	            return true;
	        } else {
	            _setCodeStyle("#" + settings.e, settings.codeType.name, settings.codeType.len);
	            return false;
	        }
	    }
	};

	function _commSetting(option) {
	    $.extend(settings, option);
	}

	function _storeData(dataLabel, data) {
	    var store = $(_set.codeval).get(0);
	    if (data) {
	        $.data(store, dataLabel, data);
	    } else {
	        return $.data(store, dataLabel);
	    }
	}

	function _setCodeStyle(eid, codeType, codeLength) {
	    var codeObj = _createCode(settings.codeType.name, settings.codeType.len);
	    var randNum = Math.floor(Math.random() * 6);
	    var htmlCode = ''
	    if (!settings.inputID) {
	        htmlCode = '<span><input id="ehong-code-input" type="text" maxlength="4" /></span>';
	    }
	    htmlCode += '<div id="ehong-code" class="ehong-idcode-val ehong-idcode-val';
	    htmlCode += String(randNum);
	    htmlCode += '" href="#" onblur="return false" onfocus="return false" oncontextmenu="return false" onclick="$.idcode.setCode()">' + _setStyle(codeObj) + '</div>' + '<span id="ehong-code-tip-ck" class="ehong-code-val-tip" onclick="$.idcode.setCode()">' + settings.codeTip + '</span>';
	    $(eid).html(htmlCode);
	    _storeData(_set.storeLable, codeObj);
	}

	function _setStyle(codeObj) {
	    var fnCodeObj = new Array();
	    var col = new Array('#BF0C43', '#E69A2A', '#707F02', '#18975F', '#BC3087', '#73C841', '#780320', '#90719B', '#1F72D8', '#D6A03C', '#6B486E', '#243F5F', '#16BDB5');
	    var charIndex;
	    for (var i = 0; i < codeObj.length; i++) {
	        charIndex = Math.floor(Math.random() * col.length);
	        fnCodeObj.push('<font color="' + col[charIndex] + '">' + codeObj.charAt(i) + '</font>');
	    }
	    return fnCodeObj.join('');
	}

	function _createCode(codeType, codeLength) {
	    var codeObj;
	    if (codeType == 'follow') {
	        codeObj = _createCodeFollow(codeLength);
	    } else if (codeType == 'calc') {
	        codeObj = _createCodeCalc(codeLength);
	    } else {
	        codeObj = "";
	    }
	    return codeObj;
	}

	function _createCodeCalc(codeLength) {
	    var code1, code2, codeResult;
	    var selectChar = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
	    var charIndex;
	    for (var i = 0; i < codeLength; i++) {
	        charIndex = Math.floor(Math.random() * selectChar.length);
	        code1 += selectChar[charIndex];

	        charIndex = Math.floor(Math.random() * selectChar.length);
	        code2 += selectChar[charIndex];
	    }
	    return [parseInt(code1), parseInt(code2), parseInt(code1) + parseInt(code2)];
	}

	function _createCodeFollow(codeLength) {
	    var code = "";
	    var selectChar = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');

	    for (var i = 0; i < codeLength; i++) {
	        var charIndex = Math.floor(Math.random() * selectChar.length);
	        if (charIndex % 2 == 0) {
	            code += selectChar[charIndex].toLowerCase();
	        } else {
	            code += selectChar[charIndex];
	        }
	    }
	    return code;
	}
	var regUsername = /^[a-zA-Z_][a-zA-Z0-9_]{4,19}$/;
	var regPasswordSpecial = /[~!@#%&=;':",./<>_\}\]\-\$\(\)\*\+\.\[\?\\\^\{\|]/;
	var regPasswordAlpha = /[a-zA-Z]/;
	var regPasswordNum = /[0-9]/;
	var password;
	var check = [false, false];

	//校验成功函数
	function success(Obj, counter) {
        Obj.parent().parent().removeClass('has-error');
	    //Obj.parent().parent().removeClass('has-error').addClass('has-success');
	    //$('.tips').eq(counter).hide();
	    //$('.glyphicon-ok').eq(counter).show();
	    //$('.glyphicon-remove').eq(counter).hide();
	    check[counter] = true;

	}

	// 校验失败函数
	function fail(Obj, counter, msg) {
        Obj.parent().parent().addClass('has-error');
	    //Obj.parent().parent().removeClass('has-success').addClass('has-error');
	    //$('.glyphicon-remove').eq(counter).show();
	    //$('.glyphicon-ok').eq(counter).hide();
	    //$('.tips').eq(counter).text(msg).show();
	    layer.msg(msg);
	    check[counter] = false;
	}

	
	// 手机号码
	var regPhoneNum = /^[1][3,4,5,6,7,8][0-9]{9}$/
	$('.container').find('input').eq(0).change(function() {
	    if (regPhoneNum.test($(this).val())) {
	        success($(this), 0);
	    } else {
	        fail($(this), 0, '手机号码输入有误');
	    }
	});
	
	// 密码匹配
	$('.container').find('input').eq(1).change(function() {

	    password = $(this).val();

	    if ($(this).val().length < 6) {
	        fail($(this), 1, '密码不少于6个字符');
	    } else {
	        success($(this), 1);
	    }
	});

	
	
	// 暂停时间代码
	function sleep(d){
		for(var t = Date.now();Date.now() - t <= d;);
	}
	
	$('#submit').click(function(e) {
	    if (!check.every(function(value) {
	            return value == true
	        })) {
	        e.preventDefault();
	        for (key in check) {
	            if (!check[key]) {
	                $('.container').find('input').eq(key).parent().parent().removeClass('has-success').addClass('has-error')
	            }
	        }
	    }
	    
	    if(check[0] && check[1] && $('.drag_text').html() != '验证通过'){
	    	layer.msg("请滑动通过验证");
	    }
	    
	    if (check[0] && check[1] && $('.drag_text').html() == '验证通过'){
	    	$.ajax({
	            type: 'POST',
	            url: '${ctx}/user/login',
	            data: $('#form').serialize(),
	            dataType: 'json',
	            success: function (data) {
	                if (data.success) {
	                	//alert("OK");
	                	//top.location.reload(); // top,最外层
	                	//parent.layer.closeAll();
	                	//parent.layer.msg(data.msg); // 父层
	                	//sleep(1000);
	                	//parent.location.reload();
	                	//top.layer.closeAll();
	                	parent.location.reload(); // 父层
	                	//parent.location = "${ctx}";
	                	
	                }else{
	                	layer.msg(data.msg);
	                }
	                
	            },
	            error: function () {
	            	layer.msg('请勿重复登录');
	            }
	        });
		}
	});
</script>