<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/7/11
  Time: 下午9:00
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>
<link rel="stylesheet" href="${ctx}/vendors/viewer/dist/viewer.css" type="text/css">
<div class="container">
    <div class="block-header">
        <h2>绑定图文广告</h2>
    </div>
    <div>
        <img class="image hidden" src="" alt="">
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
                                        onchange="loadAd(1,6)">
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
<script charset="utf-8" src="${ctx}/vendors/viewer/dist/viewer.min.js"></script>
<script type="text/javascript">
    var rootPath = "${ctx}";
</script>
<script charset="utf-8">
    var adInfos = [];
    var adIds = [];
    var type = 3;//广告类型,初始化自定义类型
    $(document).ready(function () {

        var options = {
            navbar: false,
            toolbar: false,
            title: false,
            tooltop: false,
            movable: false,
            rotatable: false,
            scalable: false,
            transition: false,
            keyboard: false
        };
        $('.image').viewer(options);

        loadAd(1, 6);
        /*确定按钮点击事件绑定,打开新增窗口*/
        $('#subBtn').click(function () {

            if (adIds.length == 0) {
                if(window.confirm('未选中任意一条广告,将取消所有图文广告的绑定,是否确认?')){
                    var serialNumbers = $('#serialNumbers').val();
                    $.ajax({
                        method: 'post',
                        url: 'advertisementPublish/unBindAdPublish.shtml',
                        data: {serialNumbers: serialNumbers},
                        success: function (data) {
                            notify('success', '     设备取消绑定图文广告成功      ');
                            $("#content").load(rootPath + "/advertisementPublish/list.shtml");
                        },
                        error: function (XMLHttpRequest) {
                            console.log(XMLHttpRequest);
                        }
                    });
                }
//                notify('success', '     请选择图文广告      ');
            } else if (adIds.length > 6) {
                notify('success', '     最多绑定6条图文广告      ')
            } else {
                var serialNumbers = $('#serialNumbers').val();
                $.ajax({
                    method: 'post',
                    url: 'advertisementPublish/updateAdPublish.shtml',
                    data: {serialNumbers: serialNumbers, adInfos: adInfos.join(",")},
                    success: function (data) {
                        notify('success', '     设备发布图文广告成功      ');
                        $("#content").load(rootPath + "/advertisementPublish/list.shtml");
                    },
                    error: function (XMLHttpRequest) {
                        console.log(XMLHttpRequest);
                    }
                });
            }

        });

        /*返回按钮单击事件绑定*/
        $('#closeBtn').click(function () {
            $("#content").load(rootPath + "/advertisementPublish/list.shtml");
        });

        $('#tab > li > a').click(function () {
//            adIds = [];
//            adInfos = [];
            var typeStr = $(this).attr("href");
            if (typeStr == '#self') {
                type = 1;
            } else if (typeStr == '#company') {
                type = 2;
            } else {
                type = 3;
            }
            loadAd(1, 6);
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


    function loadAd(pageNum, pageSize) {
        var companyId = $('#companyId').val();
        var industryCode = $('#industryCode').val();
        $.ajax({
            method: 'get',
            url: rootPath + '/advertisement/searchAdByPageNum.shtml',
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
                            loadAd(newPage, 6);
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
        console.log("adIds====",adIds);
        $('#dataDiv').html("");
        $.each(data, function (i, item) {
            var html = '<div class="col-sm-4">' +
                    '<div class="card">' +
                    '<div class="card-body card-padding">' +
                    '<div class="pmbb-view">' +
                    '<dl class="dl-horizontal">' +
                    '<dt><label class="checkbox checkbox-inline m-r-20">';
            if (adIds.indexOf(item.id+"") >= 0) {
                html = html + '<input type="checkbox" checked="checked" name="AdInfo" value="' + item.id + '&' + item.fileName + '&' + item.filePath + '&' + item.url + '&'+ type+'"/>';
            }else{
                html = html + '<input type="checkbox" name="AdInfo" value="' + item.id + '&' + item.fileName + '&' + item.filePath + '&' + item.url + '&'+ type+'"/>';
            }

            html = html +
                    '<i class="input-helper"></i>' +
                    '</label></dt>' +
                    '<dd>' + '<a onclick="showViewer(\'' + item.url + '\')" >' + item.fileName + '</a>' + '</dd>' +
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
            var adId = this.value.split("&")[0];
            if (this.checked) {
                if (adIds.length == 6) {
                    notify('success', '     一台设备最多发布6条图文广告      ');
                    this.checked = false;
                } else {
                    adInfos.push(this.value);
                    adIds.push(adId);
                }
            } else {
                adIds.splice(adIds.indexOf(adId), 1);
                adInfos.splice(adInfos.indexOf(this.value), 1);
            }
        });
    }

    function showViewer(url) {
        $('.image').attr("src", rootPath + url);
        $('.image').viewer('show');
//        $('.image').viewer({
//            shown: function () {
//                $('.image').viewer('show');
//            }
//        });
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
