<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container listPage">
    <div class="block-header">
        <h2>企业(归属)管理</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="form-group">
                    <label class=" col-sm-1 control-label">选择区域</label>
                    <div class="col-sm-11">
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
                    <label class=" col-sm-1 control-label">选择行业</label>
                    <div class="col-sm-11">
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
                    <label class="col-sm-1 control-label">企业名称</label>
                    <div class="col-sm-11">
                        <div class="fg-line">
                            <input class="input-medium ui-autocomplete-input" name="fullName" id="fullName"/>
                            <a class="btn btn-default" id="search">查询</a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="m-b-md" style="margin-bottom: 18px">
                <button type="button" class="btn btn-success" id="newBtn">
                    <i class="glyphicon glyphicon-edit"></i>新增
                </button>
                <button type="button" class="btn btn-info" id="modifyBtn">
                    <i class="glyphicon glyphicon-edit"></i>修改
                </button>
                <button id="refreshBtn" class="btn btn-default">
                    <i class="glyphicon glyphicon-refresh"></i>刷新
                </button>
            </div>
        </div>
        <div class="card-body table-responsive">
            <table id="bccTable"
                   data-toggle="table"
                   data-sort-name="createTime"
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
                   data-url="company/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            <%--data-height="300"--%>
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <th data-field="name" data-sortable="true">企业简称</th>
                    <th data-field="fullName">企业全称</th>
                    <th data-field="areaName" data-formatter="areaFormatter">所属区域</th>
                    <th data-field="industryName">所属行业</th>
                    <th data-field="createTime" data-sortable="true" data-formatter="dateTimeFormatter">创建时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<div class="container modifyPage hidden">
    <div class="block-header">
        <h2>添加企业信息</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/company/modify.shtml">
                        <input type="hidden" name="industryName" id="industryName"/>
                        <input type="hidden" name="areaName" id="areaName"/>
                        <input type="hidden" name="id" id="id"/>
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">企业名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入企业名称" name="name" id="modifyName">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">企业全称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入企业全称" name="fullName" id="modifyFullName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">选择区域</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="modifyProvince" name="province"
                                                            onchange="showCity1(this.options[this.options.selectedIndex].value,1)">
                                                        <option value="">省</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="modifyCity" name="city"
                                                            onchange="showCity1(this.options[this.options.selectedIndex].value,2)">
                                                        <option value="">市</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="modifyCounty" name="areaId">
                                                        <option value="">县</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">选择行业</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control company-control" id="modifyIndustryCode"
                                                            name="industryCode"
                                                    >
                                                        <option value="">请选择</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">备注</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" placeholder="请输入备注"
                                               name="remark" id="remark">
                                    </div>
                                </div>
                                <div class="footer text-right bg-light lter">
                                    <button id="subBtn" class="btn btn-success btn-s-xs">修改</button>
                                    <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
                                </div>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"></script>
<script type="text/javascript" src="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.js"></script>
<script type="text/javascript"
        src="${ctx}/vendors/bower_components/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<script charset="utf-8" src="${ctx}/js/common/industry.js"></script>
<script charset="utf-8" src="${ctx}/js/business/company/modify.js"></script>
<script type="text/javascript">
    var row;
    $(document).ready(function () {
        loadProvince();
        var ids = [];

        /*查询按钮点击事件绑定,向后台传参数,请求数据,刷新table*/
        $('#search').click(function () {
            refreshTable();

        });

        $('#county').change(function () {
            refreshTable();
        });

        $('#industryCode').change(function () {
            refreshTable();
        });

        /*刷新按钮点击事件绑定,刷新table,不传参数*/
        $('#refreshBtn').click(function () {
            $('#bccTable').bootstrapTable('refresh');
        });


        /*新增按钮点击事件绑定,打开新增窗口*/
        $('#newBtn').click(function () {
            console.log("content==", $("#content"));
            $("#content").load("company/addUI.shtml");

        });

        /*修改按钮点击事件绑定,打开修改窗口*/
        $('#modifyBtn').click(function () {
            var rows = $('#bccTable').bootstrapTable('getSelections');
            if (rows.length == 0) {
                alert("请选中一条记录");
                return;
            }
            if (rows.length > 1) {
                alert("最多选中一条记录");
                return;
            }
            row = rows[0];
            loadAreas(row['provinceId'],row['cityId'],row['areaId']);
            loadIndustry(row['industryCode']);
            $('#modifyName').val(row['name']);
            $('#modifyFullName').val(row['fullName']);
            $('#remark').val(row['remark']);
            $('#id').val(row['id']);
            $(".listPage").addClass("hidden");
            $(".modifyPage").removeClass("hidden");

        });
    });
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

    function areaFormatter(value, row) {
        return row['province'] + "." + row['city'] + "." + row['areaName'];
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
            } else {
                refreshTable();
            }
        }
        if (type == 2) {
            if ($('#city').val() == "") {
                resetCountySelect();
                return;
            } else {
                refreshTable();
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


            },
            error: function () {
                //请求出错处理
            }
        });
    }

    function refreshTable() {
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
        if ($('#fullName').val() != "") {
            paras.push("fullName=" + $("#fullName").val());
        }
        var url = rootPath + "/company/search.shtml";
        if (paras.length > 0) {
            url = url + "?" + paras.join("&");
        }
        $('#bccTable').bootstrapTable('refresh', {
            url: url
        });
    }

    //重置
    function resetProvinceSelect(url) {
        $('#province').val("");
        $('#city').val("");
        $('#city').attr("disabled", true);
        resetCountySelect();
    }

    function resetCountySelect(url) {
        $('#county').val("");
        $('#county').attr("disabled", true);
        refreshTable();
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