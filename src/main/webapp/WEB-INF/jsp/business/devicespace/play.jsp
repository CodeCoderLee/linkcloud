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
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="${ctx}/assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
  <!--
  <link rel="canonical" href="http://www.example.com/">
  -->

  <link rel="stylesheet" href="${ctx}/assets/css/base.min.css">
  <link rel="stylesheet" href="${ctx}/assets/css/base.videojs.css"/>
  <link rel="stylesheet" href="${ctx}/assets/css/app.css">
</head>
<body class="vi">

<div class="vi-main">
  <ol class="am-breadcrumb">
    <li><a href="#">首页</a></li>
    <li><a href="#">电影</a></li>
    <li class="am-active">老炮</li>
  </ol>
<h3>${program.pname}</h3>
<div class="vi-video">
  <div class="vi-videoPlayer">
    <div class="vi-videoWrapper">
      <!-- <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg" class="am-img-responsive" alt=""/> -->
      <video id="example_video_1" class="video-js vjs-amazeui" controls preload="none" width="790" height="450"
             poster="http://video-js.zencoder.com/oceans-clip.png"
             data-setup="{}">
        <%--<source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />--%>
        <%--<source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />--%>
        <source src="${program.purl}" type='video/ogg' />
        <track kind="captions" src="video.js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
        <track kind="subtitles" src="video.js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
        <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
      </video>
    </div>
    <div class="vi-videoMenu">
    </div>
</div>
<div class="vi-videoComment">
  <form method="post" id="commentForm">
    <div class="vi-comarea">
      <textarea class="vi-textarea" rows="10" name="text"></textarea>
      <input type="hidden" name="programId" value="${program.id}"/>
      <button class="am-btn am-btn-primary am-fr vi-videoSubBtn" id="commentFormBtn">提交评论</button>
    </div>
  </form>
  <ul class="am-comments-list">

    <li class="am-comment" style="display: none;">
      <a href="#link-to-user-home">
        <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96/q/80" alt="" class="am-comment-avatar" width="48" height="48">
      </a>
      <div class="am-comment-main">
        <header class="am-comment-hd">
          <div class="am-comment-meta">
            <a href="#link-to-user" class="am-comment-author">${comment.user.accountname}</a> 评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
          </div>
        </header>
        <div class="am-comment-bd">
          <p class="comment-text">${comment.comment}</p>
        </div>
      </div>
    </li>

    <c:forEach items="${commentList}" var="comment"  varStatus="status">
      <li class="am-comment">
        <a href="#link-to-user-home">
          <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96/q/80" alt="" class="am-comment-avatar" width="48" height="48">
        </a>
        <div class="am-comment-main">
          <header class="am-comment-hd">
            <div class="am-comment-meta">
              <a href="#link-to-user" class="am-comment-author">${comment.user.accountname}</a> 评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
            </div>
          </header>
          <div class="am-comment-bd">
            <p>${comment.comment}</p>
          </div>
        </div>
      </li>
    </c:forEach>

    </ul>
  </div>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/plugins/jquery/jquery.form.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/video.js/video.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/business/comment.js"></script>
<script>
  videojs.options.flash.swf = "${ctx}/assets/js/video.js/video-js.swf";
</script>
</body>
</html>
