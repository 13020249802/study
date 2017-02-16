<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="${rootURL}resources/easyUI/themes/style.css" rel="stylesheet" type="text/css" />
<script src="${rootURL}resources/easyUI/jquery.min.js" type="text/javascript"></script>
<script src="${rootURL}resources/js/cloud.js" type="text/javascript"></script>
<script src="${rootURL}resources/js/jquery.cookie.js" type="text/javascript"></script>
<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})

		//chrome 浏览器输入框黄色背景遮挡去除
		if (navigator.userAgent.toLowerCase().indexOf("chrome") >= 0) {
			$(window).load(function() {
				$('ul input:not(input[type=submit])').each(function() {
					var outHtml = this.outerHTML;
					$(this).append(outHtml);
				});
			});
		}

		var username = $.cookie('username');
		var password = $.cookie('password');
		var remb = $.cookie('remb');
		if (username != null)
			$("#username").val(username);
		if (password != null) {
			$("#password").val(password);
		} else {
			$("#password").val('');
		}
		$("input[type='checkbox']").each(function() {
			if (remb != null) {
				this.checked = true;
			} else {
				this.checked = false;
			}
		})
		$("form").submit(function(e) {
			$("input[type='checkbox']").each(function() {
				if (this.checked) {
					$.cookie('username', $('#username').val(), {
						expires : 7
					});
					$.cookie('password', $('#password').val(), {
						expires : 7
					});
					$.cookie('remb', true, {
						expires : 7
					});
				} else {
					$.cookie('username', $('#username').val(), {
						expires : 7
					});
					$.cookie('password', $('#password').val(), {
						expires : -1
					});
					$.cookie('remb', true, {
						expires : -1
					});
				}
			})

		});

	});
</script>

</head>

<body style="background-color:#1c77ac; background-image:url(${rootURL}resources/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<div class="logintop">
		<span>欢迎登录企业管理集成平台</span>
		<ul>
		</ul>
	</div>
	<div class="loginbody">

		<span style="text-align: center; color: #d6e8f1; padding: 20px 20px; font-size: 35px; font-weight: bold; width: 100%; height: 71px; margin-top: 5%;">企业管理集成平台</span>

		<div class="loginbox">
			<form id="dealerForm" action="${rootURL}login" method="post">
				<ul>
					<li><input id="username" name="username" type="text" class="loginuser" /></li>
					<li><input id="password" name="password" type="password" class="loginpwd" autocomplete="off" /></li>
					<li><input name="" id="loginEMIP" type="submit" class="loginbtn" value="登录" /><label><input id="remb" name="rememberMe" type="checkbox" value="" />记住密码</label> <!-- <label><a href="#">忘记密码？</a></label> --></li>
				</ul>
				<div style="color: red; text-align: center;">${msg}</div>
			</form>
		</div>
	</div>
	<div class="loginbm">©2015上海安吉星信息服务有限公司 版权所有</div>
</body>

</html>