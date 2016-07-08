<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>播放页面</title>
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
  <link rel="stylesheet" href="${ctx}/assets/css/base.videojs.css"/>
  <link rel="stylesheet" href="${ctx}/assets/css/mobile.css">
</head>
<body class="vi-mobile vi-mobileList">
<div data-am-widget="header" class="am-header am-header-default">
  <div class="am-header-left am-header-nav">
    <a href="${ctx}/space/device/${serialNumber}.shtml?openId=${openId}" class="">
      <i class="am-header-icon am-icon-home"></i>
    </a>
  </div>
  <h1 class="am-header-title">
    <a href="javascript:void(0)" class="">
      ${program.pname}
    </a>
  </h1>
  <div class="am-header-right am-header-nav">
  </div>
</div>
<div class="mobile-main">
  <%--<video id="play-video" class="video-js vjs-amazeui vi-video" controls preload="none"--%>
         <%--data-setup="{}" style="width:100%;height:350px;">--%>
    <%--<source src="${program.purl}" type='video/mp4' />--%>
    <%--&lt;%&ndash;<source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />&ndash;%&gt;--%>
    <%--&lt;%&ndash;<source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />&ndash;%&gt;--%>
    <%--<track kind="captions" src="video.js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->--%>
    <%--<track kind="subtitles" src="video.js/demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->--%>
    <%--<p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>--%>
  <%--</video>--%>
    <video width="100%" height="360" controls="" autoplay="">
      <!-- MP4 must be first for iPad! -->
      <%--<source src="${program.purl}" type="video/mp4"><!-- Safari / iOS, IE9 -->--%>
    </video>
  <div class="mobile-getComment">
    <form method="post" id="commentForm">
      <textarea class="mobile-vi-textarea" rows="5" name="text" placeholder="请输入你的评论^_^"></textarea>
      <input type="hidden" name="programId" value="${program.id}"/>
      <button class="am-btn am-btn-primary am-fr commentSub" id="commentFormBtn">提交</button>
    </form>
  </div>

  <div id="comment-list">
    <article class="am-comment mobile-comment" style="display: none;">
      <a href="#link-to-user-home">
        <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" alt="" class="am-comment-avatar" width="48" height="48">
      </a>
      <div class="am-comment-main">
        <header class="am-comment-hd">
          <div class="am-comment-meta">
            <a href="#link-to-user" class="am-comment-author">${comment.accountname}</a> 评论于
            <span class="am-comment-time">${comment.publishDateStr}</span>
          </div>
          <div class="am-comment-actions">
            <a href=""><i class="am-icon-pencil"></i></a>
            <a href=""><i class="am-icon-close"></i></a>
          </div>
        </header>
        <div class="am-comment-bd">
          <p>这部电影不错</p>
          <%--<blockquote>是的,非常不错,很有价值</blockquote>--%>
        </div>
        <%--<footer class="am-comment-footer">--%>
          <%--<div class="am-comment-actions">--%>
            <%--<a href=""><i class="am-icon-thumbs-up"></i></a>--%>
            <%--<a href=""><i class="am-icon-thumbs-down"></i></a>--%>
            <%--<a href=""><i class="am-icon-reply"></i></a>--%>
          <%--</div>--%>
        <%--</footer>--%>
      </div>
    </article>
    <c:set var="commentList" value="${responseData.rows}" />
  <c:forEach items="${commentList}" var="comment"  varStatus="status">
    <article class="am-comment mobile-comment">
        <a href="#link-to-user-home">
          <img src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96" alt="" class="am-comment-avatar" width="48" height="48">
        </a>
        <div class="am-comment-main">
          <header class="am-comment-hd">
            <div class="am-comment-meta">
              <a href="#link-to-user" class="am-comment-author">${comment.accountname}</a> 评论于
              <%--<fmt:formatDate value="${comment.publishDate}" pattern="yyyy-MM-dd  HH:mm:ss" var="time" type="both" />--%>
             <span class="am-comment-time">${comment.publishDateStr}</span>
            </div>
            <div class="am-comment-actions">
              <c:if test="${comment.update}">
                <a href="javascript:void(0);" class="am-comment-update"><i class="am-icon-pencil"></i></a>
                <a href="javascript:void(0);" class="am-comment-delete"><i class="am-icon-close"></i></a>
              </c:if>
            </div>
          </header>
          <div class="am-comment-bd">
            <div class="am-comment-edit-text" style="display: none;">
              <textarea class="mobile-vi-textarea" rows="2" name="text" readonly>${comment.comment}</textarea>
              <input type="hidden" name="commentId" value="${comment.id}"/>
              <button class="am-btn am-btn-primary am-fr commentSub okBtn">确定</button>
              <button class="am-btn am-btn-primary am-fr commentSub cancelBtn">取消</button>
            </div>
            <p>${comment.comment}</p>
            <%--<blockquote>是的,非常不错,很有价值</blockquote>--%>
          </div>
        </div>
      </article>
    </c:forEach>
  </div>

  <c:if test="${responseData.hasNextPage}">
  <div id="more" style="margin-left: auto;margin-right: auto;width: 100px;">
      <span style="display:block;"><a href="javascript:void(0)" class="more-comment">显示更多</a></span>
  </div>
  </c:if>

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
<%--<script charset="utf-8" src="${ctx}/assets/js/video.js/video.js"></script>--%>
<%--<script charset="utf-8" src="${ctx}/assets/js/video.js/videojs-contrib-hls.min.js"></script>--%>
<script charset="utf-8" src="${ctx}/assets/js/business/comment.js"></script>
<script>
  var commentMoreUrl = '${ctx}/space/commentList.shtml';
  var pageNum = ${responseData.pageNum};

  var videoId = ${program.id};
  var ptype = '${ptype}';
  var pname = '${pname}';
  var userId = '${userId}';
  var devid = '${serialNumber}';

  var stime;
  var ctime;
  var pid;
  var interval;
  var ptype_analysis;
  var pname_analysis;
  var cur_url;

  var source_url = '${program.purl}';
  var ad_url = 'http://${ip_address}/service/getad';
  var analysis_url = 'http://${ip_address}/service/analysis';

  var playList = ['', source_url];
  var playListLen = playList.length;
  var playIndex = 0;

  var video = document.getElementsByTagName('video')[0];
  video.addEventListener('ended', play);

  function getPid(url){
    if(url == source_url){
      ptype_analysis = ptype;
      pname_analysis = pname;
      return videoId;
    }else{
      ptype_analysis = 'ad';
      pname_analysis = '';
      return getAdId(url);
    }
  }

  video.onloadedmetadata = function () {
    pid = getPid(cur_url);
    stime = getDateTime();
    interval = setInterval("doSubmitAnalysisV()",3000)
    console.log("onloadedmetadata--interval--" + interval);
  }

  video.ended = function(){
    clearInterval(interval);
    console.log("ended--interval--" + interval);
  }

  video.ontimeupdate = function(){
    console.log("ontimeupdate");
  }

  video.onplaying = function(){
    console.log("onplaying");
  }

  function doSubmitAnalysisV(){
    ctime = getDateTime();
    ajax2({
      url: analysis_url,
      data: {
        devid: devid,
        userid: userId,
        stime: stime,
        ctime: ctime,
        ptype: ptype_analysis,
        pid: pid,
        pname: pname_analysis
      },
      success: function (a) {
        console.log("ok-----" + a);
      },
      fail: function (a) {

      }
    });
  }

  ajax({
    url: ad_url,
    data: {},
    success: function (a) {
      var json_obj = JSON.parse(a);
      playList[0] = json_obj.url;
      //service/getad得到反馈会是{"url":"http://192.168.1.13/vod/6.MP4"}
      play();
    },
    fail: function (a) {
      playIndex++;
      playNext();
    }
  });


  function getDateTime(){
    // 获取当前时间戳(以s为单位)
    var timestamp = Date.parse(new Date());
    timestamp = timestamp / 1000;
    //当前时间戳为：1403149534
    console.log("当前时间戳为：" + timestamp);
    return timestamp.toString();
  }

  //service/getad得到反馈会是{"url":"http://192.168.1.13/ad/6.mp4"}
  function getAdId(url){
    var sindex = url.indexOf("ad/");
    var eindex = url.indexOf(".mp4");
    var id = url.substring(sindex+3,eindex);
    return id;
  }

  function play(e) {
    if (playIndex >= playListLen) {
      return;
    }
    cur_url = playList[playIndex];
    video.src = cur_url;
    video.load();
    video.play();
    playIndex++;
  }

  function playNext(e) {
    if (playIndex >= playListLen) {
      return;
    }
    cur_url = playList[playIndex];
    video.src = cur_url;
    video.load();
    video.play();
    playIndex++;
  }

  function ajax(a) {
    var d, b = "";
    var c = new XMLHttpRequest;
    a.data || (a.data = {});
    c.open("GET", a.url);
    c.send(null);
    c.onreadystatechange = function () {
      if (4 === c.readyState) {
        200 === c.status ? a.success(c.responseText) : a.fail && a.fail(c.status);
      }
    }
  }

  function ajax2(a) {
    var d, b = "{";
    var c = new XMLHttpRequest;
    a.data || (a.data = {});

    for (d in a.data) {
      if (b == "{") {
        b += '"' + d + '":"' + a.data[d] + '"';
      }
      else {
        b += ',"' + d + '":"' + a.data[d] + '"';
      }

    }
    b += "}";
    c.open("POST", a.url);
    c.send(b);
    c.onreadystatechange = function () {
      if (4 === c.readyState) {
        200 === c.status ? a.success(c.responseText) : a.fail && a.fail(c.status);
      }
    }
  }
</script>
</body>
</html>
