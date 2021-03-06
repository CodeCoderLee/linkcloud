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
  <title>列表</title>

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
  <meta name="apple-mobile-web-app-title" content="列表"/>
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
<c:if test="${not empty(list)}">
  <div data-am-widget="header"
        class="am-header am-header-default">
    <div class="am-header-left am-header-nav">
        <c:if test="${parentId == 0}">
            <a href="${ctx}/space/device/${serialNumber}.shtml?openId=${openId}" class="">
                <i class="am-header-icon am-icon-home"></i>${grandpa.pname}
            </a>
        </c:if>
        <c:if test="${parentId != 0}">
            <a href="${ctx}/space/list2/${serialNumber}.shtml?parentId=${grandpa.id}&stype=netdisk" class="">
                <i class="am-header-icon am-icon-chevron-left"></i>${grandpa.pname}
            </a>
        </c:if>
    </div>
    <h1 class="am-header-title">
        <a href="javascript:void(0)" class="">
        ${parent.pname}
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
  <ul class="mindex-ul">
  <c:forEach items="${list}" var="item">
    <li>
        <c:if test="${item.isDir == 1}">
            <a href="${ctx}/space/list2/${serialNumber}.shtml?parentId=${item.id}&stype=netdisk&title1=${title2}&title2=${item.pname}">
                <div class="mindex-avatar">
                     <img class="mindex-ulImg" src="${ctx}/assets/i/file.png" alt=""/>
                </div>
                <div class="mindex-detail">
                     <p class="mindex-title">${item.pname}</p>
                </div>
            </a>
        </c:if>

        <c:if test="${item.isDir == 0}">
            <a href="${ctx}/space/play2/${serialNumber}.shtml?programId=${item.id}">
                <div class="mindex-avatar">
                    <img class="mindex-ulImg" src="${item.pimg}" onerror="this.src='${ctx}/assets/i/live.png'"  alt=""/>
                </div>
                <div class="mindex-detail">
                    <p class="mindex-title">${item.pname}</p>
                </div>
            </a>
        </c:if>
    </li>
  </c:forEach>
  </ul>
</c:if>
<jsp:include page="footer.jsp"/>
  <script charset="utf-8" src="${ctx}/assets/js/jquery.min.js"></script>
  <script charset="utf-8" src="${ctx}/assets/js/base.min.js"></script>
  <script charset="utf-8" src="${ctx}/assets/js/mobile.js"></script>
</body>
</html>
