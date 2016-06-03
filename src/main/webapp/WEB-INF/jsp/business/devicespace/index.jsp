<%@page language="java" pageEncoding="UTF-8" %>
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

  <meta name="renderer" content="webkit">

  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="${ctx}/assets/i/favicon.png">

  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="${ctx}/assets/i/app-icon72x72@2x.png">

  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="视频"/>
  <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">

  <meta name="msapplication-TileImage" content="${ctx}/assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <link rel="stylesheet" href="${ctx}/assets/css/base.min.css">
  <link rel="stylesheet" href="${ctx}/assets/css/mobile.css">
</head>
<body class="vi-mobile">
  <div data-am-widget="header"
        class="am-header am-header-default">
    <div class="am-header-left am-header-nav">
        <c:set var="hasRole" value="true"/>
        <c:if test="${hasRole}">
        <a href="${ctx}/index.shtml" class="">
            <i class="am-header-icon am-icon-home"></i>
        </a>
        管理员
        </c:if>
    </div>
    <h1 class="am-header-title">
        <a href="#title-link" class="">
          设备空间
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
   <!-- <form class="mobile-search">
     <input type="search" placeholder="请输入你要查找的视频"/>
   </form> -->
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

     <c:if test="${not empty(map)}">
         <c:forEach items="${map}" var="entry">
             <c:if test="${entry.key eq 'tv'}">
                 <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
                     <h2 class="am-titlebar-title ">
                         电视直播
                     </h2>
                     <nav class="am-titlebar-nav">
                         <a href="${ctx}/space/list/${serialNumber}.shtml?stype=dtmb&openId=${openId}" class="">更多</a>
                     </nav>
                 </div>
                 <c:if test="${not empty(map[entry.key])}">
                 <ul class="mindex-ul">
                     <c:forEach items="${map[entry.key]}" var="item">
                     <li>
                         <div class="mindex-avatar">
                             <img class="mindex-ulImg" src="${ctx}/assets/i/live.png"  alt=""/>
                         </div>
                         <div class="mindex-detail">
                             <p class="mindex-title"><a href="${ctx}/space/play/${serialNumber}.shtml?programId=${item.id}&openId=${openId}">${item.pname}</a></p>
                         </div>
                     </li>
                     </c:forEach>

                 </ul>
                 </c:if>
             </c:if>


             <c:if test="${entry.key eq 'vedio'}">
                 <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
                     <h2 class="am-titlebar-title ">
                         视频点播
                     </h2>
                     <nav class="am-titlebar-nav">
                         <a href="${ctx}/space/device/list.shtml?stype=netdisk&openId=${openId}" class="">更多</a>
                     </nav>
                 </div>

                 <c:if test="${not empty(map[entry.key])}">
                     <ul class="mindex-ul">
                         <c:forEach items="${map[entry.key]}" var="item">
                             <li>
                                 <div class="mindex-avatar">
                                     <img class="mindex-ulImg" src="${ctx}/assets/i/demand.png"  alt=""/>
                                 </div>
                                 <div class="mindex-detail">
                                     <p class="mindex-title"><a href="${ctx}/space/play/${serialNumber}.shtml?programId=${item.id}&openId=${openId}">${item.pname}</a></p>
                                 </div>
                             </li>
                         </c:forEach>
                     </ul>
                 </c:if>
             </c:if>

             <c:if test="${entry.key eq 'camera' and not empty(map[entry.key])}">
                 <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
                     <h2 class="am-titlebar-title ">
                         远程监控
                     </h2>
                     <nav class="am-titlebar-nav">
                         <a href="${ctx}/space/device/list/${serialNumber}.shtml?stype=camera&openId=${openId}" class="">更多</a>
                     </nav>
                 </div>
                 <c:if test="${not empty(map[entry.key])}">
                     <ul class="mindex-ul">
                         <c:forEach items="${map[entry.key]}" var="item">
                             <li>
                                 <div class="mindex-avatar">
                                     <img class="mindex-ulImg" src="${ctx}/assets/i/remote.png"  alt=""/>
                                 </div>
                                 <div class="mindex-detail">
                                     <p class="mindex-title"><a href="${ctx}/space/play/${serialNumber}.shtml?programId=${item.id}&openId=${openId}">${item.pname}</a></p>
                                 </div>
                             </li>
                         </c:forEach>
                     </ul>
                 </c:if>
             </c:if>
         </c:forEach>
     </c:if>

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
