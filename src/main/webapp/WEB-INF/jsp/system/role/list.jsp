<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>角色信息管理</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <form class="form-inline" role="form" id="searchForm"
                      name="searchForm">
                    <div class="form-group">
                        <label class="control-label"> <span
                                class="h4 font-thin v-middle">角色名:</span></label> <input
                            class="input-medium ui-autocomplete-input" id="searchParam"
                            name="name">
                    </div>
                    <a href="javascript:void(0)" class="btn myButton  btn-default" id="search">查询</a>
                </form>
            </div>

            <button type="button" class="btn myButton  btn-success" id="newBtn">
                <i class="glyphicon glyphicon-plus"></i>新增
            </button>
            <button type="button" class="btn myButton  btn-info" id="modifyBtn">
                <i class="glyphicon glyphicon-edit"></i>修改
            </button>
            <button type="button" class="btn myButton  btn-danger" id="deleteBtn">
                <i class="glyphicon glyphicon-minus"></i>删除
            </button>
            <button id="permissionBtn" class="btn myButton  btn-warning">
                <i class="glyphicon glyphicon-cog"></i>分配权限
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
                   data-page-size="10"
                   data-page-list="[10,25,50,100]"
                   data-side-pagination="server"
                   data-url="role/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <th data-field="name" data-sortable="true">角色名</th>
                    <th data-field="state" data-sortable="true">状态</th>
                    <th data-field="rolekey" data-sortable="true">roleKey</th>
                    <th data-field="description" data-sortable="true">描述</th>
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
        var addUrl = "role/addUI.shtml";
        var modifyUrl = "role/modifyUI.shtml?id=";
        var deleteUrl = "role/delete.shtml";
        var rootPath = "${ctx}";
    </script>

    <script type="text/javascript" src="${ctx}/js/common/bcc-bootstrap-table.js" />
    </div>