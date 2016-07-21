<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/7/11
  Time: 下午6:42
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="container">
    <div class="block-header">
        <h2>设备图文广告发布</h2>
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
                    <a class="btn btn-success waves-effect" id="searchBtn">查询</a>
                </form>
            </div>
            <button type="button" class="btn btn-success" id="newBtn">
                <i class="glyphicon glyphicon-edit"></i>绑定广告
            </button>
        </div>
    </div>
    <div class="row" id="dataDiv">
        <div class="col-sm-4 hidden">
            <div class="card">
                <div class="card-body card-padding">
                    <div class="pmbb-view">
                        <dl class="dl-horizontal">
                            <dt>序列号
                                <label class="checkbox checkbox-inline m-r-20">
                                    <input type="checkbox" name="serialNumber" value="option1">
                                    <i class="input-helper"></i>
                                </label>
                            </dt>
                            <dd>AAAAAAAAAAAAAAA</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>自带广告</dt>
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
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript" charset="utf-8">
    var serialNumbers = [];
    $(document).ready(function () {
        loadDevice(1, 6);

        $('#searchBtn').click(function () {
            loadDevice(1, 6);
        });

        /*新增按钮点击事件绑定,打开新增窗口*/
        $('#newBtn').click(function () {
            if (serialNumbers.length == 0) {
                notify('success', '     请至少选择一个设备      ');
            } else {
                $("#content").load("advertisementPublish/addUI.shtml?serialNumbers=" + serialNumbers.join(","));
            }
        });
    });
    function loadDevice(pageNum, pageSize) {
        var serialNumber = $('#searchParam').val();
        $.ajax({
            method: 'get',
            url: 'advertisementPublish/search.shtml',
            dataType: 'json',
            data: {pageNum: pageNum, pageSize: pageSize, serialNumber: serialNumber},
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
            var selfAdInfo = eval('(' + item.selfAdInfo + ')');
            var companyAdInfo = eval('(' + item.companyAdInfo + ')');
            var customAdInfo = eval('(' + item.customAdInfo + ')');
//            var versionJson = item.updateInfo;
            var html = "<div class=\"col-sm-4\">" +
                    "<div class=\"card\">" +
                    "<div class=\"card-body card-padding\">" +
                    "<div class=\"pmbb-view\">" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>序列号<label class=\"checkbox checkbox-inline m-r-20\">" +
                    "<input type=\"checkbox\" name=\"serialNumber\" value=\"" + item.serialNumber + "\">" +
                    "<i class=\"input-helper\"></i>" +
                    "</label></dt>" +
                    "<dd>" + item.serialNumber + "</dd>" +
                    "</dl>" +
                    "<dl>" +
                    "<dt>更新时间</dt>" +
                    "<dd>" + dateTimeFormatter(item.updateTime) + "</dd>" +
                    "</dl>";
            html = html +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>自带广告</dt>" +
                    "<dd></dd>" +
                    "</dl>";
            html = html + adInfoHtml(selfAdInfo);
            html = html +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>第三方企业广告</dt>" +
                    "<dd></dd>" +
                    "</dl>";
            html = html + adInfoHtml(companyAdInfo);
            html = html +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>自定义广告</dt>" +
                    "<dd></dd>" +
                    "</dl>";
            html = html + adInfoHtml(customAdInfo);

            html = html + "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
            $('#dataDiv').append(html);
        });

        $('input[type="checkbox"]').click(function () {
            if (this.checked) {
                serialNumbers.push(this.value);
            } else {
                serialNumbers.splice(serialNumbers.indexOf(this.value), 1);
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

//        return date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate() + " " + date.getHours()
//                + ":" + date.getMinutes() + ":" + date.getSeconds();
    }

    function adInfoHtml(adInfo) {
        var html = "";
        if (adInfo) {
//            html = html +
//                    "<dl class=\"dl-horizontal\">" +
//                    "<dt>更新时间</dt>" +
//                    "<dd>" +dateTimeFormatter(adInfo.updateTime)+"</dd>" +
//                    "</dl>";
            $.each(adInfo.ads, function (index, item) {
                html = html + "<dl class=\"dl-horizontal\">" +
                        "<dt>广告" + (index + 1) + "</dt>" +
                        "<dd>" + item.fileName + "</dd>" +
                        "</dl>";
            });

        } else {
            html = html + "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>无更新记录</dt>" +
                    "<dd></dd>" +
                    "</dl>";

        }
        return html;
    }
</script>