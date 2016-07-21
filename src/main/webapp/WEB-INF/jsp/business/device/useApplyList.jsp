<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/assets/css/bootstrap-multiselect.css" type="text/css"/>
<div class="container listPage">
    <div class="block-header">
        <h2>使用申请</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="form-group">
                    <label class=" col-sm-2 control-label">选择区域</label>
                    <div class="col-sm-10">
                        <div class="col-sm-3">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control" style="height:25px" id="province"
                                            onchange="showCity(this.options[this.options.selectedIndex].value,1)">
                                        <option value="">省</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control" style="height:25px" id="city"
                                            disabled="true"
                                            onchange="showCity(this.options[this.options.selectedIndex].value,2)">
                                        <option value="">市</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control" style="height:25px" id="county" name="areaId"
                                            disabled="true">
                                        <option value="">县</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="form-group">
                    <label class=" col-sm-2 control-label">选择行业</label>
                    <div class="col-sm-10">
                        <div class="col-sm-3">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control company-control" style="height:25px" id="industryCode"
                                            name="industryCode"
                                    >
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="form-group">
                    <label class="col-sm-2 control-label">序列号</label>
                    <div class="col-sm-10">
                        <div class="fg-line">
                            <input class="input-medium ui-autocomplete-input"  id="searchSerialNumber"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="form-group">

                    <label class="col-sm-2 control-label">联系人/企业</label>
                    <div class="col-sm-10">
                        <div class="fg-line">
                            <input class="input-medium ui-autocomplete-input"  id="searchContactName"/>
                            <a class="btn myButton btn-default" id="search">查询</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-b-md" style="margin-bottom: 18px">
                <button type="button" class="btn myButton  btn-success" id="newBtn">
                    <i class="glyphicon glyphicon-edit"></i>申请
                </button>
            </div>
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
<div class="container modifyPage hidden">
    <div class="block-header">
        <h2>设备绑定出库</h2>

    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/deviceUseApply/stockOut.shtml">
                        <input type="hidden" class="form-control checkacc"
                                name="id" id="id">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">可选设备</label>
                                    <div class="col-sm-5">
                                        <div class="fg-line">
                                            <div class="select">
                                                <select class="form-control" id="example-multiple-selected"
                                                        multiple="multiple" name="deviceNumbers">
                                                    <%--<c:forEach var="device" items="${deviceList}" varStatus="de">--%>
                                                        <%--<option value="${device.serialNumber}">${device.serialNumber}</option>--%>
                                                    <%--</c:forEach>--%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn myButton  btn-success btn-s-xs" id="sub">出库</button>
                                <a id="closeBtn" class="btn myButton  btn-success btn-s-xs">返回</a>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script charset="utf-8" src="${ctx}/js/bootstrap-paginator.min.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript" src="${ctx}/assets/js/plugins/bootstrap-multiselect.js"></script>
