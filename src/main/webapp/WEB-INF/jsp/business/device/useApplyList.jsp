<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="container">
    <div class="block-header">
        <h2>使用申请</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <form class="form-inline" role="form" id="searchForm"
                      name="searchForm">
                    <div class="form-group">
                        <label class="control-label"> <span
                                class="h4 font-thin v-middle">联系人:</span></label>
                        <input class="input-medium ui-autocomplete-input" id="searchParam" name="contactName"/>
                    </div>
                    <a class="btn btn-default" id="search">查询</a>
                </form>
            </div>
            <button type="button" class="btn btn-success" id="newBtn">
                <i class="glyphicon glyphicon-edit"></i>申请
            </button>
        </div>
    </div>
    <div class="row" id="dataDiv">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body card-padding">
                    <div class="pmbb-view">
                        <dl class="dl-horizontal">
                            <dt>区域</dt>
                            <dd>AAAAAAAAAAAAAAA</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>行业</dt>
                            <dd>XXXXXXXXXXXXXXX</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>企业</dt>
                            <dd>2016-05-29 00:00:00</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>联系人</dt>
                            <dd>XXXXXX</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>联系电话</dt>
                            <dd>是</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>申请时间</dt>
                            <dd>2016-05-31 23:59:59</dd>
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
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        loadUseApply(1, 6);

        /*新增按钮点击事件绑定,打开新增窗口*/
        $('#newBtn').click(function () {
            console.log("content==", $("#content"));
            $("#content").load("deviceUseApply/addUI.shtml");

        });
    });
    function loadUseApply(pageNum, pageSize) {
        $.ajax({
            method: 'get',
            url: 'deviceUseApply/search.shtml',
            dataType: 'json',
            data: {pageNum: pageNum, pageSize: pageSize},
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
                    }
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
                    "<dt>区域</dt>" +
                    "<dd>" + item.serialNumber + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>行业</dt>" +
                    "<dd>" + item.privateKey + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>企业</dt>" +
                    "<dd>" + dateTimeFormatter(item.registerTime) + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>联系人</dt>" +
                    "<dd>" + item.registerName + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>联系电话</dt>" +
                    "<dd>是</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>申请时间</dt>" +
                    "<dd>2015-05-31 23:59:59</dd>" +
                    "</dl>" +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
            $('#dataDiv').append(html);
        })
    }

</script>
