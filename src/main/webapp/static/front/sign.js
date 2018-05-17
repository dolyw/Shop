$(document).ready(function() {
	var pageType = $("#signType").data("type");

	switch(pageType) {
		case "signin":
			signinFun();
			break;
		case "signup":
			signupFun();
			break;
	}
	forgetPwd();
});

function forgetPwd() {
	var parObj = $("#frogetPwdFrame");
	var rCodeObj = new randomCode($(".randomCode"), "看不清？换一张");
	var email = "";
	var emailCheckCode = "";
	var step = 0;
	parObj.find(".maskBG").on('mousedown', function() {
		hideFun();
	});

	$(".forgetPwd").on('mousedown', function() {
		showFun();
		step_0();
	});

	function changeStep() {
		parObj.find(".title li").removeClass("select");
		parObj.find(".title li").eq(step).addClass("select");
		parObj.find(".stepFrame li").hide();
		parObj.find(".stepFrame li").eq(step).show();
		parObj.find(".btnFrame li").hide();
		parObj.find(".btnFrame li").eq(step).show();
	}

	function showFun() {
		var hNum = window.innerHeight;
		var topNum = (hNum - parObj.find(".con").height()) / 2;

		parObj.height(hNum);
		parObj.find(".maskBG").height(hNum);
		parObj.find(".con").css("top", topNum);
		parObj.show();
	}

	function hideFun() {
		parObj.hide();
		step = 0;
		$(".seedCheckCode").off();
		$(".step_1").off();
		$(".step_2").off();
		$(".step_3").off();
	}

	function step_0() {
		var ifPost = false;

		changeStep();

		S_PATH.addKeepRunFun("forgetPwdStep_0", function() {
			var code = $("#checkRCode").val() + "";
			var sourceCode = $(".randomCode").data("code") + "";
			email = $("#step0_email").val();

			if(!checkType("email", email)) {
				if(!$(".seedCheckCode").hasClass("invalid")) {
					$(".seedCheckCode").addClass("invalid");
				}
			} else {
				if(sourceCode == code) {
					$(".seedCheckCode").removeClass("invalid");
				} else {
					if(!$(".seedCheckCode").hasClass("invalid")) {
						$(".seedCheckCode").addClass("invalid");
					}
				}
			}
			ifPost = true;
		});

		$(".seedCheckCode").on('mousedown', function() {
			var ajaxUrl = S_PATH.getPassport() + '/api/users/sendCodeToEmail';
			var data = JSON.parse('{"email":"' + email + '"}');
			if(!ifPost) {
				return;
			}
			//发送验证邮件
			$.ajax({
				url: ajaxUrl,
				type: 'post',
				data: data,
				dataType: 'json',
				beforeSend: function() {},
				complete: function() {},
				success: function(result) {
					if(result.error != undefined) {
						S_PATH.customCodeTips(result.customCode);
						return;
					}

					S_PATH.removeKeepRunFun("forgetPwdStep_0");
					S_PATH.tips("验证码已经发往您的邮箱");
					step_1();
				},
				error: function(xhr, ajaxOptions, thrownError) {
					console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
	}

	function step_1() {
		var btnObj = $(".step_1");
		step = 1;
		changeStep();
		$(".step_1_info").html(email);

		S_PATH.addKeepRunFun("forgetPwdStep_1", function() {
			var code = $("#step_1_code").val();
			if(code == "") {
				if(!btnObj.hasClass("invalid")) {
					btnObj.addClass("invalid");
				}
			} else {
				btnObj.removeClass("invalid");
			}
		});

		btnObj.on('mousedown', function() {
			if(!btnObj.hasClass("invalid")) {
				emailCheckCode = $("#step_1_code").val();
				step_2();
				S_PATH.removeKeepRunFun("forgetPwdStep_1");
			}
		});
	}

	function step_2() {
		var btnObj = $(".step_2");
		var pwd, rpwd;
		step = 2;
		changeStep();

		S_PATH.addKeepRunFun("forgetPwdStep_2", function() {
			pwd = $("#step_2_pwd").val();
			rpwd = $("#step_2_rpwd").val();

			if(pwd == rpwd && pwd.length >= 6) {
				btnObj.removeClass("invalid");
			} else {
				if(!btnObj.hasClass("invalid")) {
					btnObj.addClass("invalid");
				}
			}
		});

		btnObj.on('mousedown', function() {
			if(!btnObj.hasClass("invalid")) {
				var ajaxUrl = S_PATH.getPassport() + '/api/users/resetPWD/email?code=' + emailCheckCode;
				var data = JSON.parse('{"email":"' + email + '","password":"' + pwd + '"}');
				//发送验证邮件
				$.ajax({
					url: ajaxUrl,
					type: 'put',
					data: data,
					dataType: 'text',
					beforeSend: function() {},
					complete: function() {},
					success: function(result) {
						var jsonObj;
						try{
							jsonObj = JSON.parse(result);
						}   
						catch(exception){
							return;
						}   
						finally{}   
						if(result.error != undefined) {
							S_PATH.customCodeTips(result.customCode);
							return;
						}else{
							S_PATH.removeKeepRunFun("forgetPwdStep_2");
							step_3();
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		});
	}

	function step_3() {
		var btnObj = $(".step_3");
		step = 3;
		changeStep();
		btnObj.on('mousedown', function() {
			hideFun();
		});
	}
}

function signinFun() {
	checkSignStr();
}

function signupFun() {
	checkSignStr();
	S_PATH.addKeepRunFun("signupCheck", function() {
		if(checkSignUpPost()) {
			$(".signupBtn").removeClass("invalid");
		} else {
			$(".signupBtn").addClass("invalid");
		}
	});
	//用户协议
	$('.seeAgree').on('mousedown', function() {
		$('.agreeMent').show()
	});
	$('.agreeMent .icon-guanbi1').on('mousedown', function() {
		$('.agreeMent').hide()
	})
}

function checkSignInPost() {
	var result = true;
	$(".signInputFrame .con input").each(function() {
		var ifErr = $(this).data("err");
		if(ifErr == true) {
			result = false;
		}
	});
	return result;
}

function checkSignUpPost() {
	var result = true;
	$(".signInputFrame .con input").each(function() {
		var ifErr = $(this).data("err");
		if(ifErr == true) {
			result = false;
		}
	});
	if(!$(".remember input").is(':checked')) {
		result = false;
	}
	return result;
}

function checkSignStr() {
	$(".checkStr").each(function(index) {
		var parObj = $(this);
		var inputObj = parObj.find(".con input");
		var errorObj = parObj.find(".error");
		var type = parObj.data("type");
		var equal = parObj.data("equal");
		var inputType = inputObj.attr("type");
		var errorStr = errorObj.html();
		var result;

		inputObj.data("err", true);

		if(inputType == "text" && type == "password") {
			inputObj.attr("type", "password");
		}

		S_PATH.addKeepRunFun('cInput_' + index, function() {
			var str = inputObj.val();
			result = checkType(type, str);
			if(!result) {
				inputObj.data("err", true);
				errorObj.html(errorStr);
				errorObj.show();
			} else {
				if(equal != undefined) {
					var eqVal = $(equal).val();
					if(eqVal != str) {
						inputObj.data("err", true);
						errorObj.html("两个输入不一致");
						errorObj.show();
					} else {
						inputObj.data("err", false);
						$(equal).data("err", false);
						$(equal).parent().parent().find(".error").hide();
						errorObj.hide();
					}
				} else {
					inputObj.data("err", false);
					errorObj.hide();
				}
			}
		});
	});
}

function checkType(type, str) {
	var result;
	switch(type) {
		case "empty":
			result = S_PATH.checkInput("empty", str);
			break;
		case "email":
			result = S_PATH.checkInput("email", str);
			break;
		case "username":
			result = S_PATH.checkInput("username", str);
			break;
		case "password":
			result = S_PATH.checkInput("password", str);
			break;
		case "phone":
			result = S_PATH.checkInput("phone", str);
			break;
	}
	return result;
}