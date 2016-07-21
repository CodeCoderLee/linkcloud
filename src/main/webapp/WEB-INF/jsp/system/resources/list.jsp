<%@page language="java"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/css/linkcloud.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">

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
					<a class="btn myButton  btn-default" id="search">查询</a>
				</form>
			</div>
			<button type="button" class="btn myButton  btn-success" id="newBtn">
				<i class="glyphicon glyphicon-plus"></i>新增
			</button>
			<button type="button" class="btn myButton  btn-info" id="modifyBtn">
				<i class="glyphicon glyphicon-edit"></i>修改
			</button>
			<button type="button" class="btn myButton  btn-danger" id="deleteBtn">
				<i class="glyphicon glyphicon-minus"></i>删除
			</button>
		</div>
		<div class="card-body table-responsive">
			<div id="paging" class="pagclass"></div>
		</div>
	</div>
</div>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript" src="${ctx}/common/lyGrid.js"></script>
<script type="text/javascript" src="${ctx}/js/system/resources/list.js"></script>
