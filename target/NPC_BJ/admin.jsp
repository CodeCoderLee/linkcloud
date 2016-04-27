<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html lang="en" class="app">
<head>
    <%@include file="/common/common.jspf" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width,ninitial-scale=1,maximum-scale=1,user-scalable=no">
    <title>Amaze UI Touch</title>
    <meta name="renderer" content="webkit">
    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate icon" type="image/png" href="i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="AMUI React"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/app.css"/>

    <style type="text/css">
        .btn-offset-50x {
            margin-left: 100px;
        }

        .btn-offset-15x {
            margin-left: 15px;
        }

    </style>
    <script type="text/javascript" src="${ctx}/js/system/user/updatePassword.js">
    </script>
    
    
    <script type="text/javascript">
        $(function () {
            //修改时间2015年10月13日14:32:57
            //修改在手机上点击菜单后菜单不关闭问题
            //修改人赵雷
            var winwidth = $("body").width();
            if (winwidth < 770) {
                $("#nav ul.lt li").click(function () {
                    $("#nav").removeClass("nav-off-screen");
                });
            }
            //---------修改人赵雷完毕----------
            var tb = $("#loadhtml");
            tb.html(CommnUtil.loadingImg());
            /*获取昨天菜单栏中active菜单的url，进行加载*/
            if($("#nav ul.lt li.active a").length>0){
                //判断是否有权限
                var url = $("#nav ul.lt li.active a").attr("nav-n");
                url = url.substring(url.lastIndexOf(",")+1,url.length);
                tb.load(rootPath + url);
            }else{
                /*一个权限都没有*/
                tb.load(rootPath + "/denied.jsp");
            }
            $("[nav-n]").each(function () {
                $(this).bind("click", function () {
                    var nav = $(this).attr("nav-n");
                    var sn = nav.split(",");
                    var html = '<li><i class="fa fa-home"></i>';
                    html += '<a href="index.shtml">Home</a></li>';
                    for (var i = 0; i < 2; i++) {
                        html += '<li><a href="javascript:void(0)">' + sn[i] + '</a></li>';
                    }

                    //added by lisy  2015-12-23  start
                    //设备配置管理添加顶部操作菜单
                    //if(sn[2].indexOf('device') > 0){
                    //html+='<span style="display:inline-block;"><button type="button" class="btn btn-primary btn-offset-50x" id="btn-add-device">添加设备</button><button type="button" class="btn btn-primary btn-offset-15x" id="btn-del-device">删除设备</button></span>';
                    //}
                    //added by lisy  2015-12-23  end

                    $("#topli").html(html);
                    var tb = $("#loadhtml");
                    tb.html(CommnUtil.loadingImg());
                    tb.load(rootPath + sn[2]);
                });
            });
        });
    </script>
