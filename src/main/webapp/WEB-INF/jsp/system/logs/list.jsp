<%@page language="java"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<%--<div class="m-b-md">--%>
    <%--<form class="form-inline" role="form" id="searchForm"--%>
          <%--name="searchForm">--%>
        <%--<div class="form-group">--%>
            <%--<label class="control-label"> <span--%>
                    <%--class="h4 font-thin v-middle">账号:</span></label>--%>
            <%--<input class="input-medium ui-autocomplete-input" id="accountName"/>--%>
        <%--</div>--%>
        <%--<a class="btn btn-default" id="search">查询</a>--%>
    <%--</form>--%>
<%--</div>--%>
<%--<div id="log" class="container-fluid">--%>
    <%--<div class="row">--%>

<div class="container">
    <div class="block-header">
        <h2>用户操作日志</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <form class="form-inline" role="form" id="searchForm"
                      name="searchForm">
                    <div class="form-group">
                        <label class="control-label"> <span
                                class="h4 font-thin v-middle">账号:</span></label>
                        <input class="input-medium ui-autocomplete-input" id="accountName"/>
                    </div>
                    <a class="btn btn-default" id="search">查询</a>
                </form>
            </div>
        </div>
        <div class="card-body table-responsive">
        <table id="logTable"
               data-toggle="table"
               data-sort-order="desc"
               data-pagination="true"
               data-pagination-v-align="bottom"
               data-pagination-h-align="right"
               data-pagination-detail-h-align="left"
               data-pagination-first-text="<<"
               data-pagination-last-text=">>"
               data-pagination-pre-text="<"
               data-pagination-next-text=">"
               data-page-size="10"
               data-page-list="[10,25,50,100]"
               data-side-pagination="server"
               data-url="logs/search.shtml"
               data-refresh="true"
               data-click-to-select="true"
               data-locate="zh-CN"
        >
            <thead>
            <tr>
                <th data-field="accountname">帐号</th>
                <th data-field="nickName">昵称</th>
                <th data-field="module">模块</th>
                <th data-field="methods">方法</th>
                <th data-field="operateObj">操作设备</th>
                <th data-field="actiontime">响应时间</th>
                <th data-field="userip">IP地址</th>
                <th data-field="opertime" data-formatter="dateTimeFormatter">操作时间</th>
                <th data-field="description">描述</th>

            </tr>
            </thead>
        </table>
    </div>
</div>

<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.js"/>
<script type="text/javascript"
        src="${ctx}/vendors/bower_components/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"/>
<script type="text/javascript">
    $('#search').click(function () {
        var $accountName = $('#accountName').val();
        var queryObject = new Object();
        /*当参数不为空字符串时,传给后台,避免accountname值为"",导致结果为空*/
        if ($accountName.length) {
            queryObject.accountname = $accountName;
        }
        console.log($accountName);
        $('#logTable').bootstrapTable().bootstrapTable('refresh', {
            query: queryObject
        });
    });
    function dateTimeFormatter(value) {
        console.log(value);
        if (!!value) {
            var date = new Date();
            date.setTime(value);
            return date.toLocaleString();
        } else {
            return "--";
        }
    }
</script>