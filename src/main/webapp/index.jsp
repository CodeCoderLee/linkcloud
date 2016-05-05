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
    <link href="${ctx}/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
    <link href="${ctx}/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css"
          rel="stylesheet">
    <!-- CSS -->
    <link href="${ctx}/css/app.min.1.css" rel="stylesheet">
    <link href="${ctx}/css/app.min.2.css" rel="stylesheet">
</head>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript">
    $(function () {
        var rootPath = "${ctx}"
        //
        var tb = $("#content");
        tb.html('<div class="alert alert-warning">'
                + '<button type="button" class="close" data-dismiss="alert">'
                + '<i class="ace-icon fa fa-times"></i></button><div style="text-align:center">'
                + '<img src="' + rootPath + '/images/loading.gif"/><div>'
                + '</div>');
        /*获取菜单栏中active菜单的url，进行加载*/
        if($("#menuList ul li.active a.active").length>0){
            //判断是否有权限
            console.log($("#menuList ul li.active  a.active"));
            var nav = $($("#menuList ul li.active  a.active")[0]).attr("nav-n");
            console.log("nav",nav);
            var sn = nav.split(",");
            tb.load(rootPath + sn[2]);
            tb.load(rootPath + "/list.jsp");
        }else{
            /*一个权限都没有*/
//            tb.load(rootPath + "/WEB-INF/jsp/system/user/list.jsp");
            tb.load(rootPath + "/denied.jsp");
        }

        $("[nav-n]").each(function () {
            $(this).bind("click", function () {
                var nav = $(this).attr("nav-n");
                var sn = nav.split(",");
                var tb = $("#content");
                tb.html('<div class="alert alert-warning">'
                        + '<button type="button" class="close" data-dismiss="alert">'
                        + '<i class="ace-icon fa fa-times"></i></button><div style="text-align:center">'
                        + '<img src="' + rootPath + '/images/loading.gif"/><div>'
                        + '</div>');
                console.log("path==",rootPath + sn[2]);
                tb.load(rootPath + sn[2]);
            });
        });


    });
</script>
<body>
<%@include file="header.jsp"%>
<section id="main">
    <aside id="sidebar">
        <div class="sidebar-inner c-overflow">
            <div class="profile-menu">
                <a href="">
                    <div class="profile-pic">
                        <c:choose>
                            <c:when test="${sessionScope.user.sex==0}">
                                <img src="img/profile-pics/1.jpg" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="img/profile-pics/2.jpg" alt="">
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="profile-info">
                        ${sessionScope.user.username}
                        <i class="zmdi zmdi-arrow-drop-down"></i>
                    </div>
                </a>

                <ul class="main-menu">
                    <li>
                        <a href="profile-about.html"><i class="zmdi zmdi-account"></i> 个人信息</a>
                    </li>
                    <li>
                        <a href=""><i class="zmdi zmdi-settings"></i> 设置</a>
                    </li>
                    <li>
                        <a href="logout.shtml"><i class="zmdi zmdi-time-restore"></i> 退出</a>
                    </li>
                </ul>
            </div>

            <div id="menuList">
                <ul class="main-menu">
                    <c:forEach var="key" items="${sessionScope.resourceList}" varStatus="s">
                        <li class="<c:if test="${key.children.size()>0}"> sub-menu </c:if>
                                <c:if test="${s.index==0}"> active </c:if>
                                <c:if test="${key.children.size()>0&&s.index==0}"> toggled </c:if>" >

                        <a class="<c:if test="${s.index==0&&key.children.size()==0}"> active </c:if>" nav-n="${key.name},${key.name},${key.resUrl}?id=${kc.id}">
                        <i class="zmdi zmdi-widgets"></i>${key.name}
                        </a>
                            <ul>
                                <c:forEach var="kc" items="${key.children}" varStatus="kcs">
                                    <li <c:if test="${kcs.index==0}">class="active"</c:if> >
                                        <a href="javascript:void(0)"  <c:if test="${kcs.index==0}">class="active"</c:if>
                                           nav-n="${key.name},${kc.name},${kc.resUrl}?id=${kc.id}"> <i
                                                class="fa fa-angle-right"></i> <span>${kc.name}</span>
                                        </a></li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>
    </aside>
    <section id="content">

    </section>
</section>
<%@include file="footer.jsp"%>

<!-- Javascript Libraries -->
<script src="${ctx}/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${ctx}/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="${ctx}/vendors/bower_components/jquery.nicescroll/jquery.nicescroll.min.js"></script>
<script src="${ctx}/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="${ctx}/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>

<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="vendors/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
<![endif]-->

<script src="${ctx}/js/functions.js"></script>
<script src="${ctx}/js/demo.js"></script>


</body>
</html>