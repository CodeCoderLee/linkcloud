<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>用户信息管理</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <input type="hidden" value="${limit}" id="limit">
            <input type="hidden" value="${offset}" id="offset">
            <input type="hidden" value="${sortName}" id="sortName">
            <input type="hidden" value="${sortOrder}" id="sortOrder">
            <div class="m-b-md" style="margin-bottom: 18px">
                <%--<form class="form-inline" role="form" id="searchForm"--%>
                      <%--name="searchForm">--%>
                    <div class="form-group">
                        <label class="control-label"> <span
                                class="h4 font-thin v-middle">姓名/昵称:</span></label>
                        <input class="input-medium ui-autocomplete-input" id="searchParam" name="nickName"/>
                        <%--<a class="btn myButton  btn-default" id="search">查询</a>--%>
                        <button class="btn myButton  btn-default" id="search">查询</button>
                    </div>

                <%--</form>--%>
            </div>
            <button type="button" class="btn myButton  btn-info" id="modifyBtn">
                <i class="glyphicon glyphicon-edit"></i>修改
            </button>
            <button id="refreshBtn" class="btn myButton  btn-default">
                <i class="glyphicon glyphicon-refresh"></i>刷新
            </button>
        </div>
        <div class="card-body table-responsive">
            <table id="bccTable"
                   data-toggle="table"
                   data-sort-name="createtime"
                   data-sort-order="desc"
                   data-pagination="true"
                   data-pagination-v-align="bottom"
                   data-pagination-h-align="right"
                   data-pagination-detail-h-align="left"
                   data-pagination-first-text="<<"
                   data-pagination-last-text=">>"
                   data-pagination-pre-text="<"
                   data-pagination-next-text=">"
                   data-page-size="5"
                   data-page-list="[5,10,25,50,100]"
                   data-side-pagination="server"
                   data-url="user/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            <%--data-height="300"--%>
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <th data-field="username">姓名</th>
                    <th data-field="accountname">unionId</th>
                    <th data-field="nickName" data-sortable="true">昵称</th>
                    <th data-field="sex"  data-formatter="sexFormatter">性别</th>
                    <th data-field="city" data-formatter="areaFormatter">地区</th>
                    <th data-field="createtime" data-sortable="true" data-formatter="dateTimeFormatter">创建时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.js"/>
<script type="text/javascript"
        src="${ctx}/vendors/bower_components/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"/>
<script type="text/javascript">
    var addUrl = "user/addUI.shtml";
    var modifyUrl = "user/modifyUI.shtml?id=";
    var deleteUrl = "user/delete.shtml";
    function sexFormatter(value){
        if (!!value) {
            if(value == 1){
                return '男';
            }else {
                return '女';
            }
        }
        return '-';
    }

    function areaFormatter(value,row){
        if(row['country'] == null || row['country'] == ''){
            return '-'
        }else {
            return row['country'] + "." + row['province'] + "." + row['city'];
        }
    }
    $(document).ready(function () {
        var limit = $('#limit').val();
        var offset = $('#offset').val();
        var sortOrder = $('#sortOrder').val();
        var sortName = $('#sortName').val();
        var options = {};
        if (limit) {
            options.pageSize = Number(limit);
        }
        if (offset) {
            options.pageNumber = Number(offset)/Number(limit)+1;
        }
        if (sortOrder) {
            options.sortOrder = sortOrder;
        }
        if (sortName) {
            options.sortName = sortName;
        }
        console.log("options===",options);
        if (!$.isEmptyObject(options)) {
            $('#bccTable').bootstrapTable('refreshOptions',options);
        }


    });

</script>
<script type="text/javascript" src="${ctx}/js/common/bcc-bootstrap-table.js" />