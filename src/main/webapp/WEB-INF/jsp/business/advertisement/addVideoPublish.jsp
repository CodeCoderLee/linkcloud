<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/7/1
  Time: 下午1:51
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>更新升级版本</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="form-group">
                    <label class=" col-sm-4 control-label">行业/企业</label>
                    <div class="col-sm-8">
                        <div class="col-sm-4">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control" id="industryId" name="industryId"
                                            onchange="loadCompany()">
                                        <option value="">所属行业</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control" id="companyId" name="companyId"
                                            disabled="true"
                                            onchange="loadVideo(1,6)">
                                        <option value="">所属企业</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer text-right bg-light lter">
                <button id="subBtn" class="btn btn-success btn-s-xs">确定</button>
                <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
            </div>
        </div>
        <div class="card-body card-padding">
            <input type="hidden" name="serialNumber" id="serialNumber" value="${serialNumber}"/>
            <input type="hidden" name="videoIds" id="videoIds" value="${videoIds}"/>
            <div class="row" id="dataDiv">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body card-padding">
                            <div class="pmbb-view">
                                <dl class="dl-horizontal">
                                    <%--<dt>序列号<input type="checkbox" name="serialNumber" value="AAAAAAA"></dt>--%>
                                    <dt>
                                        视频ID
                                        <label class="checkbox checkbox-inline m-r-20">
                                            <input type="checkbox" name="serialNumber" value="option1">
                                            <i class="input-helper"></i>
                                        </label>
                                    </dt>
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
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript">
    var rootPath = "${ctx}";
</script>
<script charset="utf-8">
    var videoIds = $('#videoIds').val().split(",");
    var videoInfos = [];
    $(document).ready(function () {
        loadVideo(1, 6);
        /*确定按钮点击事件绑定,打开新增窗口*/
        $('#subBtn').click(function () {

            if (videoInfos.length == 0) {
                notify('success', '     请选择视频广告      ');
            } else {
                var serialNumber = $('#serialNumber').val();
                $.ajax({
                    method: 'post',
                    url: 'deviceUpdate/updateDeviceVersion.shtml',
                    data: {serialNumber: serialNumber, videoInfos: videoInfos.join(",")},
                    success: function (data) {
                        notify('success', '     设备发布视频广告成功      ');
                        $("#content").load(rootPath + "/videoPublish/list.shtml");
                    },
                    error: function (XMLHttpRequest) {
                        console.log(XMLHttpRequest);
                    }
                });
            }

        });

        /*返回按钮单击事件绑定*/
        $('#closeBtn').click(function () {
            $("#content").load(rootPath + "/videoPublish/list.shtml");
        });

        /*加载行业*/
        $.ajax({
            url: rootPath + "/industry/getGrandParentIndustry.shtml",
            dataType: "json",
            success: function (data) {
                console.log("industryData====", data);
                $.each(data, function (index, item) {
                    $("<option value='" + item.id + "'>" + item.fullName + "</option>").appendTo("#industryId");
                })

            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    });

    /*加载企业*/
    function loadCompany(industryId){
        loadDevice(1,6);
        /*加载行业*/
        $.ajax({
            url: rootPath + "/company/searchCompanyByIndustry.shtml?industryId="+industryId,
            dataType: "json",
            success: function (data) {
                console.log("industryData====", data);
                $.each(data, function (index, item) {
                    $("<option value='" + item.id + "'>" + item.fullName + "</option>").appendTo("#industryId");
                })

            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }


    function loadVideo(pageNum, pageSize) {
        var companyId = $('#companyId').val();
        var industryId = $('#industryId').val();
        $.ajax({
            method: 'get',
            url: rootPath + '/video/search.shtml',
            dataType: 'json',
            data: {companyId: companyId, industryId: industryId, pageNum: pageNum, pageSize: pageSize},
            success: function (data) {
                /*刷新数据*/
                console.log("rows===", data.rows);
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
            var html = '<div class="col-sm-4">' +
                    '<div class="card">' +
                    '<div class="card-body card-padding">' +
                    '<div class="pmbb-view">' +
                    '<dl class="dl-horizontal">' +
                    '<dt><label class="checkbox checkbox-inline m-r-20">' +
                    '<input type="checkbox" name="videoInfo" value="' + item.id + '&' + item.fileName + '&' + item.filePath + '&' + item.url;
            if (videoIds.indexOf(item.id)) {
                html = html + 'checked:checked/>';
            } else {
                html = html + '/>';
            }

            html = html + '</label></dt>' +
                    '<dd>' + item.fileName + '</dd>' +
                    '</dl>' +
                    '<dl class="dl-horizontal">' +
                    '<dt>url</dt>' +
                    '<dd>' + item.url + '</dd>' +
                    '</dl>' +
                    '<dl class="dl-horizontal">' +
                    '<dt>所属行业</dt>' +
                    '<dd>' + item.industryName + '</dd>' +
                    '</dl>' +
                    '<dl class="dl-horizontal">' +
                    '<dt>所属企业</dt>' +
                    '<dd>' + item.companyName + '</dd>' +
                    '</dl>' +
                    '<dl class="dl-horizontal">' +
                    '<dt>添加时间</dt>' +
                    '<dd>' + dateTimeFormatter(item.addTime) + '</dd>' +
                    '</dl>';
            html = html + '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
            $('#dataDiv').append(html);
        });

        $('input[type="checkbox"]').click(function () {
            var videoId = this.valueOf.split("&")[0];
            if (this.checked) {
                if (videoIds.length == 6) {
                    notify('success', '     一台设备最多发布6条视频广告      ');
                } else {
                    videoInfos.push(this.value);
                    videoIds.push(videoId);
                }
            } else {
                videoIds.splice(videoIds.indexOf(videoId), 1);
                videoInfos.splice(videoInfos.indexOf(this.value), 1);
            }
        });
    }

    function dateTimeFormatter(value) {
        if (!!value) {
            var date = new Date();
            date.setTime(value);
            return date.toLocaleString();
        } else {
            return "--";
        }
    }
</script>
