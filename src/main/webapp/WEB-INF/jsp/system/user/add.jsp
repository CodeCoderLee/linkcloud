<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${ctx}/js/system/user/add.js">

    </script>
    <style type="text/css">
        .col-sm-3 {
            width: 18%;
            float: left;
            text-align: right;
        }

        .col-sm-9 {
            width: 82%;
            float: left;
            text-align: left;
        }

        label[class^="btn btn-default"] {
            margin-top: -4px;
        }
    </style>
</head>
<body>
<div class="l_err" style="width: 100%;height:10px; margin-top: 2px;"></div>
<form id="form" name="form" class="form-horizontal" method="post"
      action="${ctx}/user/add.shtml">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">用户名</label>
                </div>
                <div class="col-sm-9">
                    <input type="text" class="form-control"
                           placeholder="请输入用户名" name="username" id="username">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">账号</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入账号" name="accountname" id="accountname">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">密码</label>
                <div class="col-sm-9" style="color: red;">
                    默认密码为:123456
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group" style="margin-right:3px" id="selRole" data-url="/role/selectRole.shtml"></div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">是否禁用</label>
                <div class="col-sm-9">
                    <div class="btn-group m-r">
                        <button data-toggle="dropdown" class="btn btn-sm btn-default dropdown-toggle">
                            <span class="dropdown-label">是</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-select">
                            <li class="active">
                                <a href="#">
                                    <input type="radio" name="locked" value="0" checked="checked">是
                                </a>
                            </li>
                            <li class="">
                                <a href="#">
                                    <input type="radio" name="locked" value="1">否
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">描述</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入账号描述"
                           name="description" id="description">
                </div>
            </div>
        </div>
        <footer class="panel-footer text-right bg-light lter">
            <button type="submit" class="btn btn-success btn-s-xs">提交</button>
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
</script>
</body>
</html>