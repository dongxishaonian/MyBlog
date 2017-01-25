<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>愿你永远是那个东溪少年:)</title>
<link rel="stylesheet" href="css/index.css" type="text/css" />
<link rel="stylesheet" href="css/article.css" />
<link rel="stylesheet" href="layui/css/layui.css" type="text/css" />
<link rel="stylesheet" href="css/laybar.css" />
<link rel="stylesheet" type="text/css" href="css/slider.css" />
</head>

<body>
	<script src="js/jquery-1.12.0.min.js"></script>
	<script src="js/gdlb.js"></script>
	<script src="layui/layui.js"></script>
	<script>
		layui.use('element', function() {
			var element = layui.element();
			//一些事件监听
			element.on('tab(demo)', function(data) {
				console.log(data);
			});
		});
	</script>
	<!--
        	作者：837718548@qq.com
        	时间：2016-12-27
        	描述：page Header
        -->
	<div class="pageHeader">
		<div class="headerMenu">
			<div class="alignment">
				<div class="headerBlank"></div>
				<div class="headerUser">
					<p class="headerUsertitile">Stubborn Blog</p>
				</div>
				<div class="menubardiv">
					<ul class="layui-nav" lay-filter="">
						<li class="layui-nav-item"><a href="">设计</a></li>
						<li class="layui-nav-item layui-this"><a href="">前端</a></li>
						<li class="layui-nav-item"><a href="">后端</a></li>
						<li class="layui-nav-item"><a href="javascript:;">Other</a>
							<dl class="layui-nav-child">
								<!-- 二级菜单 -->
								<dd>
									<a href="">工具资源</a>
								</dd>
								<dd>
									<a href="">bug记录</a>
								</dd>
								<dd>
									<a href="">经验总结</a>
								</dd>
								<c:if test="${sessionScope.username eq 'admin'}">
									<dd>
										<a href="">写文章</a>
									</dd>
								</c:if>
							</dl></li>
					</ul>
				</div>
				<div class="searchFormdiv">
					<form class=" layui-form searchForm">
						<div>
							<button class="layui-btn layui-btn-primary">搜索</button>
						</div>
						<input type="text" name="title" required lay-verify="required"
							placeholder="在所有结果中搜索" autocomplete="off" class="layui-input">
					</form>
				</div>
			</div>
			<div class="login-in-out" style="text-align: center;">
				<ul class="layui-nav" lay-filter="">
					<li class="layui-nav-item"><a href="javascript:;">个人中心</a>
						<dl class="layui-nav-child">
							<!-- 二级菜单 -->
							<c:choose>
								<c:when
									test="${sessionScope.username eq '' || sessionScope.username eq null}">
									<dd>
										<a href="/MyBlog/login.do">登录</a>
									</dd>
								</c:when>
								<c:otherwise>
									<dd>
										<a>设置</a>
									</dd>
									<dd>
										<a href="/MyBlog/loginout.do">退出</a>
									</dd>
								</c:otherwise>
							</c:choose>
						</dl></li>
				</ul>
			</div>
		</div>
		<div class="headerPic">
			<div id="ban1">
				<div class="banner">
					<ul class="img">
						<li><a href="#"><img src="images/1.jpg"></a></li>
						<li><a href="#"><img src="images/2.jpg"></a></li>
						<li><a href="#"><img src="images/3.jpg"></a></li>
					</ul>

					<ul class="num">
					</ul>

					<div class="btn btn_l">&lt;</div>
					<div class="btn btn_r">&gt;</div>

				</div>

			</div>
		</div>
	</div>
	<!--
        	作者：837718548@qq.com
        	时间：2016-12-27
        	描述:page Content
        -->
	<div class="pageContent">
		<div class="contentHeader">
			<div class="contentHeaderDiv">
				<div class="left">
					<a href="#"><img src="img/Big box.png"></a>
				</div>
				<div class="right">
					<a href="#"><img src="img/Big box copy.png"></a>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="contentDiv">
				<div class="contentDiv-header">
					<a><img src="img/Huge box.png"></a>
				</div>
				<div class="left">
					<div class="shang">
						<a href="#"><img src="img/11.png"></a>
					</div>
					<div class="xia">
						<a href="#"><img src="img/22.png"></a>
					</div>
				</div>
				<div class="center">
					<div class="shang">
						<a href="#"><img src="img/33.png"></a>
					</div>
					<div class="xia">
						<a href="#"><img src="img/44.png"></a>
					</div>
				</div>
				<div class="right">
					<div class="shang">
						<a href="#"><img src="img/55.png"></a>
					</div>
					<div class="xia">
						<a href="#"><img src="img/66.png"></a>
					</div>
				</div>
			</div>
		</div>
		<div class="contentFooter">
			<div class="contentFooterDiv">
				<div class="left">
					<a href="#"><img src="img/Big box.png"></a>
				</div>
				<div class="right">
					<a href="#"><img src="img/Big box copy.png"></a>
				</div>
			</div>
		</div>
	</div>
	<!--
        	作者：837718548@qq.com
        	时间：2016-12-27
        	描述：page Footer
        -->
	<div class="pageFooter">
		<!--<div class="footerContent">
				<div class="footerContentDiv">
					<a href="#"><img src="img/1010.png"></a>
				</div>
			</div>-->
		<div class="footerBeizhu">
			<div class="footerBeizhuDiv">
				<p>
					<br /> <br /> Welcome to jeker_chend's exclusive space! <br />
					let's go party party all night !oh oh oh... <br /> @jeker_chen
				</p>
			</div>
		</div>
	</div>

</body>

</html>
