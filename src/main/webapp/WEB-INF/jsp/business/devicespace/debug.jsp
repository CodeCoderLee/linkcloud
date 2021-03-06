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
  <title>调试空间</title>

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
        <%--<c:set var="hasRole" value="true"/>--%>
        <c:if test="${hasRole}">
        <a href="${ctx}/index.shtml" class="">
            <i class="am-header-icon am-icon-home"></i>
        </a>
        管理员
        </c:if>
    </div>
    <h1 class="am-header-title">
        <a href="#title-link" class="">
          调试空间
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


                 <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
                     <h2 class="am-titlebar-title ">
                         设备列表
                     </h2>
                     <nav class="am-titlebar-nav">

                     </nav>
                 </div>
                <div>
                 <ul class="mindex-ul device-list">
                     <li style="display: none;">
                         <div class="mindex-avatar">
                             <img class="mindex-ulImg" src="${ctx}/assets/i/live.png"  alt=""/>
                         </div>
                         <div class="mindex-detail">
                             <p class="mindex-title"><a class="a-space-device-cls" >${item.serialNumber}</a></p>
                         </div>
                     </li>

                     <c:if test="${not empty(rd.rows)}">
                     <c:set var="list" value="${rd.rows}"/>
                         <c:forEach items="${list}" var="item">
                          <li>
                             <div class="mindex-avatar">
                                 <img class="mindex-ulImg" src="${ctx}/assets/i/live.png"  alt=""/>
                             </div>
                             <div class="mindex-detail">
                                 <p class="mindex-title"><a class="a-space-device-cls" href="${ctx}/space/device/${item.serialNumber}.shtml?type=show&openId=${openId}">${item.serialNumber}</a></p>
                             </div>
                         </li>
                         </c:forEach>
                     </c:if>
                  </ul>
                </div>
     <c:if test="${rd.hasNextPage}">
     <div id="more" style="margin-left: auto;margin-right: auto;width: 100px;">
         <span style="display:block;"><a href="javascript:void(0)" class="more-comment">显示更多</a></span>
     </div>
     </c:if>
  <jsp:include page="footer.jsp"/>
  <script charset="utf-8" src="${ctx}/assets/js/jquery.min.js"></script>
  <script charset="utf-8" src="${ctx}/assets/js/base.min.js"></script>
  <script charset="utf-8" src="${ctx}/assets/js/mobile.js"></script>

     <script type="text/javascript" charset="utf-8">
         var baseUrl = '${ctx}/space/device/';
         var openId = '${openId}';
         var postUrl = '${ctx}/space/debugList.shtml';
         var pageNum = ${rd.pageNum};
         $("#more .more-comment").on("click",function(){
             //alert('pageNum------' + pageNum);
             jQuery.ajax({
                 url:postUrl,
                 data:{'pageNum':pageNum},
                 type:"POST",
                 beforeSend:function()
                 {
                     $('#more').hide();
                 },
                 success:function(data)
                 {
                     var pageInfo = jQuery.parseJSON(data);
                     $('#more').show();
                     var li0 = $('.device-list li:first');
                     for(var index in pageInfo.rows){
                         var idx = parseInt(index) + 1;
                         var device = pageInfo.rows[index];
                         $('.device-list').append(li0.clone());
                         $('.device-list li:last').attr("style","display:block");
                         //$('article:eq(' + idx + ')').text(comment.user.accountname);
                         //${item.serialNumber}.shtml?type=show&openId=${openId}
                         $('.device-list li:last .a-space-device-cls').attr("href",baseUrl + device.serialNumber + ".shtml?type=show&openId" + openId ) ;
                         $('.device-list li:last .a-space-device-cls').text(device.serialNumber);
                     }
                     pageNum = pageInfo.pageNum ;
                     var h = $(document).height()-$(window).height();
                     $(document).scrollTop(h);
                     if(!pageInfo.hasNextPage) {
                         $("#more").attr("style", "display:none;");
                     }
                 }
             });
             return false;
         })
     </script>
</body>
</html>
