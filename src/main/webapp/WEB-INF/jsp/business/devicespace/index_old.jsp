<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>设备空间</title>
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="${ctx}/assets/i/favicon.png">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="${ctx}/assets/i/app-icon72x72@2x.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="视频"/>
    <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="${ctx}/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->
    <link rel="stylesheet" href="${ctx}/assets/css/base.min.css">
    <link rel="stylesheet" href="${ctx}/assets/css/mobile.css">
</head>
<body class="vi-mobile">
<div data-am-widget="header"
     class="am-header am-header-default">
    <div class="am-header-left am-header-nav">
        <a href="#left-link" class="">
            <i class="am-header-icon am-icon-home"></i>
        </a>
    </div>
    <h1 class="am-header-title">
        <a href="#title-link" class="">
            视频
        </a>
    </h1>
    <div class="am-header-right am-header-nav">
        <!-- <a href="#right-link" class="">
            <i class="am-header-icon am-icon-bars"></i>
        </a> -->
        <!-- <a href="#right-link" class="">
            <i class="am-header-icon am-icon-history"></i>
        </a>
        <a href="#right-link" class="">
            <i class="am-header-icon am-icon-user"></i>
        </a> -->
    </div>
</div>
<nav data-am-widget="menu" class="am-menu  am-menu-offcanvas1" data-am-menu-offcanvas>
    <a href="javascript: void(0)" class="am-menu-toggle">
        <i class="am-menu-toggle-icon am-icon-bars"></i>
    </a>
    <div class="am-offcanvas" >
        <div class="am-offcanvas-bar">
            <ul class="am-menu-nav am-avg-sm-1">
                <li class="am-parent">
                    <a href="##" class="" >热门</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-2 ">
                        <li class="">
                            <a href="##" class="" >欢乐颂</a>
                        </li>
                        <li class="">
                            <a href="##" class="" >致青春</a>
                        </li>
                    </ul>
                </li>
                <li class="am-parent">
                    <a href="##" class="" >电视剧</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-3 ">
                        <li class="">
                            <a href="##" class="" >欢乐颂</a>
                        </li>
                        <li class="">
                            <a href="##" class="" >琅琊榜</a>
                        </li>
                    </ul>
                </li>
                <li class="am-parent">
                    <a href="#c3" class="" >电影</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-2">
                        <li class="">
                            <a href="##" class="" >美国队长3</a>
                        </li>
                        <li class="">
                            <a href="##" class="" >谁的青春不迷茫</a>
                        </li>
                    </ul>
                </li>
                <li class="am-parent">
                    <a href="##" class="" >综艺</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-3">
                        <li class="">
                            <a href="##" class="" >我是歌手</a>
                        </li>
                        <li class="">
                            <a href="##" class="" >中国好声音</a>
                        </li>
                    </ul>
                </li>
                <li class="">
                    <a href="##" class="" >体育</a>
                </li>
                <li class="">
                    <a href="##" class="" >财经</a>
                </li>
            </ul>

        </div>
    </div>
</nav>
<div class="mobile-main">
    <form class="mobile-search">
        <input type="search" placeholder="请输入你要查找的视频"/>
    </form>
    <div class="mobile-sliderWrapper">
        <div data-am-widget="slider" class="mobile-slider am-slider am-slider-c2" data-am-slider='{"directionNav":false}' >
            <ul class="am-slides">
                <li>
                    <img src="http://i0.letvimg.com/lc04_iscms/201605/08/00/16/8040034b659f49888ac9aab9f985f94b.jpg">
                    <div class="am-slider-desc">欢乐颂</div>
                </li>
                <li>
                    <img src="http://i0.letvimg.com/lc04_iscms/201605/08/00/16/8040034b659f49888ac9aab9f985f94b.jpg">
                    <div class="am-slider-desc">欢乐颂</div>
                </li>
            </ul>
        </div>
    </div>
    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
        <h2 class="am-titlebar-title ">
            电视直播
        </h2>
        <nav class="am-titlebar-nav">
            <a href="${ctx}/space/device/list.shtml" class="">更多</a>
        </nav>
    </div>
    <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
