<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jspf"%>

<%@include file="/common/front.jspf"%>

<script src="${ctxstatic}/vendor/verifyCode-master/gVerify.js"></script>

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
</style>

<div class="container">
    <div class="col-md-6 col-md-offset-3">
        <form id="form" name="form">

			<div class="form-group has-feedback">
                
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				  <ul class="layui-tab-title">
				    <li><a href="login.jsp">密码登录</a></li>
				    <li><a href="loginMessage.jsp">短信验证码登录</a></li>
				    <li class="layui-this">立即注册</li>
				  </ul>
				</div>
            </div>
			<div class="form-group has-feedback">
                
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                    <input id="account" name="account" class="form-control" placeholder="手机号" maxlength="11" type="text">
                </div>

                <%--<span style="color:red;display: none;" class="tips"></span>
                <span style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                <span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>--%>
            </div>

            <div class="form-group has-feedback">

                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                    <input id="imageCode" class="form-control" placeholder="图像验证码" maxlength="4" type="text">
                    <span class="input-group-btn"><div id="v_container" style="width: 95px;height: 33px;"></div></span>
                </div>
            </div>

            <div class="form-group has-feedback">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
                    <input id="smsCode" class="form-control" placeholder="短信验证码" maxlength="4" type="text">
                    <input id="checkCode" name="checkCode" class="form-control" type="hidden" value="wang">
                    <span class="input-group-btn">
                           <button type="button" id="loadingButton" class="btn btn-primary" autocomplete="off">发送验证码</button>
                    </span>
                </div>
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

        </form>
        <div class="form-group">
            <input class="form-control btn btn-primary" id="submit" type="submit" value="立&nbsp;&nbsp;即&nbsp;&nbsp;注&nbsp;&nbsp;册" >
        </div>
    </div>
</div>

<script>

var verifyCode = new GVerify("v_container");

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
	var check = [false, false, false, false, false];

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
	    	$.ajax({
	            type: 'POST',
	            url: '${ctx}/user/existUser',
	            data: $('#form').serialize(),
	            dataType: 'json',
	            success: function (data) {
	                if (data.success) {
	                	//layer.msg(data.msg);
	                	//sleep(1000);
	                	//setTimeout("parent.location.reload()",500);
	                }else{
	                	layer.msg(data.msg);
	                }
	            },
	            error: function () {
	            	alert('error');
	            }
	        });
	    	success($(this), 0);
	    } else {
	        fail($(this), 0, '手机号码输入有误');
	    }
	});
	
	$('.container').find('input').eq(1).change(function() {
		var res = verifyCode.validate($('#imageCode').val());
	    if (res) {
	        success($(this), 1);
	    } else {
	        fail($(this), 1, '验证码输入错误');
	    }
	});

	//短信验证码
	$('.container').find('input').eq(2).change(function() {
	    if (check[1]) {
	        if ($(this).val() == $('#checkCode').val()) {
	            success($(this), 2);
	        } else {
	            fail($(this), 2, '短信验证码错误');
	        }
	    } else {
	        $('.container').find('input').eq(1).parent().parent().removeClass('has-success').addClass('has-error');
	    }

	});

    //密码
    $('.container').find('input').eq(4).change(function() {
        if (check[2]) {
            if ($(this).val().length < 6) {
                fail($(this), 4, '密码不少于6个字符');
            } else {
                success($(this), 4);
            }
        } else {
            $('.container').find('input').eq(2).parent().parent().removeClass('has-success').addClass('has-error');
        }

    });

	/* $('#loadingButton').click(function() {

	    if (check[1] && check[0] && $(this).html() == '发送校验码') {
	        $(this).removeClass('btn-primary').addClass('disabled');

	        $(this).html('<span class="red">59</span> 秒后重新获取');
	        var secondObj = $('#loadingButton').find('span');
	        var secondObjVal = secondObj.text();

	        function secondCounter() {

	            var secondTimer = setTimeout(function() {
	                secondObjVal--;
	                secondObj.text(secondObjVal);
	                secondCounter();
	            }, 1000);
	            if (secondObjVal == 0) {
	                clearTimeout(secondTimer);
	                $('#loadingButton').text('发送校验码');
	                $('#loadingButton').removeClass('disabled').addClass('btn-primary');

	            }
	        }

	        secondCounter();
	    } else {
	        $('.container').find('input').eq(4).parent().parent().removeClass('has-success').addClass('has-error');
	    }

	}) */
	
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
	                if(key != 3){
                        $('.container').find('input').eq(key).parent().parent().removeClass('has-success').addClass('has-error');
                    }
	            }
	        }
	    }
	    if (check[0] && check[1] && check[2]){
	    	$.ajax({
	            type: 'POST',
	            url: '${ctx}/user/register',
	            data: $('#form').serialize(),
	            dataType: 'json',
	            success: function (data) {
	                if (data.success) {
	                	layer.msg(data.msg);
	                	//sleep(1000);
	                	setTimeout("parent.location.reload()",500);
	                }else{
	                	layer.msg(data.msg);
	                }
	            },
	            error: function () {
	            	alert('error');
	            }
	        });
		}
	});
	
	$('#loadingButton').click(function(e) {
	    if (!check.every(function(value) {
	            return value == true
	        })) {
	        e.preventDefault();
            if (!check[0]) {
                $('.container').find('input').eq(0).parent().parent().removeClass('has-success').addClass('has-error');
                layer.msg("请输入手机号码");
            }else if ($('#imageCode').val() == '') {
                $('.container').find('input').eq(1).parent().parent().removeClass('has-success').addClass('has-error');
                layer.msg("请输入验证码");
            }else{
            	if (check[0] && check[1] && $(loadingButton).html() == '发送验证码'){
        	    	//alert("d");
        	    	$.ajax({
        	            type: 'POST',
        	            url: '${ctx}/user/getSms',
        	            data: $('#form').serialize(),
        	            dataType: 'json',
        	            success: function (data) {
        	                if (data.success) {
        	                	if(data.obj.status == 'OK'){
        	                		//layer.msg(data.obj.checkCode);
        	                		$('#checkCode').val(data.obj.checkCode);
        	                		$('#loadingButton').removeClass('btn-primary').addClass('disabled');
        		        	        $('#loadingButton').html('<span class="red">59</span>秒后获取');
        		        	        var secondObj = $('#loadingButton').find('span');
        		        	        var secondObjVal = secondObj.text();

        		        	        function secondCounter() {

        		        	            var secondTimer = setTimeout(function() {
        		        	                secondObjVal--;
        		        	                secondObj.text(secondObjVal);
        		        	                secondCounter();
        		        	            }, 1000);
        		        	            if (secondObjVal == 0) {
        		        	                clearTimeout(secondTimer);
        		        	                $('#loadingButton').text('发送验证码');
        		        	                $('#loadingButton').removeClass('disabled').addClass('btn-primary');

        		        	            }
        		        	        }
        		        	        secondCounter();
        	                	}else{
        	                		layer.msg("短信发送失败，请稍候重试");
        	                	}
        	                }else{
        	                	layer.msg(data.msg);
        	                }
        	            },
        	            error: function () {
        	            	alert('error');
        	            	//alert(XMLHttpRequest.status);
                   		 	//alert(XMLHttpRequest.readyState);
                   		 	//alert(textStatus);
        	            }
        	        });
        		}else if(check[0] && check[1]){
        			layer.msg("请勿重复点击");
        		}
            }
	    }
	    
	});
	
</script>