<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>博客:${ blogArticle.title}</title>
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
					<li class="layui-nav-item"><a
						href="/MyBlog/list.do?articleType=design">设计</a></li>
					<li class="layui-nav-item layui-this"><a
						href="/MyBlog/list.do?articleType=front-end">前端</a></li>
					<li class="layui-nav-item"><a
						href="/MyBlog/list.do?articleType=back-end">后端</a></li>
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
			<li>${blogArticle.title}</li>
		</ul>
		<button id="return_key" data-method="offset" data-type="auto"
			class="layui-btn ">返回</button>
	</div>
	<div id="editormd">
		<textarea style="display: none;">### Hello Editor.md !</textarea>
	</div>
</body>
<script src="js/jquery-1.12.0.min.js"></script>
<script src="bower_components/editor.md/editormd.js"></script>
<script type="text/javascript">
	var cgEditor;
	$(function() {
		$
				.get(
						"getData.do?articleType=${blogArticle.articleType}&articleId=${blogArticle.id}",
						function(data) {
							cgEditor = editormd("editormd", {
								width : "90%",
								height : 740,
								path : 'bower_components/editor.md/lib/',
								theme : "dark",
								previewTheme : "dark",
								editorTheme : "pastel-on-dark",
								markdown : data,
								codeFold : true,
								//syncScrolling : false,
								saveHTMLToTextarea : true, // 保存 HTML 到 Textarea
								searchReplace : true,
								//watch : false,                // 关闭实时预览
								htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启    
								toolbar : false, //关闭工具栏
								//previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
								emoji : true,
								taskList : true,
								tocm : true, // Using [TOCM]
								tex : true, // 开启科学公式TeX语言支持，默认关闭
								flowChart : true, // 开启流程图支持，默认关闭
								sequenceDiagram : true, // 开启时序/序列图支持，默认关闭,
								//dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
								//dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
								//dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
								//dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
								//dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
								imageUpload : true,
								imageFormats : [ "jpg", "jpeg", "gif", "png",
										"bmp", "webp" ],
								imageUploadURL : "./php/upload.php",
								onload : function() {
									console.log('onload', this);
									cgEditor.previewing();
									$(".editormd-preview-close-btn").remove();
								}
							});
						}, "text");
	});
</script>
<script type="text/javascript">
	var page = "${page}";
	$("#return_key").click(function() {
		window.location.href="/MyBlog/list.do?articleType=${blogArticle.articleType}&page="+page;
	})
</script>
</html>