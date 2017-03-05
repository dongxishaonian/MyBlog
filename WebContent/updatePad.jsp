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
			<li>现在开始你的博客之旅吧！</li>
		</ul>
		<button id="release" data-method="offset" data-type="auto"
			class="layui-btn ">提交文章</button>
		<button id="release" data-method="offset" data-type="auto"
			class="layui-btn ">返回</button>

	</div>
	<div class="article_Title" style="">
		<input id="text_title" type="text" name="title" required
			lay-verify="required" placeholder="请输入文章标题" autocomplete="off"
			class="layui-input" value="${blogArticle.title}">
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
								//theme : "dark",
								//previewTheme : "dark",
								//editorTheme : "pastel-on-dark",
								markdown : data,
								codeFold : true,
								//syncScrolling : false,
								saveHTMLToTextarea : true, // 保存 HTML 到 Textarea
								searchReplace : true,
								//watch : false,                // 关闭实时预览
								htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启    
								toolbar : true, //关闭工具栏
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
									//cgEditor.previewing();
									//alert(cgEditor+"xcscdsv");
									//this.fullscreen();
									//this.unwatch();
									//this.watch().fullscreen();
									//this.setMarkdown("#PHP");
									//this.width("100%");
									//this.height(480);
									//this.resize("100%", 640);
								}
							});
						}, "text");
	});
</script>
<script type="text/javascript">
	layui
			.use(
					[ 'layer', 'form', 'layedit', 'laydate' ],
					function() { //独立版的layer无需执行这一句
						var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
						var active = {
							offset : function(othis) {
								var type = othis.data('type'), text = othis
										.text();
								var id = othis.attr('id');
								//标题
								var texttitle = $("#text_title").val();
								//文章id
								var articleId = "${blogArticle.id}";
								//文章类
								var articleType = "${blogArticle.articleType}";
								//文章内容
								var textcontent = cgEditor.getMarkdown();
								layer
										.open({
											type : 1,
											title : '注意!',
											//area : [ '500px', '400px' ],
											//offset:type,
											id : 'LAY_DEMO' + type,
											content : '<div style="padding: 20px 100px;">'
													+ '是否提交文章'
													+ '</div>'
													+ '<form   class="layui-form layui-form-pane tanchuang" action="/MyBlog/update.do" method="post">'
													+ '<input type="hidden" name="articleType" value="'+articleType+'"></input>'
													+ '<input type="hidden" name="articleId" value="'+articleId+'"></input>'
													+ '<input type="hidden" name="textcontent" value="'+textcontent+'"></input>'
													+ '<input type="hidden" name="title" value="'+texttitle+'"></input>'
													+ '</form>',
											btn : [ '提交', '取消' ],
											shade : [ 0.8, '#000' ],
											btnAlign : 'c', //按钮居中
											yes : function() {
												//储存文章
												$(".tanchuang").submit();

											},
											btn2 : function() {
												alert('no');
											},
											cancel : function() {
												layer.closeAll();
											}
										})

							}
						};
						$('#release')
								.on(
										'click',
										function() {
											var othis = $(this), method = othis
													.data('method');
											active[method] ? active[method]
													.call(this, othis) : '';
											var form = layui.form(), layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
											form.render('select');
										});
					})
</script>

</html>