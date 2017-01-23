<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

<meta charset="utf-8">
<title>欢迎回来</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!--  CSS  -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/style.css">
<!--  HTML5  shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

</head>

<body oncontextmenu="return false">

	<div class="page-container">
		<h1>欢迎回来！</h1>
		<form:form id="loginform" action="login.do" method="post"
			commandName="user">
			<div>
				<form:input path="username" class="username" placeholder="用户名"
					autocomplete="off" />
				<!-- <input type="text" name="username" class="username"
					placeholder="用户名" autocomplete="off" /> -->
			</div>
			<div>
				<form:password path="password" class="password" placeholder="密码"
					autocomplete="off" oncontextmenu="return false"
					onpaste="return false" />
				<!-- <input type="password" name="password" class="password"
					placeholder="密码" oncontextmenu="return false"
					onpaste="return false" /> -->
			</div>
			<!-- <button id="submit" type="button">登录</button> -->
			<form:button id="submit1" type="button">登录</form:button>
		</form:form>
		<c:if test="${errorMsg!=null}">
			<p style="color: red">
				<c:out value="${errorMsg}" />
			</p>
		</c:if>
		<div class="connect">
			<p>If we can only encounter each other rather than stay with each
				other,then I wish we had never encountered.</p>
			<p style="margin-top: 20px;">如果相识 不能相恋 是不是还不如擦肩</p>
		</div>
	</div>
	<div class="alert" style="display: none">
		<h2>消息</h2>
		<div class="alert_con">
			<p id="ts"></p>
			<p style="line-height: 70px">
				<a class="btn">确定</a>
			</p>
		</div>
	</div>

	<!-- Javascript -->
	<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"
		type="text/javascript"></script>
	<script src="js/supersized.3.2.7.min.js" type="text/javascript"></script>
	<script src="js/supersized-init.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(".btn").click(function() {
			is_hide();
		})
		var u = $("input[name=username]");
		var p = $("input[name=password]");
		$("#submit1").live('click', function() {
			if (u.val() == '' || p.val() == '') {
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			} else {
				var reg = /^[0-9A-Za-z]+$/;
				if (!reg.exec(u.val())) {
					$("#ts").html("用户名错误");
					is_show();
					return false;
				} else {
					$("#loginform").submit();
				}

			}
		});
		window.onload = function() {
			$(".connect p").eq(0).animate({
				"left" : "0%"
			}, 600);
			$(".connect p").eq(1).animate({
				"left" : "0%"
			}, 400);
		}
		function is_hide() {
			$(".alert").animate({
				"top" : "-40%"
			}, 300)
		}
		function is_show() {
			$(".alert").show().animate({
				"top" : "45%"
			}, 300)
		}
	</script>
</body>

</html>

