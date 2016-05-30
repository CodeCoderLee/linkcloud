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
      <a href="#more" class="">更多</a>
</nav>
</div>

<ul class="mindex-ul">
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="${ctx}/assets/i/tv/cctv1.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"></p>
        <p class="mindex-intro"><a href="#">CCTV1</a></p>
        <p class="mindex-time"></p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="${ctx}/assets/i/tv/cctv2.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"></p>
        <p class="mindex-intro"><a href="#">CCTV2</a></p>
        <p class="mindex-time"></p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
      <img class="mindex-ulImg" src="${ctx}/assets/i/tv/cctv5.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"></p>
        <p class="mindex-intro"><a href="#">CCTV5</a></p>
        <p class="mindex-time"></p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
      <img class="mindex-ulImg" src="${ctx}/assets/i/tv/cctv9.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"></p>
        <p class="mindex-intro"><a href="#">CCTV9</a></p>
        <p class="mindex-time"></p>
        <p class="mindex-enter">>></p>
      </div>
  </li>

</ul>
</div>
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
  <h2 class="am-titlebar-title ">
      视频点播
  </h2>
  <nav class="am-titlebar-nav">
      <a href="#more" class="">更多</a>
</nav>
</div>
<ul class="mindex-ul">
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i1.letvimg.com/lc07_iscms/201605/08/10/03/3522b05bc17e48eeab7112d63da921ce.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员2上天</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i3.letvimg.com/lc06_isvrs/201605/06/21/27/47442541-5743-4b16-aecd-091246203be1.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员3</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i1.letvimg.com/lc07_iscms/201605/08/10/03/3522b05bc17e48eeab7112d63da921ce.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员2·辰涛CP上天</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i1.letvimg.com/lc07_iscms/201605/08/10/03/3522b05bc17e48eeab7112d63da921ce.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员2·辰涛CP上天</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
</ul>
</div>
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
  <h2 class="am-titlebar-title ">
      远程监控
  </h2>
  <nav class="am-titlebar-nav">
      <a href="#more" class="">更多</a>
</nav>
</div>
<ul class="mindex-ul">
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i3.letvimg.com/lc06_isvrs/201605/06/21/27/47442541-5743-4b16-aecd-091246203be1.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i1.letvimg.com/lc07_iscms/201605/08/10/03/3522b05bc17e48eeab7112d63da921ce.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员2·CP</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i1.letvimg.com/lc07_iscms/201605/08/10/03/3522b05bc17e48eeab7112d63da921ce.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员2·辰</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i3.letvimg.com/lc06_isvrs/201605/06/21/27/47442541-5743-4b16-aecd-091246203be1.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
      </div>
  </li>
  <li>
    <div class="mindex-avatar">
        <img class="mindex-ulImg" src="http://i3.letvimg.com/lc06_isvrs/201605/06/21/27/47442541-5743-4b16-aecd-091246203be1.jpg"  alt=""/>
      </div>
      <div class="mindex-detail">
        <p class="mindex-title"><a href="#">全员</a></p>
        <p class="mindex-intro">29集 不许动我的男儿身！</p>
        <p class="mindex-time">2016-5-24</p>
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
