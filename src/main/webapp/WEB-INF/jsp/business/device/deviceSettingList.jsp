<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<div class="container">
    <div class="block-header">
        <h2>设备配置</h2>
        <input type="hidden" id="openId" name="openId" value="${openId}"/>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <form class="form-inline" role="form" id="searchForm"
                      name="searchForm">
                    <div class="form-group">
                        <label class="control-label"> <span
                                class="h4 font-thin v-middle">序列号:</span></label>
                        <input class="input-medium ui-autocomplete-input" id="searchParam" name="serialNumber"/>
                    </div>
                    <a class="btn btn-default" id="search">查询</a>
                </form>
            </div>
        </div>
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
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script charset="utf-8" src="${ctx}/js/bootstrap-paginator.min.js"/>
<script charset="utf-8" src="${ctx}/js/common/bcc-bootstrap-table.js"/>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        loadDevice(1, 6);
    });
    function loadDevice(pageNum, pageSize) {
        $.ajax({
            method: 'get',
            url: 'device/searchDeviceSettingList.shtml',
            dataType: 'json',
            data: {pageNum: pageNum, pageSize: pageSize},
            success: function (data) {
                /*刷新数据*/
                refreshData(data.rows);
                console.log(data.pageNum);
                console.log(data.totalPages);
                /*分页*/
                if(data.totalPages>0){
                    var options = {
                        currentPage: data.pageNum,
                        totalPages: data.totalPages,
                        onPageChanged: function (e, oldPage, newPage) {
                            scrollTo(0,0);
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
                    "<dt>私钥</dt>" +
                    "<dd>" + item.privateKey + "</dd>" +
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
            }else {
                html = html + "<dd>否</dd>";
            }
            html = html +
            "</dl>" +
            "<dl class=\"dl-horizontal\">" +
            "<dt><a class=\"btn btn-info\" href=\"javascript:setAvailable('" + item.id + "','" + item.serialNumber + "')\">设备入库</a></dt>" +
            "<dd><a class=\"btn btn-info\" href=\"javascript:goSpace('" + item.id + "','" + item.serialNumber + "')>设备空间</a></dd>" +
            "<dd><a class=\"btn btn-info\" href=\"javascript:getHeartBeatInfo('" + item.id + "','" + item.serialNumber + "')\">设备详情</a></dd>" +
//                    /space/device/" + item.serialNumber + ".shtml?type=debug&openId=" + $('#openId').val() + "\"

            "</dl>";
            html = html +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt><a class='btn btn-info' href=\"javascript:void(0)\" onclick=\"shock('" + item.serialNumber + "')\">连通性测试</a></dt>";
            if (item.onOffLine) {
                html = html + "<dd><a class='btn btn-info' href=\"javascript:void(0)\" onclick=\"scanFrequency('"+item.serialNumber+"')\">扫频</a></dd>";
            }else {
                html = html + "<dd><a class='btn btn-info' disabled=\"disabled\" href=\"javascript:void(0)\" onclick=\"scanFrequency('"+item.serialNumber+"')\">扫频</a><label style='color: red;'>离线无法扫频</label></dd>";
            }

            html = html + "</dl>" +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
            $('#dataDiv').append(html);
        })
    }

    function scanFrequency(serialNumber) {
        $('#content').load("device/scanFrequencyUI.shtml?serialNumber="+serialNumber+"&id=${resId}");
    }

    function shock(serialNumber){
        $.ajax({
            method: 'get',
            url: 'device/shock.shtml',
            dataType: 'json',
            data: {serialNumber: serialNumber},
            success: function (data) {
                console.log(data);
                alert("指令已成功下发。");
            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }
</script>
