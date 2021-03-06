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
        <h2>绑定视频广告</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 30px">
                <label class=" col-sm-2 control-label">行业/企业</label>
                <div class="col-sm-10">
                    <div class="col-sm-3">
                        <div class="fg-line">
                            <div class="select">
                                <select class="form-control" id="industryCode" name="industryCode"
                                        onchange="loadCompany()">
                                    <option value="">所属行业</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="fg-line">
                            <div class="select">
                                <select class="form-control" id="companyId" name="companyId"
                                        onchange="loadVideo(1,6)">
                                    <option value="">所属企业</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="fg-line">
                            <button id="subBtn" class="btn myButton  btn-success btn-s-xs">确定</button>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="fg-line">
                            <a id="closeBtn" class="btn myButton  btn-success btn-s-xs">返回</a>
                        </div>
                    </div>
                </div>
                <%--<div class="footer text-right bg-light lter">--%>
                <%--<button id="subBtn" class="btn myButton  btn-success btn-s-xs">确定</button>--%>
                <%--<a id="closeBtn" class="btn myButton  btn-success btn-s-xs">返回</a>--%>
                <%--</div>--%>

            </div>

        </div>
        <div class="card">
            <input type="hidden" name="serialNumbers" id="serialNumbers" value="${serialNumbers}"/>
            <div role="tabpanel">
                <ul class="tab-nav" role="tablist" id="tab">
                    <li class="active"><a href="#custom" aria-controls="custom" role="tab" data-toggle="tab">自定义广告</a>
                    </li>
                    <li><a href="#self" aria-controls="self" role="tab" data-toggle="tab">自带广告</a></li>
                    <li><a href="#company" aria-controls="company" role="tab" data-toggle="tab">第三方企业广告</a></li>
                </ul>
            </div>
        </div>

        <%--<div class="card-body card-padding">--%>

        <%--<div class="tab-content">--%>
        <%--<div role="tabpanel" class="tab-pane active" id="custom">--%>
        <%--<div class="row" id="dataDiv1">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div role="tabpanel" class="tab-pane" id="self">--%>
        <%--</div>--%>
        <%--<div role="tabpanel" class="tab-pane" id="company">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>

    </div>
    <div class="row" id="dataDiv">
    </div>
    <div class="card">
        <div class="card-body" id="pagination">
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
    var videoInfos = [];
    var videoIds = [];
    var type = 3;//广告类型,初始化自定义类型
    $(document).ready(function () {
        loadVideo(1, 6);
        /*确定按钮点击事件绑定,打开新增窗口*/
        $('#subBtn').click(function () {

            if (videoIds.length == 0) {
                if (window.confirm('未选中任意一条广告,将取消所有视频广告的绑定,是否确认?')) {
                    var serialNumbers = $('#serialNumbers').val();
                    $.ajax({
                        method: 'post',
                        url: 'videoPublish/unBindVideoPublish.shtml',
                        data: {serialNumbers: serialNumbers},
                        success: function (data) {
                            notify('success', '     设备取消绑定视频广告成功      ');
                            $("#content").load(rootPath + "/videoPublish/list.shtml");
                        },
                        error: function (XMLHttpRequest) {
                            console.log(XMLHttpRequest);
                        }
                    });
                }
            } else {
                var serialNumbers = $('#serialNumbers').val();
                $.ajax({
                    method: 'post',
                    url: 'videoPublish/updateVideoPublish.shtml',
                    data: {serialNumbers: serialNumbers, videoInfos: videoInfos.join(",")},
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

        $('#tab > li > a').click(function () {
//            videoIds = [];
//            videoInfos = [];
            var typeStr = $(this).attr("href");
            if (typeStr == '#self') {
                type = 1;
            } else if (typeStr == '#company') {
                type = 2;
            } else {
                type = 3;
            }
            loadVideo(1, 6);
        });

        /*加载行业*/
        $.ajax({
            url: rootPath + "/industry/getIndustryByParentCode.shtml",
            dataType: "json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $("<option value='" + item.fullCode + "'>" + item.fullName + "</option>").appendTo("#industryCode");
                })

            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    });

    /*加载企业*/
    function loadCompany() {
        /*加载行业*/
        var industryCode = $('#industryCode').val();
        $.ajax({
            url: rootPath + "/company/searchCompanyByIndustry.shtml?industryCode=" + industryCode,
            dataType: "json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $("<option value='" + item.id + "'>" + item.fullName + "</option>").appendTo("#companyId");
                })

            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }


    function loadVideo(pageNum, pageSize) {
        var companyId = $('#companyId').val();
        var industryCode = $('#industryCode').val();
        $.ajax({
            method: 'get',
            url: rootPath + '/video/searchVideoByPageNum.shtml',
            dataType: 'json',
            data: {
                type: type,
                companyId: companyId,
                industryCode: industryCode,
                pageNum: pageNum,
                pageSize: pageSize
            },
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
                            loadVideo(newPage, 6);
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
                    '<div class="pmbb-view pre-scrollable" style="min-height:300px;max-height:300px">' +
                    '<dl class="dl-horizontal">' +
                    '<dt><label class="checkbox checkbox-inline m-r-20">';
            if (videoIds.indexOf(item.id + "") >= 0) {
                html = html + '<input type="checkbox" checked="checked" name="videoInfo" value="' + item.id + '&' + item.fileName + '&' + item.filePath + '&' + item.url + '&' + type + '"/>';
            } else {
                html = html + '<input type="checkbox" name="videoInfo" value="' + item.id + '&' + item.fileName + '&' + item.filePath + '&' + item.url + '&' + type + '"/>';
            }
            html = html +
                    '<i class="input-helper"></i>' +
                    '</label></dt>' +
                    '<dd>' + item.fileName + '</dd>' +
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
            var videoId = this.value.split("&")[0];
            if (this.checked) {
                if (videoIds.length == 6) {
                    notify('success', '     一台设备最多发布6条视频广告      ');
                    this.checked = false;
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
