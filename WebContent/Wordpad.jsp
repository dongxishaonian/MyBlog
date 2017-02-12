<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>写博客</title>
<link rel="stylesheet"
	href="bower_components/editor.md/css/editormd.min.css" />
<link rel="stylesheet" href="layui/css/layui.css" type="text/css" />
<link rel="stylesheet" href="css/laybar.css" />
<link rel="stylesheet" href="css/article.css" />
<link rel="stylesheet" href="css/Wordpad.css" />
</head>

<body>
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
	<div class="headerMenu">
			<div class="alignment">
				<div class="headerBlank"></div>
				<div class="headerUser">
					<p class="headerUsertitile">Stubborn Blog</p>
				</div>
				<div class="menubardiv">
					<ul class="layui-nav" lay-filter="">
					<li class="layui-nav-item"><a href="/MyBlog/list.do?articleType=design">设计</a></li>
					<li class="layui-nav-item layui-this"><a
						href="/MyBlog/list.do?articleType=front-end">前端</a></li>
					<li class="layui-nav-item"><a href="/MyBlog/list.do?articleType=back-end">后端</a></li>
					<li class="layui-nav-item"><a href="javascript:;">Other</a>
						<dl class="layui-nav-child">
							<!-- 二级菜单 -->
							<dd>
								<a href="/MyBlog/list.do?articleType=tool">工具资源</a>
							</dd>
							<dd>
								<a href="/MyBlog/list.do?articleType=bugRecord">bug记录</a>
							</dd>
							<dd>
								<a href="/MyBlog/list.do?articleType=experience">经验总结</a>
							</dd>
							<c:if test="${sessionScope.username eq 'admin'}">
								<dd>
									<a href="/MyBlog/write.do">写文章</a>
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
	<div class="writerpad">
		<ul>
			<li>现在开始你的博客之旅吧！</li>
		</ul>
		<button class="layui-btn">发表文章</button>
	</div>
	<div id="editormd">
		<textarea style="display: none;">### Hello Editor.md !</textarea>
	</div>
</body>
<script src="js/jquery-1.12.0.min.js"></script>
<script src="bower_components/editor.md/editormd.min.js"></script>
<script type="text/javascript">
	$(function() {
		var editor = editormd("editormd", {
			path : "bower_components/editor.md/lib/" // Autoload modules mode, codemirror, marked... dependents libs path
		});

		/*
		// or
		var editor = editormd({
		    id   : "editormd",
		    path : "../lib/"
		});
		 */
	});
</script>

</html>