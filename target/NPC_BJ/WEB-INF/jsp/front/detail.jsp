<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="base" value="${pageContext.request.contextPath}" />
<c:set var="basedir" value="/frontpage" />
<c:set var="ctx" value="${base}${basedir}" />
<c:set var="pic" value="${base}/front/pic/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AnShao</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="${ctx}/bootstrap/css/custom.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="${ctx}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${ctx}/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<style>

.my-input {
	margin-right: auto;
	margin-left: auto;
	text-align: center;
}
.my-footer {
    text-align: center;
}
.my-content{

    background-color: #ddd !important;
}
.scrollable{
	overflow-y:auto; overflow-x:auto; 
}
.my-row{
    border:1px;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="${ctx}/index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
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
		

		<!-- Content Wrapper. Contains page content 
		<div class="content-wrapper">-->
			<!-- Main content -->
			<section class="content scrollable my-content">
			<!-- row -->
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<!-- 基本信息 -->
			<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"><b>基本信息</b></h3>
			</div>

			<div class="box-header with-border">
			<div class="box-body">
				<ul class="list-group col-md-12">
				  <li class="list-group-item list-group-item-success">
					<dl class="dl-horizontal margin0">
					  <dt>时间</dt>
					  <dd><fmt:formatDate value="${res.date }" pattern="yyyy-MM-dd HH:mm:ss" /></dd>
					</dl>
				  </li>
				  <li class="list-group-item list-group-item-info">
					<dl class="dl-horizontal margin0">
					  <dt>地点</dt>
					  <dd>${location }</dd>
					</dl>						  
				  </li>
				</ul>
			</div>
			</div>			
			<!-- /.box -->
			</div>
			<c:if test="${(res.mobiles)!= null && fn:length(res.mobiles) > 0}">
			<!-- 电子标签 -->
			<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"><b>电子标签信息</b></h3>
			</div>

			<div class="box-header with-border">
			<div class="box-body">
				<table class="table table-striped table-hover">
				  <tr>
                  <th>IMEI</th>
                  <th>IMSI</th>
                  <th>采集时间</th>
                </tr>
                <c:forEach items="${res.mobiles }" var="mobile" varStatus="status">
                <tr>
                  <td>${mobile.imei }</td>
                  <td>${mobile.imsi }</td>
                  <td><fmt:formatDate value="${mobile.date }" pattern="yyyy-MM-dd HH:mm:ss.S" /></td>
                </tr>
                </c:forEach>
				</table>
			</div>
			</div>

			<!-- /.box -->
			</div>
			</c:if>
			
			<c:if test="${(res.identifications)!= null && fn:length(res.identifications) > 0}">
			<!-- 身份证信息 -->
			<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"><b>身份证信息</b></h3>
			</div>

			<div class="box-header with-border">
			<div class="box-body">
				<table class="table table-striped table-hover">
				  <tr class="success">
					  <th style="width: 10px">#</th>
					  <th>身份证号</th>
					  <th>姓名</th>
					  <th>性别</th>
					  <th>出生年月日</th>
					  <th>户口所在地</th>
					  <th >有效期限</th>
					  <th><i class="fa  fa-clock-o"></i>&nbsp; 采集时间</th>
				  </tr>
				  <c:forEach items="${res.identifications }" var="iden" varStatus="status">
				  <tr>
					  <td>${status.index }</td>
					  <td>${iden.uid }</td>
					  <td>${iden.name }</td>
					  <td>${iden.gender }</td>
					  <td>${iden.birthday }</td>
					  <td>${iden.address }</td>
					  <td>${iden.expDate }</td>
					  <td><fmt:formatDate value="${iden.date }" pattern="yyyy-MM-dd HH:mm:ss.S" /></td>
				  </tr>
				  </c:forEach>
				</table>
			<!-- /.box-body -->
			</div>

			
			</div>
			<!-- /.box -->
			</div>
			</c:if>
			
			<c:if test="${(res.faces)!= null && fn:length(res.faces) > 0}">
			<!-- 照片信息 -->
			<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"><b>照片信息</b></h3>
			</div>

			<div class="box-header with-border">
			<c:forEach items="${res.faces }" var="face" varStatus="status">
			<div class="box-body">
				<div class="row my-row">
				  <div class="col-xs-6 col-md-2">
					<a href="#" class="thumbnail">
					<img src="${pic }${face.face }.shtml" alt="${face.face }._id " class="margin" />
					</a>
				  </div>
				  <div class="col-md-2"></div>
				  <div class="col-xs-6 col-md-2">
					<a href="#" class="thumbnail">
					  <img src="${pic }${face.body }.shtml" alt="${face.body }._id " class="margin" />
					</a>
				  </div>
				  <div class="col-md-2"></div>
				  <div class="col-xs-6 col-md-2">
				    <table class="list-group col-md-12">
						<tr><td>年龄：${face.age }</td></tr>
						<tr><td>性别：${face.gender }</td></tr>
						<tr><td>身高：${face.height }</td></tr>
						<tr><td>胖瘦：${face.fat }</td></tr>
						<tr><td>采集时间：<fmt:formatDate value="${face.date }" pattern="yyyy-MM-dd HH:mm:ss.S" /></td></tr>
					</table>
				  
				  </div>
				</div>

			<!-- /.box-body -->
			</div>
			</c:forEach>

			
			</div>
			<!-- /.box -->
			</div>
			</c:if>
			
			<!-- /.col -->
			</div>
			<div class="col-md-2"></div>
			<!-- /.row -->
			</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<div id="footer" class="container my-footer" >
		<nav class="navbar navbar-default navbar-fixed-bottom">
		    <div class="navbar-inner navbar-content-center">
		        <div class="pull-right hidden-xs">
				<b>Version</b> 2.3.2
			</div>
			<strong>Copyright &copy; 2014-2015 <a
				href="http://www.bcc.ac.cn">北京市计算中心</a>.
			</strong> 保留所有权利.
		    </div>
		</nav>
		</div>




	<!-- </div>
	 ./wrapper -->
	<!-- jQuery 2.1.4 -->
	<script src="${ctx}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="${ctx}/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${ctx}/dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="${ctx}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="${ctx}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${ctx}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="${ctx}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="${ctx}/plugins/chartjs/Chart.min.js"></script>
	
	<!-- AdminLTE for demo purposes -->
	<script src="${ctx}/dist/js/demo.js"></script>
	<script>
$(document).ready(function(){
	var totalH = $(window).height();
	var height = totalH - $('.main-header').height() - 80;
	//alert("height:::"+height);
	$('.my-content').height(height);
	
	
    $('#myCarousel').carousel();
  });
</script>
</body>
</html>
