<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>文章列表</title>
<link rel="stylesheet" type="text/css" href="css/ArticleList.css" />
<link rel="stylesheet" href="css/article.css" />
<link rel="stylesheet" href="layui/css/layui.css" type="text/css" />
<link rel="stylesheet" href="css/laybar.css" />
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
					<li class="layui-nav-item"><a href="/MyBlog/list.do">设计</a></li>
					<li class="layui-nav-item layui-this"><a
						href="/MyBlog/list.do">前端</a></li>
					<li class="layui-nav-item"><a href="/MyBlog/list.do">后端</a></li>
					<li class="layui-nav-item"><a href="javascript:;">Other</a>
						<dl class="layui-nav-child">
							<!-- 二级菜单 -->
							<dd>
								<a href="/MyBlog/list.do">工具资源</a>
							</dd>
							<dd>
								<a href="/MyBlog/list.do">bug记录</a>
							</dd>
							<dd>
								<a href="/MyBlog/list.do">经验总结</a>
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
	<div class="articleListBody">
		<div class="articleListBody-head">
			<span class="layui-breadcrumb"> <a href="/">首页</a> <a
				href="/demo/">设计</a> <a><cite>导航元素</cite></a>
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
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
						<td>
							<form class="layui-form layui-form-pane" action="">
								<select name="city" lay-verify="">
									<option value="">设置状态</option>
									<option value="010">北京</option>
									<option value="021">上海</option>
									<option value="">&nbsp;</option>
								</select>
							</form>
						</td>
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
					<tr>
						<td style="width: 5px;">1</td>
						<td>我的名字叫做勇敢</td>
						<td>98</td>
						<td>1989-10-14</td>
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
						<td>编辑|分类|置顶|删除</td>
					</tr>
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
	<script>
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
</body>

</html>