<%@page language="java"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/css/lanyuan.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<script type="text/javascript" src="${ctx}/common/lyGrid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/resources/list.js"></script>
<style type="text/css">
	.btn-offset-50x {
		margin-left: 100px;
	}

	.btn-offset-15x {
		margin-left: 15px;
	}
</style>
<div class="container">
	<div class="block-header">
		<h2>菜单管理</h2>
	</div>
	<div class="card">
		<div class="card-header">
			<div class="m-b-md" style="margin-bottom: 18px">
				<form class="form-inline" role="form" id="searchForm"
					  name="searchForm">
					<div class="form-group">
						<label class="control-label"> <span
								class="h4 font-thin v-middle">菜单名:</span></label>
						<input class="input-medium ui-autocomplete-input" id="accountName"/>
					</div>
					<a class="btn btn-default" id="search">查询</a>
				</form>
			</div>
			<button type="button" class="btn btn-success" id="addFun">
				<i class="glyphicon glyphicon-plus"></i>新增
			</button>
			<button type="button" class="btn btn-success" id="editFun">
				<i class="glyphicon glyphicon-plus"></i>修改
			</button>
			<button type="button" class="btn btn-success" id="delFun">
				<i class="glyphicon glyphicon-plus"></i>删除
			</button>
		</div>
		<div class="card-body table-responsive">
			<div id="paging" class="pagclass"></div>
		</div>
	</div>
</div>
<%--<html lang="en" class="app">--%>
<%--<head>--%>
	<%--<style type="text/css">--%>
		<%--.btn-offset-50x {--%>
			<%--margin-left: 100px;--%>
		<%--}--%>

		<%--.btn-offset-15x {--%>
			<%--margin-left: 15px;--%>
		<%--}--%>
	<%--</style>--%>
	<%--<%@include file="/common/common.jspf" %>--%>
	<%--&lt;%&ndash;<script type="text/javascript" src="${ctx}/js/system/user/updatePassword.js">&ndash;%&gt;--%>
	<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--</head>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/resources/list.js"></script>--%>
<%--<body>--%>
<%--<iframe id="npcForm"></iframe>--%>
<%--<section class="vbox">--%>
	<%--<section id="content">--%>
		<%--<section id="id_vbox" class="vbox">--%>
			<%--<ul class="breadcrumb no-border no-radius b-b b-light" id="topli">--%>
			<%--</ul>--%>
			<%--<section class="scrollable" style="margin-top: 55px;">--%>
				<%--<div id="loadhtml">--%>
					<%--<div class="m-b-md">--%>
						<%--<form class="form-inline" role="form" id="searchForm"--%>
							  <%--name="searchForm">--%>
							<%--<div class="form-group">--%>
								<%--<label class="control-label"> <span--%>
										<%--class="h4 font-thin v-middle">菜单名:</span></label> <input--%>
									<%--class="input-medium ui-autocomplete-input" id="name"--%>
									<%--name="resFormMap.name">--%>
							<%--</div>--%>
							<%--<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>--%>
						<%--</form>--%>
					<%--</div>--%>
					<%--<header class="panel-heading">--%>
						<%--<div class="doc-buttons">--%>
							<%--<button type="button" id="addFun" class="btn btn-primary marR10">新增</button>--%>
							<%--<button type="button" id="editFun" class="btn btn-info marR10">编辑</button>--%>
							<%--<button type="button" id="delFun" class="btn btn-danger marR10">删除</button>--%>
						<%--</div>--%>
					<%--</header>--%>
					<%--<div class="table-responsive">--%>
						<%--<div id="paging" class="pagclass"></div>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</section>--%>
		<%--</section>--%>
	<%--</section>--%>

<%--</section>--%>

<%--</body>--%>
<%--</html>--%>