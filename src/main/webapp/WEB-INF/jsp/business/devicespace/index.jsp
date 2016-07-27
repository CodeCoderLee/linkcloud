<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${serialNumber}-${onoff}</title>

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
    <link rel="stylesheet" href="${ctx}/assets/css/progress.css">
</head>
<body class="vi-mobile">
<div data-am-widget="header"
     class="am-header am-header-default">
    <div class="am-header-left am-header-nav">
        <%--<c:set var="hasRole" value="true"/>--%>
        <c:if test="${hasRole}">
            <a href="javascript:void(0);" class="gohome-a">
                <i class="am-header-icon am-icon-home"></i><b>个人空间</b>
                <form action="${ctx}/index.shtml" id="gohome-form">
                    <input type="hidden" value="${base64}" name="messenger">
                </form>
            </a>
        </c:if>
    </div>
    <%--<h1 class="am-header-title">--%>
        <%--${serialNumber}-${onoff}--%>
    <%--</h1>--%>
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
        <div data-am-widget="slider" class="mobile-slider am-slider am-slider-c2"
             data-am-slider='{"directionNav":false}'>
            <ul class="am-slides">
                <c:if test="${arraySize > 0}">
                    <c:forEach items="${array}" var="item" varStatus="status">
                        <c:if test="${status.index <= 5}">
                            <li>
                                <img src="${item.url}">
                                <div class="am-slider-desc">广告</div>
                                <div class="cls_ad_id" style="display: none">${item.id}</div>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${arraySize == 0}">
                    <li>
                        <img src="http://i0.letvimg.com/lc04_iscms/201605/08/00/16/8040034b659f49888ac9aab9f985f94b.jpg">
                        <div class="am-slider-desc">欢乐颂</div>
                    </li>
                    <li>
                        <img src="http://i0.letvimg.com/lc04_iscms/201605/08/00/16/8040034b659f49888ac9aab9f985f94b.jpg">
                        <div class="am-slider-desc">欢乐颂</div>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>

    <c:if test="${not empty(map)}">
    <c:forEach items="${map}" var="entry">
    <c:if test="${entry.key eq 'tv'}">
    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header">
        <h2 class="am-titlebar-title " style="color:black;">
            电视直播
        </h2>
        <nav class="am-titlebar-nav">
            <a href="${ctx}/space/list/${serialNumber}.shtml?stype=dtmb&openId=${openId}" class="">更多</a>
        </nav>
    </div>

    <ul class="mindex-ul" id="ul-tv-1">
        <li style="display: none;">
            <section class="container">
                <div class="progress">
                    <span class="orange" style="width: 100%;"><span>客官稍等，扫频操作执行中</span></span>
                    <span class="red" style="width: 0%;"><span>0%</span></span>
                </div>
            </section>
        </li>
    </ul>
    <c:if test="${not empty(map[entry.key])}">
    <ul class="mindex-ul" id="ul-tv-2">
        <c:forEach items="${map[entry.key]}" var="item">
            <li>
                <a href="${ctx}/space/play/${serialNumber}.shtml?programId=${item.id}&openId=${openId}">
                    <div class="mindex-avatar">
                        <img class="mindex-ulImg" src="${item.pimg}" onerror="this.src='${ctx}/assets/i/error.png'"
                             alt=""/>
                    </div>
                    <div class="mindex-detail">
                        <p class="mindex-title">${item.pname}</p>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>
    </c:if>
    </c:if>
    </c:forEach>
    </c:if>

    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header">
        <h2 class="am-titlebar-title " style="color:black;">
            视频点播
        </h2>
        <nav class="am-titlebar-nav">
            <a href="${ctx}/space/list2/${serialNumber}.shtml?stype=netdisk&title1=${title2}&title2=${item.pname}&parentId=0" class="">更多</a>
        </nav>
    </div>
    <ul class="mindex-ul">
        <c:forEach items="${netdiskList}" var="item">
            <li>
                <c:if test="${item.isDir == 1}">
                    <a href="${ctx}/space/list2/${serialNumber}.shtml?stype=netdisk&title1=${title2}&title2=${item.pname}&parentId=${item.id}">
                        <div class="mindex-avatar">
                              <img class="mindex-ulImg" src="${ctx}/assets/i/file.png" alt=""/>
                        </div>
                        <div class="mindex-detail">
                               <p class="mindex-title">${item.pname} </p>
                        </div>
                    </a>
                </c:if>

                <c:if test="${item.isDir == 0}">
                    <a href="${ctx}/space/play2/${serialNumber}.shtml?programId=${item.id}">
                        <div class="mindex-avatar">
                                 <img class="mindex-ulImg" src="${ctx}/assets/i/live.png" alt=""/>
                        </div>
                        <div class="mindex-detail">
                                <p class="mindex-title">
                                    ${item.pname}
                                </p>
                         </div>
                    </a>
                </c:if>
            </li>
        </c:forEach>
    </ul>

    <c:if test="${not empty(map)}">
    <c:forEach items="${map}" var="entry">
    <c:if test="${entry.key eq 'camera' and not empty(map[entry.key])}">
    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header">
        <h2 class="am-titlebar-title " style="color:black;">
            摄像头
        </h2>
        <nav class="am-titlebar-nav">
            <a href="${ctx}/space/list/${serialNumber}.shtml?stype=camera&openId=${openId}" class="">更多</a>
        </nav>
    </div>
    <c:if test="${not empty(map[entry.key])}">
    <ul class="mindex-ul">
        <c:forEach items="${map[entry.key]}" var="item">
            <li>
                <a href="${ctx}/space/play/${serialNumber}.shtml?programId=${item.id}&openId=${openId}">
                    <div class="mindex-avatar">
                        <img class="mindex-ulImg" src="${ctx}/assets/i/remote.png" alt=""/>
                    </div>
                    <div class="mindex-detail">
                        <p class="mindex-title">${item.pname}</p>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>
    </c:if>
    </c:if>
    </c:forEach>
    </c:if>


    <div data-am-widget="titlebar" class="vi-mobile" style="text-align: center;">
         <a href="${ctx}/space/goDebugHeartBeat/${serialNumber}.shtml?space=true">点击进入调式详情</a>
    </div>

    <jsp:include page="footer.jsp"/>
    <script charset="utf-8" src="${ctx}/assets/js/jquery.min.js"></script>
    <script charset="utf-8" src="${ctx}/assets/js/base.min.js"></script>
    <script charset="utf-8" src="${ctx}/assets/js/mobile.js"></script>
    <script type="text/javascript" charset="utf-8">
        var baseUrl = '${ctx}/space/getTvPrograms/${serialNumber}.shtml'

        var interval;
        var interval_program;
        var isScan = ${isScan};
        if(isScan){
            $('#ul-tv-1 li').attr('style',"display:block");
            interval = self.setInterval("getProgress()",1000)
        }

        function getProgramList(){
            jQuery.ajax({
                url:baseUrl,
                data:{type:0},
                type:"POST",
                success:function(data)
                {
                    $('#ul-tv-1 li:first').attr('style',"display:none");
                    if(data){
                        clearInterval(interval_program);
                        data = eval("("+data+")");
                        $('#ul-tv-2').empty();
                        $('#ul-tv-2').append(data);
                    }else{

                    }
                }
            });
        }

        function getProgress(){
            jQuery.ajax({
                url:baseUrl,
                type:"POST",
                success:function(data)
                {
                    if(data){
                        data = eval("("+data+")");
                        var scanFreqInfos = jQuery.parseJSON(data);
                        if(scanFreqInfos["scanEnded"]){
                            clearInterval(interval);
                            //读取节目
                            interval_program = setInterval("getProgramList()",5000);
                        }else{
                            //更新进度条
                            var progress = scanFreqInfos['progress'];
                            $('#ul-tv-1 .red').attr('style',"width:" + progress + "%")
                            $('#ul-tv-1 .red').text(progress + "%");
                        }
                    }
                }
            });
        }


        $(".gohome-a").on("click",function(){
            $('#gohome-form').submit();
        })
    </script>
</body>
</html>
