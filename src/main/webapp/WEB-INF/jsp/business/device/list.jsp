<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container listPage">
    <div class="block-header">
        <h2>设备注册</h2>
        <input type="hidden" value="${sessionScope.isLock}" id="isLock"/>
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
                    <label class=" col-sm-2 control-label">选择状态</label>
                    <div class="col-sm-10">
                        <div class="col-sm-3">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control company-control" style="height:25px" id="status"
                                            name="status">
                                        <option value="">请选择</option>
                                        <option value="1">调试状态</option>
                                        <option value="2">正式使用</option>
                                        <option value="3">演示状态</option>
                                        <option value="4">入库状态</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="form-group">
                    <label class="col-sm-2 control-label">序列号/物流号</label>
                    <div class="col-sm-10">
                        <div class="fg-line">
                            <input class="input-medium ui-autocomplete-input" id="searchSerialNumber"/>
                            <a class="btn myButton  btn-default" id="searchBtn">查询</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="m-b-md" style="margin-bottom: 18px">
                <button type="button" class="btn myButton  btn-success" id="newBtn">
                    <i class="glyphicon glyphicon-edit">注册</i>
                </button>
                <button type="button" class="btn myButton  btn-info" id="deviceModifyBtn">
                    <i class="glyphicon glyphicon-edit">修改</i>
                </button>
                <button type="button" class="btn myButton  btn-primary" id="lockBtn">
                    <i class="glyphicon glyphicon-edit">锁定</i>
                </button>
                <%--<button type="button" class="btn myButton  btn-danger" id="deleteBtn">--%>
                <%--<i class="glyphicon glyphicon-minus"></i>删除--%>
                <%--</button>--%>
                <button id="refreshBtn" class="btn myButton  btn-default">
                    <i class="glyphicon glyphicon-refresh"></i>刷新
                </button>
            </div>


        </div>
        <div class="card-body table-responsive">
            <table id="bccTable"
                   data-toggle="table"
                   data-sort-name="id"
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
                   data-url="device/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <th data-field="serialNumber">序列号</th>
                    <th data-field="trackNo">物流号</th>
                    <th data-field="areaName" data-formatter="areaFormatter">区域</th>
                    <th data-field="status" data-formatter="statusFormatter">设备状态</th>
                    <th data-field="onOffLine" data-formatter="onOffLineFormatter">在线状态</th>
                    <th data-field="version1" data-formatter="versionFormatter">Version_s/Version_t</th>
                    <th data-field="registerTime" data-formatter="dateTimeFormatter">注册时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<div class="container modifyPage hidden">
    <div class="block-header">
        <h2>设备修改</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/device/modify.shtml">
                        <input type="hidden" name="id" value="${device.id}"/>
                        <input type="hidden" id="provinceValue" value="${device.province}"/>
                        <input type="hidden" id="cityValue" value="${device.city}"/>
                        <input type="hidden" id="areaId" value="${device.areaId}"/>
                        <input type="hidden" name="serialNumber" value="${device.serialNumber}"/>
                        <input type="hidden" name="exStatus" value="${device.exStatus}"/>
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">序列号</label>
                                    <div class="col-sm-9">
                                        <label class=" col-sm-3 control-label modifySerialNumber">${device.serialNumber}</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">物流号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="trackNo" id="trackNo">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">设备状态</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control .modifyStatus" id="modifyStatus" name="status">
                                                        <option value="1">调试状态</option>
                                                        <option value="4">入库状态</option>
                                                        <option value="2">正式使用</option>
                                                        <option value="3">演示状态</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">前状态</label>
                                    <div class="col-sm-9">
                                        <label class=" col-sm-3 control-label .exStatus">
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">设备区域</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="modifyProvince"
                                                            onchange="showModifyCity(this.options[this.options.selectedIndex].value,1)">
                                                        <option value="">省</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="modifyCity"
                                                            onchange="showModifyCity(this.options[this.options.selectedIndex].value,2)">
                                                        <option value="">市</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="modifyCounty" name="areaId"
                                                    >
                                                        <option value="">县</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn myButton  btn-success btn-s-xs">修改</button>
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
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.js"/>
<script type="text/javascript"
        src="${ctx}/vendors/bower_components/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript">
    var addUrl = "device/addUI.shtml";
    var modifyUrl = "device/modifyUI.shtml?id=";
    var deleteUrl = "device/delete.shtml";
    var isLock = $('#isLock').val();
    var row;
    var first = true;
    /*锁定按钮点击事件绑定*/
    $(document).ready(function () {

        loadProvince();
        if (Number(isLock)) {
            $('#lockBtn > i').text("解除锁定");
        }

        $('#searchBtn').click(function () {
            refreshTable();
        });

        $('#county').change(function () {
            refreshTable();
        });

        $('#status').change(function () {
            refreshTable();
        });

        $('#closeBtn').click(function () {
            $(".listPage").removeClass("hidden");
            $(".modifyPage").addClass("hidden");
        });

        $('#form').validate({
            submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
                $(form).ajaxSubmit({
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        notify('success', '     设备修改成功      ');
                        $(".listPage").removeClass("hidden");
                        $(".modifyPage").addClass("hidden");
                        $('#bccTable').bootstrapTable("refresh");
                        return false;
                    },
                    error: function (XMLResponse) {
                        alert(XMLResponse.responseText);
                    }
                });
            },
            rules: {
                "serialNumber": {
                    required: true,
                }
            },
            messages: {
                "serialNumber": {
                    required: "请输入序列号"
                }
            },
            errorPlacement: function (error, element) {// 自定义提示错误位置
                $(".alert-danger").removeClass("hidden");
                $(".alert-danger").html(error.html());
            },
            success: function (label) {// 验证通过后
                $(".alert-danger").addClass("hidden");
            }
        });

        /*设备列表修改按钮点击事件绑定,打开修改窗口*/
        $('#deviceModifyBtn').click(function () {
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
            $('input[type="hidden"][name="id"]').val(row['id']);
            $('#provinceValue').val(row['province']);
            $('#cityValue').val(row['city']);
            $('input[type="hidden"][name="areaId"]').val(row['areaId']);
            $('input[type="hidden"][name="serialNumber"]').val(row['serialNumber']);
            $('input[type="hidden"][name="exStatus"]').val(row['exStatus']);
            $('.modifySerialNumber').text(row['serialNumber']);
            $('#trackNo').val(row['trackNo']);
            if (row['status']==1) {
                $('.modifyStatus').find('option[value="1"]').attr("selected", true);
            }else if(row['status']==2){
                $('.modifyStatus').find('option[value="2"]').attr("selected", true);
            }else if(row['status']==3){
                $('.modifyStatus').find('option[value="3"]').attr("selected", true);
            }else{
                $('.modifyStatus').find('option[value="4"]').attr("selected", true);
            }
            if (row['exStatus']==1) {
                $('.exStatus').text("调试状态");
            }else if(row['exStatus']==2){
                $('.exStatus').text("正式使用");
            }else if(row['exStatus']==3){
                $('.exStatus').text("演示状态");
            }else if(row['exStatus']==4){
                $('.exStatus').text("入库状态");
            }else{
                $('.exStatus').text("无");
            }
            loadModifyProvince();
            first = true;
            $(".modifyPage").removeClass("hidden");
            $(".listPage").addClass("hidden");
            $('#bccTable').bootstrapTable("uncheckAll");
        });

        $('#lockBtn').click(function () {
            var url;
            var rows = $('table').bootstrapTable('getSelections');
            var message;
            if (Number(isLock)) {
                url = "/device/unlockDevice.shtml";
                message = "解除锁定后,其他操作的设备列表中显示所有设备,确认解除锁定?"

            } else {
                if (rows.length == 0) {
                    alert("请选中一条记录");
                    return;
                }
                if (rows.length > 1) {
                    alert("最多选中一条记录");
                    return;
                }
                url = "/device/lockDevice.shtml?serialNumber=" + rows[0]['serialNumber'];
                message = "锁定后,其他操作的设备列表中,只显示锁定的设备,确认锁定?";
            }
            if (window.confirm(message)) {
                $.ajax({
                    url: rootPath + url,
                    type: "get",
                    dataType: 'json',
                    success: function (data) {
                        if (Number(isLock)) {
                            alert("解除锁定成功");
                            $('#lockBtn > i').text("锁定");
                            isLock = 0;
                        } else {
                            isLock = 1;
                            alert("锁定成功");
                            $('#lockBtn > i').text("解除锁定");
                        }

                        $('#bccTable').bootstrapTable('refresh');
                    },
                    error: function () {
                        alert("锁定失败!");
                    }

                });
            }


        });
    });


    function areaFormatter(value, row) {
        return row['province'] + "." + row['city'] + "." + row['areaName'];
    }
    function versionFormatter(value, row) {
        var version1 = '-';
        var version2 = '-';
        if (row['version1']) {
            version1 = row['version1'];
        }
        if (row['version2']) {
            version2 = row['version2'];
        }
        return version1 + "/" + version2;

    }

    function onOffLineFormatter(value) {
        return value==1?"是":"否";

    }

    function statusFormatter(value) {
        if (value == 1) {
            return "调试状态";
        } else if (value == 2) {
            return "正式使用";
        } else if (value == 3) {
            return "演示状态";
        } else if (value == 4) {
            return "入库状态";
        } else {
            return "-";
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
                refreshTable();

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
        if ($('#status').val() != "") {
            paras.push("status=" + $('#status').val());
        }
        if ($('#searchSerialNumber').val() != "") {
            paras.push("serialNumber=" + $("#searchSerialNumber").val());
        }
        var url = rootPath + "/device/search.shtml";
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

    function loadModifyProvince(){
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
                    if (dataMap[i].id == row['provinceId']) {
                        $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyProvince");
                        if (first) {
                            showModifyCity(dataMap[i].id, 1);
                        }
                    } else {
                        $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyProvince");
                    }


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
    function showModifyCity(id, type) {
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
                    $('#modifyCity').html("<option value=\"\">市</option>");
                    for (var i = 0; i < dataMap.length; i++) {
                        if (dataMap[i].id == row['cityId'] && first) {
                            $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCity");
                            showModifyCity(dataMap[i].id, 2);
                        } else {
                            $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCity");
                        }
                    }
                    // $('#city').val("");
                    $('#modifyCity').attr("disabled", false);
                    $('#modifyCounty').val("");
                    $('#modifyCounty').attr("disabled", true);
                } else {
                    $('#modifyCounty').html("<option value=\"\">县</option>");
                    for (var i = 0; i < dataMap.length; i++) {
                        if(dataMap[i].id == row['areaId'] && first){
                            $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCounty");
                            first = false;
                        }else{
                            $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCounty");
                        }
                    }
                    $('#modifyCounty').attr("disabled", false);
                }


            },
            error: function () {
                //请求出错处理
            }
        });
    }

</script>
<script charset="UTF-8" src="${ctx}/js/common/bcc-bootstrap-table.js"></script>
<%--<script type="text/javascript" src="${ctx}/js/business/device/edit.js"/>--%>