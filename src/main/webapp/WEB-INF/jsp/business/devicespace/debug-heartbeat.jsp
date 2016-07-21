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
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />--%>
    <title>调试详情</title>

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
    <link rel="stylesheet" href="${ctx}/assets/css/mobile2.css">
</head>
<body class="vi-mobile">
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
    <h2 class="am-titlebar-title ">
        调试详情--(${serialNumber})
        <%--<input type="button" value="SHOCK" class="shock-cmd-op">--%>
        <%--<input type="button" value="停止" class="start-stop">--%>
        <%--<input type="hidden" value="${base64}" name="base64">--%>
    </h2>
</div>
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default mobile-header" >
    <h2 class="am-titlebar-title ">
        <button class="btn btn-info myButton shock-cmd-op">SHOCK</button>
        <button class="btn btn-info myButton start-stop"  data="stop">停止</button>
        <button class="btn btn-info myButton back-btn" id="back">返回</button>
        <form action="${ctx}/index.shtml" id="gohome-form" style="float:right;">
            <input type="hidden" class="btn btn-info myButton" value="${base64}" name="messenger">
        </form>
    </h2>
</div>
<div >
    <ul class="mindex-ul heartbeat-list">
        <li style="display: none;">
            <div style="float:left;border:0.1px;padding:3px; PADDING:0px; width:350px; height:150px; LINE-HEIGHT: 20px; OVERFLOW: auto; ">
                <img class="mindex-ulImg" src="${ctx}/assets/i/hand.png"  alt=""/>
                <span class="text-content"></span>
            </div>
        </li>
    </ul>
</div>

<footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }">
    <div class="am-footer-miscs ">
        <p>CopyRight©2016 ihtml5版权所有</p>
        <p>京ICP备xxxxxx</p>
    </div>
</footer>
<script charset="utf-8" src="${ctx}/assets/js/jquery.min.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/base.min.js"></script>
<script charset="utf-8" src="${ctx}/assets/js/mobile.js"></script>

<script type="text/javascript" charset="utf-8">

    var interval = self.setInterval("heartbeat()",1000)

    var seq = '';
    var baseUrl = '${ctx}/space/getHeartBeat.shtml';
    function heartbeat(){
        jQuery.ajax({
            url:baseUrl,
            data:{serialNumber:'${serialNumber}',seq:seq},
            type:"POST",
            success:function(data)
            {
                var heartbeat = jQuery.parseJSON(data);
                if(heartbeat['validate']) {
                    var li0 = $('.heartbeat-list li:last');
                    seq = heartbeat['seq'];
                    var str = heartbeat['json'];
                    var dtime = heartbeat['date-time'];
                    li0.clone().insertBefore($('.heartbeat-list li:first'));
                    $('.heartbeat-list li:first').attr("style", "display:block");
                    $('.heartbeat-list li:first .text-content').text("seq:" + seq +  "  时间：" + dtime + "  " + JSON.stringify(str));
                }
            }
        });
    }

    $('.start-stop').on("click",function(){
        var v = $(this).attr("data");
        if(v == "start"){
            interval = self.setInterval("heartbeat()",1000)
            $(this).attr("data","stop");
            $(this).text("停止");
        }else if(v == 'stop'){
            clearInterval(interval);
            $(this).attr("data","start");
            $(this).text("开始");
        }

    })

    $('.shock-cmd-op').on("click",function(){
        jQuery.ajax({
            url:'${ctx}/device/shock.shtml',
            data:{serialNumber:'${serialNumber}'},
            type:"POST",
            success:function(data)
            {
                alert('指令下发成功');
            }
        });
    });

    $(".back-btn").on("click",function(){
        var space = $('.from-space').attr("value");
        if(space){
            location.href = "${ctx}/space/device/${serialNumber}.shtml";
        }else {
            $('#gohome-form').submit();
        }
    })
</script>
</body>
</html>