</head>
<body class="" style="">
<section class="vbox">
    <header class="bg-dark dk header navbar navbar-fixed-top-xs">
        <div class="navbar-header aside-md">
            <a class="btn btn-link visible-xs"
               data-toggle="class:nav-off-screen,open" data-target="#nav,html">
                <i class="fa fa-bars"></i>
            </a> <a href="index.shtml#" class="navbar-brand"
                    data-toggle="fullscreen"><img
                src="${ctx}/notebook/notebook_files/logo.png" class="m-r-sm">NPCBJ</a>
            <a class="btn btn-link visible-xs" data-toggle="dropdown"
               data-target=".nav-user"> <i class="fa fa-cog"></i>
            </a>
        </div>
        <ul class="nav navbar-nav hidden-xs"></ul>
        <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">

            <li class="dropdown">
                <a href="${ctx}/front.shtml" target="_blank">前端管理 </a>
            </li>

            <li class="dropdown hidden-xs"><a href="index.html#"
                                              class="dropdown-toggle" data-toggle="dropdown"> <span
                    class="thumb-sm avatar pull-left"> <img
                    src="${ctx}/notebook/notebook_files/avatar.jpg">
					</span> ${user.accountname} <b class="caret"></b>
            </a>
                <ul class="dropdown-menu animated fadeInRight">
                    <span class="arrow top"></span>
                    <li><a href="#" onclick="javascript:updatePasswordLayer();">密码修改</a></li>
                    <li class="divider"></li>
                    <li><a href="logout.shtml">退出</a></li>
                </ul>
            </li>
        </ul>
    </header>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <aside class="bg-dark lter aside-md hidden-print hidden-xs" id="nav">
                <section class="vbox">
                    <!-- <header class="header bg-primary lter text-center clearfix">
                        <div class="btn-group">
                        系统菜单
                        </div>
                    </header> -->
                    <section class="w-f scrollable">
                        <div class="slim-scroll" data-height="auto"
                             data-disable-fade-out="true" data-distance="0" data-size="5px"
                             data-color="#333333">
                            <!-- nav -->
                            <nav class="nav-primary hidden-xs">
                                <ul class="nav">
                                    <c:forEach var="key" items="${list}" varStatus="s">
                                        <!-- <li class="active"> 某一项展开-->
                                        <li <c:if test="${s.index==0}">class="active"</c:if>>
                                            <a href="javascript:void(0)"
                                               <c:if test="${s.index==0}">class="active"</c:if>> <c:if
                                                    test="${s.index==0}">
                                                <i class="fa fa-dashboard icon"> <b class="bg-danger"></b>
                                                </i>
                                            </c:if> <c:if test="${s.index==1}">
                                                <i class="fa fa-pencil-square icon"> <b
                                                        class="bg-warning"></b>
                                                </i>
                                            </c:if> <c:if test="${s.index==2}">
                                                <i class="fa fa-columns icon"> <b class="bg-primary"></b>
                                                </i>
                                            </c:if> <c:if test="${s.index==3}">
                                                <i class="fa fa-book icon"> <b class="bg-info"></b>
                                                </i>
                                            </c:if> <c:if test="${s.index==4}">
                                                <i class="fa fa-th-list icon"> <b class="bg-success"></b>
                                                </i>
                                            </c:if> <span class="pull-right"> <i
                                                    class="fa fa-angle-down text"></i> <i
                                                    class="fa fa-angle-up text-active"></i>
												</span> <span>${key.name}</span>
                                            </a>

                                            <ul class="nav lt">
                                                <c:forEach var="kc" items="${key.children}" varStatus="kcs">
                                                    <li <c:if test="${kcs.index==0}">class="active"</c:if> >
                                                        <a href="javascript:void(0)"  class="active"
                                                           nav-n="${key.name},${kc.name},${kc.resUrl}?id=${kc.id}"> <i
                                                                class="fa fa-angle-right"></i> <span>${kc.name}</span>
                                                        </a></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                            <!-- / nav -->
                        </div>
                    </section>
                    <!--
                    <footer class="footer lt hidden-xs b-t b-dark">
                        <div id="chat" class="dropup">
                            <section class="dropdown-menu on aside-md m-l-n">
                                <section class="panel bg-white">
                                    <header class="panel-heading b-b b-light">Active
                                        chats</header>
                                    <div class="panel-body animated fadeInRight">
                                        <p class="text-sm">No active chats.</p>
                                        <p>
                                            <a href="#" class="btn btn-sm btn-default">Start a chat</a>
                                        </p>
                                    </div>
                                </section>
                            </section>
                        </div>

                        <div id="invite" class="dropup">
                            <section class="dropdown-menu on aside-md m-l-n">
                                <section class="panel bg-white">
                                    <header class="panel-heading b-b b-light">
                                        John <i class="fa fa-circle text-success"></i>
                                    </header>
                                    <div class="panel-body animated fadeInRight">
                                        <p class="text-sm">No contacts in your lists.</p>
                                        <p>
                                            <a href="#" class="btn btn-sm btn-facebook"><i
                                                class="fa fa-fw fa-facebook"></i> Invite from Facebook</a>
                                        </p>
                                    </div>
                                </section>
                            </section>
                        </div>
                        <a href="#nav" data-toggle="class:nav-xs"
                            class="pull-right btn btn-sm btn-dark btn-icon"> <i
                            class="fa fa-angle-left text"></i> <i
                            class="fa fa-angle-right text-active"></i>
                        </a>
                        <div class="btn-group hidden-nav-xs">
                            <button type="button" title="Chats"
                                class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
                                data-target="#chat">
                                <i class="fa fa-comment-o"></i>
                            </button>
                            <button type="button" title="Contacts"
                                class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
                                data-target="#invite">
                                <i class="fa fa-facebook"></i>
                            </button>
                        </div>
                    </footer>-->
                </section>
            </aside>
            <!-- /.aside -->
            <section id="content">
                <section id="id_vbox" class="vbox">
                    <ul class="breadcrumb no-border no-radius b-b b-light" id="topli">
                    </ul>
                    <section class="scrollable" style="margin-top: 55px;">
                        <div id="loadhtml"></div>
                    </section>
                </section>
            </section>
            <aside class="bg-light lter b-l aside-md hide" id="notes">
                <div class="wrapper">Notification</div>
            </aside>
        </section>
    </section>
</section>
<!-- Bootstrap -->
<div id="flotTip" style="display: none; position: absolute;"></div>


</body>
</html>