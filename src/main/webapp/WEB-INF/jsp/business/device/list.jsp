<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>设备注册</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <form class="form-inline" role="form" id="searchForm"
                      name="searchForm">
                    <input type="hidden" value="${sessionScope.isLock}" id="isLock"/>
                    <div class="form-group">
                        <label class="control-label"> <span
                                class="h4 font-thin v-middle">序列号:</span></label>
                        <input class="input-medium ui-autocomplete-input" id="searchParam" name="serialNumber"/>
                    </div>
                    <a class="btn btn-default" id="search">查询</a>
                </form>
            </div>
            <button type="button" class="btn btn-success" id="newBtn">
                <i class="glyphicon glyphicon-edit">注册</i>
            </button>
            <button type="button" class="btn btn-info" id="modifyBtn">
                <i class="glyphicon glyphicon-edit">修改</i>
            </button>
            <button type="button" class="btn btn-primary" id="lockBtn">
                <i class="glyphicon glyphicon-edit">锁定</i>
            </button>
            <%--<button type="button" class="btn btn-danger" id="deleteBtn">--%>
                <%--<i class="glyphicon glyphicon-minus"></i>删除--%>
            <%--</button>--%>
            <button id="refreshBtn" class="btn btn-default">
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
                   data-url="device/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <th data-field="serialNumber">序列号</th>
                    <th data-field="areaName" data-formatter="areaFormatter">区域</th>
                    <th data-field="status" data-formatter="statusFormatter">状态</th>
                    <th data-field="version1" data-formatter="versionFormatter">Version_s/Version_t</th>
                    <th data-field="registerTime" data-formatter="dateTimeFormatter" data-sortable="true">注册时间</th>
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
    var addUrl = "device/addUI.shtml";
    var modifyUrl = "device/modifyUI.shtml?id=";
    var deleteUrl = "device/delete.shtml";
    var isLock = $('#isLock').val();
    /*锁定按钮点击事件绑定*/
    $(document).ready(function () {
        if (Number(isLock)) {
            $('#lockBtn > i').text("解除锁定");
        }

        $('#lockBtn').click(function () {
            var url;
            var rows = $('table').bootstrapTable('getSelections');
            var message;
            if (Number(isLock)) {
                url = "/device/unlockDevice.shtml";
                message = "解除锁定后,其他操作的设备列表中显示所有设备,确认解除锁定?"

            }else {
                if (rows.length == 0) {
                    alert("请选中一条记录");
                    return;
                }
                if (rows.length > 1) {
                    alert("最多选中一条记录");
                    return;
                }
                url = "/device/lockDevice.shtml?serialNumber="+rows[0]['serialNumber'];
                message = "锁定后,其他操作的设备列表中,只显示锁定的设备,确认锁定?";
            }
            if (window.confirm(message)) {
                $.ajax({
                    url: rootPath + url,
                    type: "get",
                    dataType:'json',
                    success: function (data) {
                        if (Number(isLock)) {
                            alert("解除锁定成功");
                            $('#lockBtn > i').text("锁定");
                            isLock = 0;
                        }else{
                            isLock = 1;
                            alert("锁定成功");
                            $('#lockBtn > i').text("解除锁定");
                        }

                        $('#bccTable').bootstrapTable('refresh');
                    },
                    error: function () {
                        alert("锁定失败!");
                    }

                });
            }


        });
    });


    function areaFormatter(value, row) {
        return row['province'] + "." + row['city'] + "." + row['areaName'];
    }
    function versionFormatter(value, row) {
        var version1 = '-';
        var version2 = '-';
        if (row['version1']) {
            version1 = row['version1'];
        }
        if (row['version2']) {
            version2 = row['version2'];
        }
        return version1 + "/" + version2;

    }

    function statusFormatter(value) {
        if (value == 1) {
            return "调试状态";
        }else if(value == 2){
            return "正式使用";
        }else if(value == 3 ){
            return "演示状态";
        }else if(value == 4) {
            return "入库状态";
        }else {
            return "-";
        }

    }
</script>
<script charset="UTF-8" src="${ctx}/js/common/bcc-bootstrap-table.js"></script>