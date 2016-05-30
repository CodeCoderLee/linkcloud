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
  <title>视频</title>

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
<body class="vi-mobile vi-mobileList">
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
<nav data-am-widget="menu" class="am-menu  am-menu-offcanvas1"
 data-am-menu-offcanvas
>
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
   <div data-am-widget="list_news" class="am-list-news am-list-news-default" >
<!--列表标题-->
<div class="am-list-news-bd">
<ul class="am-list">
   <!--缩略图在标题左边-->
    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
      <div class="am-u-sm-5 am-list-thumb">
        <a href="${ctx}/space/device/play.shtml" class="">
          <img src="http://i1.letvimg.com/lc04_isvrs/201605/03/16/40/f463d94c-db61-4d69-af5d-0001fe1840da/thumb/2_400_225.jpg" alt="我很囧，你保重....晒晒旅行中的那些囧！"/>
        </a>
      </div>
      <div class=" am-u-sm-7 am-list-main">
          <h3 class="am-list-item-hd"><a href="${ctx}/space/device/play.shtml" class="">荒原第一集</a></h3>
          <div class="am-list-item-text">荒原第一集</div>
      </div>
    </li>

  </ul>
</div>
  </div>
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
