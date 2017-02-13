<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>文章列表</title>
<link rel="stylesheet" type="text/css" href="css/ArticleList.css" />
<link rel="stylesheet" href="css/article.css" />
<link rel="stylesheet" href="layui/css/layui.css" type="text/css" />
<link rel="stylesheet" href="css/laybar.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.0.3/jquery-confirm.min.css">
<script src="js/jquery-1.12.0.min.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.0.3/jquery-confirm.min.js"
	type="text/javascript"></script>
</head>

<body>
	<script src="layui/layui.js" type="text/javascript"></script>
	<script type="text/javascript">
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
				<form class=" layui-form searchForm" action="">
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
	<div class="articleListBody">
		<div class="articleListBody-head">
			<span class="layui-breadcrumb"> <a href="/MyBlog">Home</a> <a><cite><c:out
							value="${articleType}" /></cite></a>
			</span>
		</div>
		<hr />
		<div class="ListContent">
			<table class="layui-table" lay-even="" lay-skin="nob">
				<colgroup>
					<col width="40">
					<col width="150">
					<col width="70">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th style="width: 5 px;"></th>
						<th>标题</th>
						<th>阅读</th>
						<th>日期</th>
						<th>状态设置</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach varStatus="status" items="${topArticles}" var="article">
						<tr>
							<td style="width: 5px;">置顶</td>
							<td>${article.title}</td>
							<td>${article.readingVolume}</td>
							<td><fmt:formatDate type="date"
									value="${article.releaseDate}" /></td>
							<td>
								<form class="layui-form layui-form-pane" action="">
									<select name="city" lay-verify="">
										<option value="">设置状态</option>
										<option value="010">北京</option>
										<option value="021">上海</option>
										<option value="0571">杭州</option>
										<option value="">&nbsp;</option>
									</select>
								</form>
							</td>
							<td>编辑|分类|<a class="top_article"
								href="/MyBlog/untop.do?articleType=${articleType}&untopId=${article.id}">取消置顶</a>|<a
								id="${article.id}" class="delete_article"
								href="javascript:void(0)">删除</a></td>
						</tr>
					</c:forEach>
					<c:forEach varStatus="status" items="${allArticles}" var="article">
						<tr>
							<td style="width: 5px;">${status.count}</td>
							<td>${article.title}</td>
							<td>${article.readingVolume}</td>
							<td><fmt:formatDate type="date"
									value="${article.releaseDate}" /></td>
							<td>
								<form class="layui-form layui-form-pane" action="">
									<select name="city" lay-verify="">
										<option value="">设置状态</option>
										<option value="010">北京</option>
										<option value="021">上海</option>
										<option value="0571">杭州</option>
										<option value="">&nbsp;</option>
									</select>
								</form>
							</td>
							<td>编辑|分类|<a class="top_article"
								href="/MyBlog/top.do?articleType=${articleType}&topId=${article.id}">置顶</a>|<a
								id="${article.id}" class="delete_article"
								href="javascript:void(0)">删除</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div style="background-color: #F6F6F6;" id="demo7"></div>
			<hr />
			<div class="footerBeizhu">
				<div class="footerBeizhuDiv">
					<p>
						<br /> <br /> Welcome to jeker_chend's exclusive space! <br />
						let's go party party all night !oh oh oh... <br /> @jeker_chen
					</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		layui
				.use(
						[ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form(), layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听提交
							form.on('submit(demo1)', function(data) {
								layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								})
								return false;
							});
						});
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer;
			laypage({
				cont : 'demo7',
				pages : 100,
				skip : true
			});
		});
	</script>
	<script type="text/javascript">
		$(".delete_article")
				.click(
						function() {
							var delete_id = $(this).attr("id");
							$
									.confirm({
										title : '注意!',
										content : '是否要删除本文章!',
										useBootstrap : false,
										buttons : {
											继续 : function() {
												var articleType = "${articleType}";
												window.location.href = "/MyBlog/delete.do?articleType="
														+ articleType
														+ "&deleteId="
														+ delete_id;
											},
											取消 : function() {
											}
										}
									});
						})
	</script>
</body>

</html>