<script charset="utf-8" src="${ctx}/js/common/industry.js"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        loadProvince();
        loadUseApply(1, 6);

        /*新增按钮点击事件绑定,打开新增窗口*/
        $('#newBtn').click(function () {
            console.log("content==", $("#content"));
            $("#content").load("deviceUseApply/addUI.shtml");

        });

        /*查询按钮点击事件绑定,向后台传参数,请求数据,刷新table*/
        $('#search').click(function () {
            loadUseApply(1,6);

        });

        $('#county').change(function () {
            loadUseApply(1,6);
        });

        $('#industryCode').change(function () {
            loadUseApply(1,6);
        });

        $('#example-multiple-selected').multiselect({
            enableFiltering: true,
            includeSelectAllOption: true,
            maxHeight: 400
        });

        $("#sub").click(function () {
            if(window.confirm('确认出库?')){
                $('#form').ajaxSubmit({
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        notify('success', '     设备出库成功     ');
                        $('#id').val("");
                        $(".modifyPage").addClass("hidden");
                        $(".listPage").removeClass("hidden");
                        var pages = $('#pagination').bootstrapPaginator("getPages");
                        loadUseApply(pages.current, 6);
//                        $("#content").load(rootPath + "/deviceUseApply/list.shtml");
                    },
                    error: function (XMLResponse) {
                        alert(XMLResponse.responseText);
                    }
                });
            }
            return false;
        });

        $('#closeBtn').click(function () {
            $('#id').val("");
            $(".modifyPage").addClass("hidden");
            $(".listPage").removeClass("hidden");
            var pages = $('#pagination').bootstrapPaginator("getPages");
            loadUseApply(pages.current, 6);
//            $("#content").load(rootPath + "/deviceUseApply/list.shtml");
        });
    });
    function loadUseApply(pageNum, pageSize) {
        var paras = [];
        if ($('#county').val() != "") {
            paras.push("areaId=" + $('#county').val());
        } else if ($('#city').val() != "") {
            paras.push("cityId=" + $('#city').val());
        } else if ($('#province').val() != "") {
            paras.push("provinceId=" + $('#province').val());
        }
        if ($('#industryCode').val() != "") {
            paras.push("industryCode=" + $('#industryCode').val());
        }
        if ($('#searchSerialNumber').val() != "") {
            paras.push("serialNumber=" + $("#searchSerialNumber").val());
        }
        if ($('#searchContactName').val() != "") {
            paras.push("contactName=" + $("#searchContactName").val());
        }
        var url = rootPath + "/deviceUseApply/search.shtml";
        if (paras.length > 0) {
            url = url + "?" + paras.join("&");
        }
        $.ajax({
            method: 'get',
            url: url,
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
                            loadUseApply(newPage, 6);
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
            console.log(item);
            var html = "<div class=\"col-sm-4\">" +
                    "<div class=\"card\">" +
                    "<div class=\"card-body card-padding\">" +
                    "<div class=\"pmbb-view\">" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>区域</dt>" +
                    "<dd>" + item.province + "." + item.city + "." + item.areaName + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>行业</dt>" +
                    "<dd>" + item.industryFullName + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>企业</dt>" +
                    "<dd>" + item.companyName + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>申请时间</dt>" +
                    "<dd>" + dateTimeFormatter(item.applyTime) + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>联系人</dt>" +
                    "<dd>" + item.contactName + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>联系电话</dt>" +
                    "<dd>" + item.contactPhone + "</dd>" +
                    "</dl>" +
                    "<dl class=\"dl-horizontal\">" +
                    "<dt>用途</dt>";
            if (item.status == 2) {
                html = html + "<dd>正式使用</dd></dl>";
            } else {
                html = html + "<dd>演示使用</dd></dl>";
            }

            if (item.isStockOut == 0) {
                html = html +

                        "<dl class=\"dl-horizontal\">" +
                        "<dt>出库时间</dt>" +
                        "<dd>未出库<a class='btn btn-info myButton  ' onclick='stockOutBtn(" + item.id + ")' >出库</a></dd>" +
                        "</dl>";
            } else {
                html = html +
                        "<dl class=\"dl-horizontal\">" +
                        "<dt>出库时间</dt>" +
                        "<dd>" + dateTimeFormatter(item.stockOutTime) + "</dd>" +
                        "</dl>"+
                        "<dl class=\"dl-horizontal\">" +
                        "<dt>绑定设备</dt>" +
                        "<dd>" + item.serialNumbers + "</dd>" +
                        "</dl>"
            }
//                    "<dd><button class='btn btn-info myButton  ' onclick='stockOutBtn("+item.id+")' >出库</button></dd>" +
//                    "<dd><button class='btn btn-info myButton  ' onclick='cancleBtn("+item.id+")' >取消出库</button></dd>" +
            html = html +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
            $('#dataDiv').append(html);
        })
    }

    function stockOutBtn(id) {
        $('#id').val(id);
        $(".listPage").addClass("hidden");
        $(".modifyPage").removeClass("hidden");
        $.ajax({
            method:'post',
            url:rootPath +'/device/searchAvailableDevice.shtml',
            dataType:'json',
            success:function(data){
                $('#example-multiple-selected').html("");
                console.clear();
                console.log(data);
                var options = [];

                $.each(data,function(index,item){
                    var obj = {};
                    obj.label = item.serialNumber;
                    obj.title = item.serialNumber;
                    obj.value = item.serialNumber;
                    options.push(obj);
                });
                $('#example-multiple-selected').multiselect('dataprovider', options);
            }

        });
//        $("#content").load("deviceUseApply/stockOutUI.shtml?id=" + id);

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

    function loadProvince() {
        $('#city').html("<option value=\"\">市</option>");
        $('#county').html("<option value=\"\">县</option>");
        $.ajax({
            //提交数据的类型 POST GET
            type: "POST",
            //提交的网址
            url: rootPath + "/area/getAreaProvince.shtml",
            //提交的数据
            //data:{Name:"sanmao",Password:"sanmaoword"},
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //在请求之前调用的函数
            //beforeSend:function(){$("#msg").html("logining");},
            //成功返回之后调用的函数
            success: function (dataMap) {
                dataMap = eval(dataMap.areaProvince);
                //alert("dataMap.length::" + dataMap.length);
                console.log("dataMap:::" + dataMap);
                for (var i = 0; i < dataMap.length; i++) {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#province");

                }
                //$("#msg").html(decodeURI(data));
            },
            //调用执行后调用的函数
            complete: function (XMLHttpRequest, textStatus) {
                //alert(XMLHttpRequest.responseText);
                //alert(textStatus);
                //HideLoading();
            },
            //调用出错执行的函数
            error: function () {
                //请求出错处理
            }
        });
    }

    /*type为1时,表示市,type为2时,表示县*/
    function showCity(id, type) {
        //刷新列表
        if (type == 1) {
            if ($('#province').val() == "") {
                resetProvinceSelect();
                return;
            }
        }
        if (type == 2) {
            if ($('#city').val() == "") {
                resetCountySelect();
                return;
            }
        }
        $.ajax({
            type: "POST",
            url: rootPath + "/area/getAreaCity.shtml",
            data: {id: id, type: type},
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
            success: function (dataMap) {
                dataMap = eval(dataMap.areaCity);
                //alert("dataMap.length::" + dataMap.length);
                console.log("dataMap:::" + dataMap);
                if (type === 1) {
                    $('#city').html("<option value=\"\">市</option>");
                    for (var i = 0; i < dataMap.length; i++) {
                        $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#city");

                    }
                    // $('#city').val("");
                    $('#city').attr("disabled", false);
                    $('#county').val("");
                    $('#county').attr("disabled", true);
                } else {
                    $('#county').html("<option value=\"\">县</option>");
                    for (var i = 0; i < dataMap.length; i++) {
                        $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#county");

                    }
                    $('#county').attr("disabled", false);
                }
                loadUseApply(1, 6);


            },
            error: function () {
                //请求出错处理
            }
        });
    }

    //重置
    function resetProvinceSelect() {
        $('#province').val("");
        $('#city').val("");
        $('#city').attr("disabled", true);
        resetCountySelect();
    }

    function resetCountySelect() {
        $('#county').val("");
        $('#county').attr("disabled", true);
        loadUseApply(1, 6);
    }


</script>
