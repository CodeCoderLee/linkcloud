<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="base" value="${pageContext.request.contextPath}" />
<c:set var="basedir" value="/frontpage" />
<c:set var="ctx" value="${base}${basedir}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>安全管理前端系统</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="${ctx}/bootstrap/css/custom.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- 日历 -->
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/dist/css/daterangepicker.css" />
<!-- jvectormap -->
<link rel="stylesheet" href="${ctx}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">

<link rel="stylesheet" href="${ctx}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${ctx}/dist/css/skins/_all-skins.min.css">

<style>

.my-input {
	margin-right: auto;
	margin-left: auto;
	text-align: center;
}
.scrollable{
	overflow-y:auto; overflow-x:auto; 
}


</style>


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="javascript:void(0);" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>NS</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>ANSHAO</b></span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
					<c:if test="${userFormMap.roleKey != 'simple' }">
					<li><a href="${base }/index.shtml" target="_blank"><span class="am-icon-home"></span>后端管理</a></li>
					</c:if>

						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${ctx}/dist/img/user2-160x160.jpg" class="user-image"
								alt="User Image"> <span class="hidden-xs"> ${userFormMap.accountName}</span>
						</a>
							<ul class="dropdown-menu">
						
								<!-- User image -->
								<li class="user-header"><img
									src="${ctx}/dist/img/user2-160x160.jpg" class="img-circle"
									alt="User Image">

									<p>
										 ${userFormMap.accountName}
									</p></li>
								<li class="user-footer">
									<div class="pull-right">
										<a href="logout.shtml" class="btn btn-default btn-flat">退出</a>
									</div>
								</li>
							</ul></li>

					</ul>
				</div>

			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="${ctx}/dist/img/user2-160x160.jpg" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p>工作人员： ${userFormMap.accountName}</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>

				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu" id="myul" >
					<!-- 管理员有的权限判断 -->
					<c:forEach var="key" items="${list}" varStatus="s">
						<li onclick="changeClass(${s.index},${list.size()})" id="treeview${s.index}" class="treeview <c:if test='${s.index==0}'>active</c:if>">
							<a href="javascript:void(0)" nav-n="${key.resUrl}?id=${key.id}"> 
							<i class="fa fa-dashboard"></i> 
							<span>${key.name }</span></a>
						</li>						
					</c:forEach>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper"  style="height:100%;">
			<!-- Main content -->
			<section class="content scrollable" style="overflow-y:auto;" id="loadhtml">
				
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.3.2
			</div>
			<strong>Copyright &copy; 2014-2015 <a
				href="http://www.bcc.ac.cn">北京市计算中心</a>.
			</strong> 保留所有权利.
		</footer>


	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.4 -->
	<script src="${ctx}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="${ctx}/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App 
	<script src="${ctx}/dist/js/app.min.js"></script>-->
	<!-- Sparkline -->
	<script src="${ctx}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="${ctx}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${ctx}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="${ctx}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="${ctx}/plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- <script src="${ctx}/dist/js/pages/dashboard2.js"></script> -->
	<!-- AdminLTE for demo purposes -->
	<script type="text/javascript" src="${ctx}/dist/js/demo.js"></script>
	<script type="text/javascript" src="${base}/common/common.js"></script>  
	<script type="text/javascript">
	
	var rootPath = "${base}";
	

	$(function() {
		//调整内容区域高度
		//$(".main-header").
		var tb = $("#loadhtml");
		tb.html(CommnUtil.loadingImg());
		tb.load(rootPath+"/front/search.shtml");	
		
		var totalH = $(window).height();
		var height = totalH - $('.main-header').height() - 90;
		$('.content-wrapper .content').height(height);
		
		$("[nav-n]").each(function () {
			$(this).bind("click",function(){
				var href = $(this).attr("nav-n");
				var tb = $("#loadhtml");
				tb.html(CommnUtil.loadingImg());
				tb.load(rootPath+href);
			});
		});
 	});
	
	function changeClass(data,count){
		//$('.dtd').css({color:'red'});
		//alert("count::"+count);
		var treeviewId = document.getElementById('treeview'+data);
		var defaultTree = document.getElementById('treeview0');
		for(var i=0;i<count;i++){
			var defaultTree = document.getElementById('treeview'+i);
			defaultTree.setAttribute("class","treeview");
		}
		treeviewId.setAttribute("class", "treeview active");
	}
</script>
</body>
</html>
