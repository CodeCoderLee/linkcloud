<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en" class="app">
<head>
	<style type="text/css">
		.btn-offset-50x {
			margin-left: 100px;
		}

		.btn-offset-15x {
			margin-left: 15px;
		}
	</style>
	<%@include file="/common/common.jspf" %>
	<%--<script type="text/javascript" src="${ctx}/js/system/user/updatePassword.js">--%>
	<%--</script>--%>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/resources/list.js"></script>
<body>
<iframe id="npcForm"></iframe>
<section class="vbox">
	<section id="content">
		<section id="id_vbox" class="vbox">
			<ul class="breadcrumb no-border no-radius b-b b-light" id="topli">
			</ul>
			<section class="scrollable" style="margin-top: 55px;">
				<div id="loadhtml">
					<div class="m-b-md">
						<form class="form-inline" role="form" id="searchForm"
							  name="searchForm">
							<div class="form-group">
								<label class="control-label"> <span
										class="h4 font-thin v-middle">菜单名:</span></label> <input
									class="input-medium ui-autocomplete-input" id="name"
									name="resFormMap.name">
							</div>
							<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
						</form>
					</div>
					<header class="panel-heading">
						<div class="doc-buttons">
							<button type="button" id="addFun" class="btn btn-primary marR10">新增</button>
							<button type="button" id="editFun" class="btn btn-info marR10">编辑</button>
							<button type="button" id="delFun" class="btn btn-danger marR10">删除</button>
						</div>
					</header>
					<div class="table-responsive">
						<div id="paging" class="pagclass"></div>
					</div>
				</div>
			</section>
		</section>
	</section>

</section>

</body>
</html>