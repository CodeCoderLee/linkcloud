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
  <video width="100%" height="360" webkit-playsinline controls="" autoplay="" id="player1">
    <!-- MP4 must be first for iPad! -->
    <%--<source src="${program.purl}" type="video/mp4"><!-- Safari / iOS, IE9 -->--%>
  </video>
  <div class="mobile-main">
    <div class="mobile-videoSwitch">
      <i class="am-icon-chevron-left  mobile-videoBtn mobile-videoPrev"></i>
      <i class="am-icon-chevron-right mobile-videoBtn mobile-videoNext"></i>
      <div class="index-slider">
        <div class="slider-programs" id="programList">
          <span>11</span>
          <span>12</span>
          <span>13</span>
          <span>14</span>
          <span>15</span>
        </div>
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
<script charset="utf-8" src="${ctx}/assets/js/jquery.min.js"></script>
<%--<script charset="utf-8" src="${ctx}/assets/build/jquery.js"></script>--%>
<script charset="utf-8" src="${ctx}/assets/js/base.min.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/mobile.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/hammer.min.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/business/comment.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/business/analysis-mobile.js"></script>
<script>
  var commentMoreUrl = '${ctx}/space/commentList.shtml';
  var pageNum = ${responseData.pageNum};
  <%--var videoId = ${program.id};--%>
  var userId = '${userId}';
  var devid = '${serialNumber}';

  var ad_url = 'http://${ip_address}/service/getad';
  var analysis_url = 'http://${ip_address}/service/analysis';

  var player = $('#player1').get(0);

  var currentVideoWrapper;

  $(document).ready(function() {

    /********************************************************************************************************************
     *
     */
    var num = 0;
    var clsArr = [];
    var vSlider = document.getElementById('programList');
    var current = null;
    var vSliderMc = new Hammer(vSlider);
    var max = null;
    var $videoPrev = $('.mobile-videoPrev');
    var $videoNext = $('.mobile-videoNext');
    var $pragramList = $('.slider-programs');
    var forwarFlag = null;
    var $winW = null;
    var $pragram = $('.slider-programs span');
    var pragramLen = $pragram.length;
    var pragramHtml = [];
    var tempArr = [];
    var $mobileBtn = $('.mobile-videoBtn');
    /*视频来源*/
    var frameArray = [];
    var programArray = eval("("+ '${array}'+")");
    for(var k = 0;k<programArray.length;k++){
      var program = programArray[k];
//      program.pname = 'test' + k;
      var videoWrapper = new VideoWrapper(program,k);
      frameArray[k] = videoWrapper;
    }
    // vSliderMc.on("swipe", function(ev) {
    //   clsArr = ev.target.className.split(' ');
    //   num = Number(clsArr[clsArr.length-1].split('-')[1]);
    //   max = $('.video-slider li:not(.clone)').length-1;
    //   if (ev.deltaX<0) {
    //     num === max ? current = 0 : current = num+1;
    //   } else if (ev.deltaX>0) {
    //     num === 0 ? current = max : current = num-1;
    //   }
    //   console.log('当前视频url:',current,ev.deltaX>0? '滑动向右' : '滑动向左');
    // });
    $pragram.css({
      'width': $(window).width()/3-25 + 'px'
    });

    function changeMouse() {
      $mobileBtn.css({
        'cursor': 'pointer',
        'color': '#555'
      }).removeClass('not-allowed');
    }
    function genPragramList() {
      console.log(forwarFlag);
      $pragram = $('.slider-programs span');
      var iarr = [];
      pragramLen = $pragram.length;
      var tempEl = null;
      if(frameArray.length == 1 ){
        var videWrapper = frameArray[0];
        tempEl = videWrapper.program;
        pragramHtml.push('<span></span>');
        pragramHtml.push('<span><a href="' + tempEl['purl'] + '">' + tempEl['pname'] + '</a></span>');
        pragramHtml.push('<span></span>');
        $pragramList.html(pragramHtml.join(''));
        console.log($pragramList.html());
        $pragram = $('.slider-programs span');
        $pragram.each(function () {
          $(this).css({
            'border': '1px solid #eee'
          });
        });
        $pragram.eq(1).css({
          'border': '2px solid #10a0ea'
        });
        $pragram.css({
          'width': $(window).width() / 3 - 25 + 'px',
          'margin-right': '5px'
        });
        $mobileBtn.css({
          'cursor': 'not-allowed',
          'color':"#eee"
        }).addClass('not-allowed');
        pragramHtml = [];
      }else if(frameArray.length == 2){
        if (tempArr.length > 0) {
          frameArray = tempArr;
        }
        pragramHtml.push('<span></span>');
        var videWrapper1 = frameArray[0];
        tempEl = videWrapper1.program;
        pragramHtml.push('<span><a href="' + tempEl['purl'] + '">' + tempEl['pname'] + '</a></span>');

        var videWrapper2 = frameArray[1];
        tempEl = videWrapper2.program;
        pragramHtml.push('<span><a href="' + tempEl['purl'] + '">' + tempEl['pname'] + '</a></span>');

        iarr.push(videWrapper2);
        iarr.push(videWrapper1);

        $pragramList.html(pragramHtml.join(''));
        console.log($pragramList.html());
        $pragram = $('.slider-programs span');
        $pragram.each(function () {
          $(this).css({
            'border': '1px solid #eee'
          });
        });
        $pragram.eq(1).css({
          'border': '2px solid #10a0ea'
        });
        $pragram.css({
          'width': $(window).width() / 3 - 25 + 'px',
          'margin-right': '5px'
        });
        tempArr = iarr;
        iarr = [];
        pragramHtml = [];
      }else {
        if (!forwarFlag && forwarFlag !== 0) {
          frameArray.map(function (el, index) {
            pragramHtml.push('<span><a href="' + el['purl'] + '">' + el['pname'] + '</a></span>');
          });
          $pragramList.html(pragramHtml.join(''));
          $pragram = $('.slider-programs span');
          $pragram.css({
            'width': $(window).width() / 3 - 25 + 'px',
            'margin-right': '5px'
          });
          forwarFlag = 0;
        } else if (forwarFlag === 0) {
          console.log('prev happen');
          if (tempArr.length > 0) {
            frameArray = tempArr;
          }
          pragramHtml = frameArray.map(function (el, index) {
            if (index === 0) {
              var videWrapper = frameArray[frameArray.length - 1];
              tempEl = videWrapper.program;
              console.log(tempEl);
              iarr.push(videWrapper);
              return '<span><a href="' + tempEl['purl'] + '">' + tempEl['pname'] + '</a></span>';
            } else {
              var videWrapper = frameArray[index - 1];
              tempEl = videWrapper.program;
              iarr.push(videWrapper);
              return '<span><a href="' + tempEl['purl'] + '">' + tempEl['pname'] + '</a></span>';
            }
          });
          console.clear();
          console.log(pragramHtml, iarr);
          tempArr = iarr;
          $pragramList.html(pragramHtml.join(''));
          console.log($pragramList.html());
          $pragram = $('.slider-programs span');
          $pragram.each(function () {
            $(this).css({
              'border': '1px solid #eee'
            });
          });
          $pragram.eq(1).css({
            'border': '2px solid #10a0ea'
          });
          $pragram.css({
            'width': $(window).width() / 3 - 25 + 'px',
            'margin-right': '5px'
          });
          pragramHtml = [];
        } else {
          console.log('next happen');
          if (tempArr.length > 0) {
            frameArray = tempArr;
          }
          pragramHtml = frameArray.map(function (el, index) {
            if (index === frameArray.length - 1) {
              var videWrapper = frameArray[0];
              tempEl = videWrapper.program;
              console.log(tempEl);
              iarr.push(videWrapper);
              return '<span><a href="' + tempEl['purl'] + '">' + tempEl['pname'] + '</a></span>';
            } else {
              var videWrapper = frameArray[index + 1];
              tempEl = videWrapper.program;
              iarr.push(videWrapper);
              return '<span><a href="' + tempEl['purl'] + '">' + tempEl['pname'] + '</a></span>';
            }
          });
          // console.clear();
          console.log(pragramHtml, iarr);
          tempArr = iarr;
          iarr = [];
          $pragramList.html(pragramHtml.join(''));
          console.log($pragramList.html());
          $pragram = $('.slider-programs span');
          $pragram.each(function () {
            $(this).css({
              'border': '1px solid #eee'
            });
          });
          $pragram.eq(1).css({
            'border': '2px solid #10a0ea'
          });
          $pragram.css({
            'width': $(window).width() / 3 - 25 + 'px',
            'margin-right': '5px'
          });
          pragramHtml = [];
        }
      }
    }
    $pragramList.on('click',function(e) {
      if (e.target.tagName != 'A') return;
      e.preventDefault();
      /*处理视频切换逻辑*/
      console.log(e.target.href);
    });

    function prevHandler() {
      console.clear();
      if(frameArray.length >1) {
        forwarFlag = 0;
        genPragramList();
        currentVideoWrapper = frameArray[0];
        console.log("current", currentVideoWrapper.pname);
        $("input[name=programId]").attr("value",currentVideoWrapper.programId);
        changeMouse();
        $(event.target).css({
          'color': '#10a0ea'
        });
        setTimeout(currentVideoWrapper.startOrRePlay(), 1500);
      }
    }

    function nextHandler() {
      console.clear();
      if(frameArray.length >1) {
        forwarFlag = 1;
        genPragramList();
        currentVideoWrapper = frameArray[2];
        $("input[name=programId]").attr("value",currentVideoWrapper.programId);
        console.log("current", currentVideoWrapper.pname);
        changeMouse();
        $(event.target).css({
          'color': '#10a0ea'
        });
        setTimeout(currentVideoWrapper.startOrRePlay(), 1500);
      }
    }

    $(window).resize(function() {
      $pragram = $('.slider-programs span');
      $pragram.css({
        'width': $(window).width()/3-25 + 'px',
        'margin-right': '5px'
      });
    });
    $videoNext.on('click',nextHandler);
    $videoPrev.on('click',prevHandler);
    genPragramList();


    /*************************************************************************************************************************
     *
     * @type {Object}
       */

    currentVideoWrapper = frameArray[0];
    setTimeout(frameArray[1].startOrRePlay(),1500);

  });


  player.onloadedmetadata = function () {
    var that = currentVideoWrapper;
    pid = that.getPid(that.cur_url);
    stime = that.getDateTime();
    interval = setInterval(doSubmitAnalysisV(that),3000)
    console.log("onloadedmetadata--interval--" + interval);
  }

  player.onended = function(){
    var that = currentVideoWrapper;
    clearInterval(interval);
    console.log("ended--interval--" + interval);
    that.play();
  }

//  player.ontimeupdate = function(){
//    console.log("ontimeupdate");
//  }

  player.onplaying = function(){
    console.log("onplaying");
  }


  function doSubmitAnalysisV(me){
    var here = me;
    here.ctime = here.getDateTime();
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
