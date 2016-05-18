<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${ctx}/js/system/user/edit.js"></script>

    <style type="text/css">
        .col-sm-3 {
            width: 15%;
            float: left;
        }

        .col-sm-9 {
            width: 85%;
            float: left;
        }
    </style>
</head>
<body>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="form" name="form" class="form-horizontal" method="post"
      action="${ctx}/user/modify.shtml">
    <input type="hidden" class="form-control checkacc"
           value="${user.id}" name="id" id="id">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control"
                           placeholder="请输入用户名" value="${user.username}"
                           name="username" id="userName">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">账号</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入账号" value="${user.accountname}"
                           name="accountname" id="accountName" readonly="readonly">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div id="selGroup"
                 data-url="/role/selectRole.shtml?userId=${user.id}"></div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">描述</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入账号描述"
                           value="${user.description}" name="description" id="description">
                </div>
            </div>
        </div>
        <footer class="panel-footer text-right bg-light lter">
            <button type="submit" class="btn btn-success btn-s-xs">保存</button>
            <a id="closeBtn" class="btn btn-success btn-s-xs">关闭</a>
        </footer>
    </section>
</form>
<script type="text/javascript">
    onloadurl();
    $('#closeBtn').click(function () {
        console.log(window.parent);
        window.parent.location.reload();
        window.close();
    });
    function onloadurl(){
        $("[data-url]").each(function () {
            var tb = $(this);
            tb.html(loadingHtml);
            tb.load(rootPath+tb.attr("data-url"));
        });
    }
    function loadingHtml() {
        return '<div class="alert alert-info">'
                + '<button type="button" class="close" data-dismiss="alert">'
                + '<i class="ace-icon fa fa-times"></i></button><div style="text-align:center">'
                + '<img src="' + rootPath + '/images/loading.gif"/><div>'
                + '</div>';
    }
</script>
</body>
</html>