am-avg-md-3 am-avg-lg-4 am-gallery-default" data-am-gallery="{ pureview: true }" >
        <li>
            <div class="am-gallery-item">
                <a href="#" class="">
                    <img src="http://i1.letvimg.com/lc07_iscms/201605/08/10/03/3522b05bc17e48eeab7112d63da921ce.jpg"  alt="远方 有一个地方 那里种有我们的梦想"/>
                    <h3 class="am-gallery-title">悍将妻子自嘲成小三</h3>
                    <div class="am-gallery-desc">中情局：恒大6主力缺战</div>
                </a>
            </div>
        </li>
        <li>
            <div class="am-gallery-item">
                <a href="#" class="">
                    <img src="http://i3.letvimg.com/lc06_isvrs/201605/06/21/27/47442541-5743-4b16-aecd-091246203be1.jpg"  alt="某天 也许会相遇 相遇在这个好地方"/>
                    <h3 class="am-gallery-title">全员2·辰涛CP上天</h3>
                    <div class="am-gallery-desc">杜海涛“打鸡血”护沈梦辰</div>
                </a>
            </div>
        </li>
        <li>
            <div class="am-gallery-item">
                <a href="#" class="">
                    <img src="http://i3.letvimg.com/lc06_iscms/201604/26/17/06/04e43c7152a14383aba4d75b8f79845c.jpg"  alt="不要太担心 只因为我相信"/>
                    <h3 class="am-gallery-title">绝命卦师</h3>
                    <div class="am-gallery-desc">29集 不许动我的男儿身！</div>
                </a>
            </div>
        </li>
        <li>
            <div class="am-gallery-item">
                <a href="#" class="">
                    <img src="http://i3.letvimg.com/lc04_isvrs/201605/03/19/35/57cf7674-10f7-41c4-9714-5644331e5eba.jpg"  alt="终会走过这条遥远的道路"/>
                    <h3 class="am-gallery-title">父亲的身份</h3>
                    <div class="am-gallery-desc">19集 俞北平危在旦夕</div>
                </a>
            </div>
        </li>
    </ul>
</div>
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
    <h2 class="am-titlebar-title ">
        视频点播
    </h2>
    <nav class="am-titlebar-nav">
        <a href="${ctx}/space/device/list.shtml" class="">更多</a>
    </nav>
</div>
<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
am-avg-md-3 am-avg-lg-4 am-gallery-default" data-am-gallery="{ pureview: true }" >
    <li>
        <div class="am-gallery-item">
            <a href="#" class="">
                <img src="http://i1.letvimg.com/lc07_iscms/201605/08/10/03/3522b05bc17e48eeab7112d63da921ce.jpg"  alt="远方 有一个地方 那里种有我们的梦想"/>
                <h3 class="am-gallery-title">悍将妻子自嘲成小三</h3>
                <div class="am-gallery-desc">中情局：恒大6主力缺战</div>
            </a>
        </div>
    </li>
    <li>
        <div class="am-gallery-item">
            <a href="#" class="">
                <img src="http://i3.letvimg.com/lc06_isvrs/201605/06/21/27/47442541-5743-4b16-aecd-091246203be1.jpg"  alt="某天 也许会相遇 相遇在这个好地方"/>
                <h3 class="am-gallery-title">全员2·辰涛CP上天</h3>
                <div class="am-gallery-desc">杜海涛“打鸡血”护沈梦辰</div>
            </a>
        </div>
    </li>
    <li>
        <div class="am-gallery-item">
            <a href="#" class="">
                <img src="http://i3.letvimg.com/lc06_iscms/201604/26/17/06/04e43c7152a14383aba4d75b8f79845c.jpg"  alt="不要太担心 只因为我相信"/>
                <h3 class="am-gallery-title">绝命卦师</h3>
                <div class="am-gallery-desc">29集 不许动我的男儿身！</div>
            </a>
        </div>
    </li>
    <li>
        <div class="am-gallery-item">
            <a href="#" class="">
                <img src="http://i3.letvimg.com/lc04_isvrs/201605/03/19/35/57cf7674-10f7-41c4-9714-5644331e5eba.jpg"  alt="终会走过这条遥远的道路"/>
                <h3 class="am-gallery-title">父亲的身份</h3>
                <div class="am-gallery-desc">19集 俞北平危在旦夕</div>
            </a>
        </div>
    </li>
</ul>
</div>
<footer data-am-widget="footer"
        class="am-footer am-footer-default"
        data-am-footer="{  }">
    <div class="am-footer-miscs ">
        <p>CopyRight©2016 ihtml5版权所有</p>
        <p>京ICP备xxxxxx</p>
    </div>
</footer>
<script charset="utf-8" src="${ctx}/assets/js/jquery.min.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/base.min.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/mobile.js"></script>
</body>
</html>
