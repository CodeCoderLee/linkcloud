<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>频点管理</h2>
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
                                    <select class="form-control" id="province"
                                            onchange="showCity(this.options[this.options.selectedIndex].value,1)">
                                        <option value="">省</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="fg-line">
                                <div class="select">
                                    <select class="form-control" id="city"
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
                                    <select class="form-control" id="county" name="areaId"
                                            disabled="true">
                                        <option value="">县</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-b-md">
                <%--<button type="button" class="btn btn-success" id="newBtn">--%>
                <%--<i class="glyphicon glyphicon-plus"></i>新增--%>
                <%--</button>--%>
                <button type="button" class="btn btn-info" id="modifyBtn">
                    <i class="glyphicon glyphicon-edit"></i>修改
                </button>
                <%--<button type="button" class="btn btn-danger" id="deleteBtn">--%>
                <%--<i class="glyphicon glyphicon-minus"></i>删除--%>
                <%--</button>--%>
                <button id="refreshBtn" class="btn btn-default">
                    <i class="glyphicon glyphicon-refresh"></i>刷新
                </button>
            </div>

        </div>
        <div class="card-body table-responsive">
            <table id="bccTable"
                   data-toggle="table"
                   data-sort-name="id"
                   data-sort-order="asc"
                   data-pagination="true"
                   data-pagination-v-align="bottom"
                   data-pagination-h-align="right"
                   data-pagination-detail-h-align="left"
                   data-pagination-first-text="<<"
                   data-pagination-last-text=">>"
                   data-pagination-pre-text="<"
                   data-pagination-next-text=">"
                   data-page-size="10"
                   data-page-list="[10,25,50,100]"
                   data-side-pagination="server"
                   data-url="area/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            <%--data-height="300"--%>
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <%--<th data-field="id" data-sortable="true">区域Id</th>--%>
                    <th data-field="areaName" data-formatter="areaFormatter">区域</th>
                    <th data-field="defaultFrequency">频点</th>
                    <th data-field="selectProgram">已选节目</th>
                    <th data-field="availableProgram">可用节目</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.js"/>
<script type="text/javascript"
        src="${ctx}/vendors/bower_components/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"/>
<script type="text/javascript">
    var addUrl = "area/addUI.shtml";
    var modifyUrl = "area/modifyUI.shtml?id=";
    var deleteUrl = "area/delete.shtml";
    function areaFormatter(value, row) {
        return row['province'] + "." + row['city'] + "." + row['areaName'];
    }
</script>
<script charset="utf-8">


    $(document).ready(function () {

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

        $('#county').change(function () {
            if($('#city').val()!=""){
                var queryObject = {};
                var paraValue = $("#county").val();
                queryObject['id'] = paraValue;
                $('#bccTable').bootstrapTable('refresh', {
                    query: queryObject
                });
            }
        });

        /*刷新按钮点击事件绑定,刷新table,不传参数*/
        $('#refreshBtn').click(function () {
            $('#province').val("");
            $('#city').val("");
            $('#city').attr("disabled", true);
            $('#county').val("");
            $('#county').attr("disabled", true);
            $('#bccTable').bootstrapTable('refresh');
        });
    });

    /*type为1时,表示市,type为2时,表示县*/
    function showCity(id, type) {
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
</script>
<script type="text/javascript" src="${ctx}/js/common/bcc-bootstrap-table.js"/>