<%@ page language="java"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Link Cloud</title>
    <!-- Vendor CSS -->
    <link href="/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
    <link href="/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
    <link href="/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css"
          rel="stylesheet">
    <!-- CSS -->
    <link href="/css/app.min.1.css" rel="stylesheet">
    <link href="/css/app.min.2.css" rel="stylesheet">
</head>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript">
    $(function () {
        var rootPath = "${ctx}"
        //---------修改人赵雷完毕----------
        var tb = $("#content");
        tb.html('<div class="alert alert-warning">'
                + '<button type="button" class="close" data-dismiss="alert">'
                + '<i class="ace-icon fa fa-times"></i></button><div style="text-align:center">'
                + '<img src="' + rootPath + '/images/loading.gif"/><div>'
                + '</div>');
        /*获取菜单栏中active菜单的url，进行加载*/
        if($("#menuList ul a.active ").length>0){
            //判断是否有权限
            tb.load(rootPath + "/list.jsp");
        }else{
            /*一个权限都没有*/
            tb.load(rootPath + "/WEB-INF/jsp/system/user/list.jsp");
        }

    });
</script>
<body>
<%@include file="header.jsp"%>
<section id="main">
    <%@include file="sidebar.jsp"%>
    <section id="content">

    </section>
</section>
<%@include file="footer.jsp"%>

<!-- Javascript Libraries -->
<script src="/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="/vendors/bower_components/jquery.nicescroll/jquery.nicescroll.min.js"></script>
<script src="/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>

<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="/vendors/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
<![endif]-->

<script src="/js/functions.js"></script>
<script src="/js/demo.js"></script>


</body>
</html>