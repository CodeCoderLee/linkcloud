<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/6/27
  Time: 下午8:03
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<div class="container">
    <div class="block-header">
        <h2>设备升级</h2>
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
                    <a class="btn myButton  btn-default" id="search">查询</a>
                </form>
            </div>
            <button type="button" class="btn myButton  btn-success" id="newBtn">
                <i class="glyphicon glyphicon-edit"></i>升级
            </button>
        </div>
    </div>
    <div class="row" id="dataDiv">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body card-padding">
                    <div class="pmbb-view">
                        <dl class="dl-horizontal">
                            <%--<dt>序列号<input type="checkbox" name="serialNumber" value="AAAAAAA"></dt>--%>
                            <dt>
                                序列号
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
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script charset="utf-8" src="${ctx}/js/bootstrap-paginator.min.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript" charset="utf-8">
    var serialNumbers = [];
    $(document).ready(function () {
        loadDevice(1, 6);

        /*新增按钮点击事件绑定,打开新增窗口*/
        $('#newBtn').click(function () {
            if (serialNumbers.length == 0) {
                notify('success', '     请至少选择一个设备      ');
            }else{
                $("#content").load("deviceUpdate/addUI.shtml?serialNumbers="+serialNumbers.join(","));
            }


        });
    });
    function loadDevice(pageNum, pageSize) {
        $.ajax({
            method: 'get',
            url: 'deviceUpdate/search.shtml',
            dataType: 'json',
            data: {pageNum: pageNum, pageSize: pageSize},
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
            var versionJson = eval('(' + item.updateInfo + ')');
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
                    "</dl>";
            if (versionJson) {
                html = html + "<dl class=\"dl-horizontal\">" +
                        "</dl>" +
                        "<dl class=\"dl-horizontal\">" +
                        "<dt>更新时间</dt>" +
                        "<dd>" + dateTimeFormatter(versionJson.updateTime) + "</dd>" +
                        "</dl>";
                var versions = versionJson.versions;

                $.each(versionJson.versions, function (index, item) {
                    console.log('item===',item);
                    html = html + "<dl class=\"dl-horizontal\">" +
                            "<dt>"+item.modelName+"</dt>" +
                            "<dd>" + item.version + "</dd>" +
                            "</dl>";
                });

            } else {
                html = html + "</dl>" +
                        "<dl class=\"dl-horizontal\">" +
                        "<dt>无更新记录</dt>" +
                        "<dd></dd>" +
                        "</dl>";

            }

            html = html + "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
            $('#dataDiv').append(html);
        });

        $('input[type="checkbox"]').click(function(){
            if (this.checked) {
                serialNumbers.push(this.value);
            }else{
                serialNumbers.splice(serialNumbers.indexOf(this.value),1);
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
</script>
