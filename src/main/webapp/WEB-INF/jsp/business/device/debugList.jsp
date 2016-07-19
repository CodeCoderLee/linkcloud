<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<div class="container" id="myContainer">
    <div class="block-header">
        <h2>设备调试</h2>
        <form id="spaceForm" name="spaceForm" >
            <input type="hidden" id="openId" name="openId" value="${openId}"/>
            <input type="hidden" id="resId" name="resId" value="${resId}"/>
            <input type="hidden" id="msgPageSize" name="msgPageSize" value="${messenger.msgPageSize}"/>
            <input type="hidden" id="msgPageNumber" name="msgPageNumber" value="${messenger.msgPageNumber}"/>
            <input type="hidden" id="msgSerialNumber" name="msgSerialNumber" value="${messenger.msgSerialNumber}"/>
            <input type="hidden" id="msgUrl" name="msgUrl" value="${messenger.msgUrl}"/>
            <input type="hidden" id="type" name="type" value="debug"/>
            <input type="hidden" id="msgEntrance" name="msgEntrance" value="debug"/>
        </form>

    </div>
    <div class="card">
        <%--<div class="card-header">--%>
        <%--<div class="m-b-md" style="margin-bottom: 18px">--%>
        <%--<form class="form-inline" role="form" id="searchForm"--%>
        <%--name="searchForm">--%>
        <%--<div class="form-group">--%>
        <%--<label class="control-label"> <span--%>
        <%--class="h4 font-thin v-middle">序列号:</span></label>--%>
        <%--<input class="input-medium ui-autocomplete-input" id="searchParam" name="serialNumber"/>--%>
        <%--</div>--%>
        <%--<a class="btn btn-default" id="searchBtn">查询</a>--%>
        <%--</form>--%>
        <%--</div>--%>
        <%--</div>--%>
    </div>
    <div class="row" id="dataDiv">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body card-padding">
                    <div class="pmbb-view">
                        <dl class="dl-horizontal">
                            <dt>序列号</dt>
                            <dd>AAAAAAAAAAAAAAA</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>私钥</dt>
                            <dd>XXXXXXXXXXXXXXX</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>注册时间</dt>
                            <dd>2016-05-29 00:00:00</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>注册人</dt>
                            <dd>XXXXXX</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>是否上线</dt>
                            <dd>是</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt><a href="">演示</a></dt>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body" id="pagination">
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"></script>
<script charset="utf-8" src="${ctx}/js/bootstrap-paginator.min.js"></script>
<script charset="utf-8" src="${ctx}/js/common/bcc-bootstrap-table.js"></script>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"></script>
<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        var pageNum = 1;
        var pageSize = 6;
        $('#searchParam').val($('#msgSerialNumber').val());
        if ($('#msgPageNumber').val() != null && $('#msgPageNumber').val() != "") {
            pageNum = $('#msgPageNumber').val();
        }
        if ($('#msgPageSize').val() != null && $('#msgPageSize').val() != "") {
            pageSize = $('#msgPageSize').val();
        }
        loadDevice(pageNum, pageSize);
    });
    function loadDevice(pageNum, pageSize) {
        var serialNumber = $('#searchParam').val();
        $.ajax({
            method: 'get',
            url: 'device/searchByPage.shtml',
            dataType: 'json',
            data: {status: 1, pageNum: pageNum, pageSize: pageSize},
            success: function (data) {
                /*刷新数据*/
                refreshData(data.rows);
                console.log(data.pageNum);
                console.log(data.totalPages);
                /*分页*/
                if (data.totalPages > 0) {
                    var options = {
                        currentPage: data.pageNum,
                        totalPages: data.totalPages,
                        onPageChanged: function (e, oldPage, newPage) {
                            scrollTo(0, 0);
                            loadDevice(newPage, 6);
                        }
                    };
                    $('#pagination').bootstrapPaginator(options);
                }
            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }

    function refreshData(data) {
        $('#dataDiv').html("");
        $.each(data, function (i, item) {
            var html = "<div class=\"col-sm-4\">" +
                    "<div class=\"card\">" +
                    "<div class=\"card-body card-padding\">" +
                    "<div class=\"pmbb-view\">" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>序列号</dt>" +
                    "<dd>" + item.serialNumber + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>物流号</dt>" +
                    "<dd>" + item.trackNo + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>注册时间</dt>" +
                    "<dd>" + dateTimeFormatter(item.registerTime) + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>注册人</dt>" +
                    "<dd>" + item.registerName + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>是否在线</dt>";
            if (item.onOffLine) {
                html = html + "<dd>是</dd>";
            } else {
                html = html + "<dd>否</dd>";
            }
            html = html +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt><a class=\"btn btn-info\" href=\"javascript:getHeartBeatInfo('" + item.id + "','" + item.serialNumber + "')\">设备详情</a></dt>" +
                    "<dd><a class=\"btn btn-info\" href=\"javascript:goSpace('" + item.serialNumber + "')\">设备空间</a></dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt><a class=\"btn btn-info\" href=\"javascript:goDebugHeartBeatInfo('" + item.serialNumber + "')\">调试页</a></dt>" +
                    "<dd><a class=\"btn btn-info\" href=\"javascript:getDeviceUpdate('" + item.serialNumber + "')\">设备升级</a></dd>" +
                    "</dl>";
            if (item.onOffLine) {
                html = html +
                        "<dl class=\"dl-horizontal\">" +
                        "<dt><a class='btn btn-info' href=\"javascript:void(0)\" onclick=\"shock('" + item.serialNumber + "')\">连通性测试</a></dt>";
                html = html + "<dd><a class='btn btn-info' href=\"javascript:void(0)\" onclick=\"scanFrequency('" + item.serialNumber + "')\">扫频</a></dd>";
            } else {
                html = html +
                        "<dl class=\"dl-horizontal\">" +
                        "<dt><a class='btn btn-info' disabled=\"disabled\" href=\"javascript:void(0)\" onclick=\"shock('" + item.serialNumber + "')\">连通性测试</a></dt>";
                html = html + "<dd><a class='btn btn-info' disabled=\"disabled\" href=\"javascript:void(0)\" onclick=\"scanFrequency('" + item.serialNumber + "')\">扫频</a></dd>";
            }
            html = html + "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt><a class=\"btn btn-info\" href=\"javascript:setAvailable('" + item.id + "','" + item.serialNumber + "')\">设备入库</a></dt>" +
                    "<dd></dd>" +
                    "</dl>" +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
            $('#dataDiv').append(html);
        })
    }
</script>
<script charset="utf-8" src="${ctx}/js/business/device/commonOperate.js"></script>
