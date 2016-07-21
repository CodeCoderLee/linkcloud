<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>图文广告素材管理</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <%--<form class="form-inline" role="form" id="searchForm"--%>
                <%--name="searchForm">--%>
                <div class="form-group">
                    <label class="control-label"> <span
                            class="h4 font-thin v-middle">来源:</span></label>
                    <input class="input-medium ui-autocomplete-input" id="searchParam" name="source"/>
                    <%--<a class="btn myButton btn-default" id="search">查询</a>--%>
                    <button class="btn myButton  btn-default" id="search">查询</button>
                </div>

                <%--</form>--%>
            </div>
            <button type="button" class="btn myButton  btn-success" id="newBtn">
                <i class="glyphicon glyphicon-plus"></i>新增
            </button>
            <button id="refreshBtn" class="btn myButton  btn-default">
                <i class="glyphicon glyphicon-refresh"></i>刷新
            </button>
        </div>
        <div class="card-body table-responsive">
            <table id="bccTable"
                   data-toggle="table"
                   data-sort-name="id"
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
                   data-url="advertisement/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            <%--data-height="300"--%>
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <th data-field="fileName" >文件名</th>
                    <th data-field="companyName" >广告主</th>
                    <th data-field="type" data-formatter="typeFormatter">广告类型</th>
                    <th data-field="industryName">所属行业</th>
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
    var addUrl = "advertisement/addUI.shtml";
    var modifyUrl = "advertisement/modifyUI.shtml?id=";
    var deleteUrl = "advertisement/delete.shtml";
    function typeFormatter(value){
        if(!!value){
            if (value == 1) {
                return '自带广告';
            }else if (value == 2) {
                return '第三方企业广告';
            }else {
                return '自定义广告';
            }
        }else{
            return '-';
        }

    }
</script>

<script type="text/javascript" src="${ctx}/js/common/bcc-bootstrap-table.js" />