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
  <link rel="stylesheet" href="${ctx}/assets/build/mediaelementplayer.min.css" />
  <link rel="stylesheet" href="${ctx}/assets/css/pc.css">
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
  <div style="width: 1124px;height:600px;margin: auto;">
    <div style="width:800px;height: 600px;float:left;">
      <video width="800" height="600" id="player1">
        <source type="application/x-mpegURL" src="http://www.streambox.fr/playlists/test_001/stream.m3u8" />
      </video>
    </div>
    <div style="float:left;width: 300px;margin-left:20px;">
      <ul class="am-slides program-change">
        <li><B>节目列表</B></li>
        <c:if test="${list.size() > 0}">
          <c:forEach items="${list}" var="item" varStatus="status">
            <li>
              <a href="javascript:void(0);" data-url="${item.purl}" data-index="${status.index}">${item.pname}</a>
            </li>
          </c:forEach>
        </c:if>
      </ul>
    </div>
  </div>

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
          <p></p>
          <%--<blockquote>是的,非常不错,很有价值</blockquote>--%>
        </div>
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
<div id="test-div">

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
<%--<script charset="utf-8" src="${ctx}/assets/js/jquery.min.js"></script>--%>
<script charset="utf-8" src="${ctx}/assets/build/jquery.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/base.min.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/mobile.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/business/comment.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/business/analysis-pc.js"></script>
<script charset="utf-8" src="${ctx}/assets/build/mediaelement-and-player.min.js"></script>
<script>
  var commentMoreUrl = '${ctx}/space/commentList.shtml';
  var pageNum = ${responseData.pageNum};
  <%--var videoId = ${program.id};--%>
  var userId = '${userId}';
  var devid = '${serialNumber}';

  var ad_url = 'http://${ip_address}/service/getad';
  var analysis_url = 'http://${ip_address}/service/analysis';

  var pid = null;
  var stime = null;
  var ptype_analysis = null;
  var pname_analysis = null;

  var frameArray = [];
//  var video = $('#video-contrl').get(0);
//  var video = videojs('video-contrl');
  $('.program-change li a').on('click',function(){
    player.pause();
    var url = $(this).attr("data-url");
    var index = $(this).attr("data-index");
    console.log('index',index);
    frameArray[index].startOrRePlay();
  })

  $('video').mediaelementplayer({
    success: function(media, node, player) {
      media.addEventListener('timeupdate', function(e) {
//        console.log("ontimeupdate");
      }, false);

      media.addEventListener('loadedmetadata',function(e){
        var that = frameArray[current];
        that.pid = that.getPid(that.cur_url);
        that.stime = that.getDateTime();
        that.ptype_analysis = that.ptype_analysis;
        that.pname_analysis = that.pname_analysis;

        me = that;
        that.interval = setInterval("doSubmitAnalysisV(me)",3000)
        console.log("onloadedmetadata--interval--" + that.interval,'cls',me.cls);
      },false);

      media.addEventListener('ended',function(e){
        var that = frameArray[current];
        if(that.interval != -1) {
          clearInterval(that.interval);
          console.log("ended--interval--" + that.interval,'cls',me.cls);
        }
        that.play();
      },false);

      media.addEventListener('playing',function(e){
        console.log("onplaying--");
      },false);

      media.addEventListener('pause',function(e){
        console.log("onpause");
      },false);
    }
  });

  function changeProgram(e){

  }

  var player = $('video')[0].player;

  var current = 0;
  $(document).ready(function() {
    var slider = $('#demo-slider-0').data('flexslider');

    $('#demo-slider-0').flexslider({
      playAfterPaused: 8000,
      before: function(slider) {
        if (slider._pausedTimer) {
          window.clearTimeout(slider._pausedTimer);
          slider._pausedTimer = null;
        }
      },
      after: function(slider) {
        var pauseTime = slider.vars.playAfterPaused;
        if (pauseTime && !isNaN(pauseTime) && !slider.playing) {
          if (!slider.manualPause && !slider.manualPlay && !slider.stopped) {
            slider._pausedTimer = window.setTimeout(function() {
              slider.play();
            }, pauseTime);
          }
        }
      }
    });

    var programArray = eval("("+ '${array}'+")");
    for(var k = 0;k<programArray.length;k++){
        var program = programArray[k];
        var cls = $('ul li:not(.clone) img').eq(k).attr('class');
        var videoWrapper = new VideoWrapper(program,cls);
       frameArray[k] = videoWrapper;
    }

    frameArray[0].startOrRePlay();
  });

  function getDateTime(){
    // 获取当前时间戳(以s为单位)
    var timestamp = Date.parse(new Date());
    timestamp = timestamp / 1000;
    //当前时间戳为：1403149534
    return timestamp.toString();
  }

  function doSubmitAnalysisV(me){
    var here = me;
    here.ctime = getDateTime();
    ajax2({
      url: analysis_url,
      data: {
        devid: devid,
        userid: userId,
        stime: here.stime,
        ctime: here.ctime,
        ptype: here.ptype_analysis,
        pid: here.pid,
        pname: here.pname_analysis
      },
      success: function (a) {
        console.log("ok-----" + a);
      },
      fail: function (a) {

      }
    });
  }
</script>
</body>
</html>
