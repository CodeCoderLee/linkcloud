<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container listPage">
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
                <button type="button" class="btn btn-info" id="modifyAreaBtn">
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
                    <th data-field="areaName" data-width="100" data-formatter="areaFormatter">区域</th>
                    <th data-field="defaultFrequency">频点</th>
                    <th data-field="selectProgram">已选节目</th>
                    <%--<th data-field="availableProgram">可用节目</th>--%>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<div class="container hidden modifyPage">
    <div class="block-header">
        <h2>修改频点信息</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/area/modify.shtml">
                        <input type="hidden" class="form-control"
                               value="${area.id}" name="id" id="id">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">区域</label>
                                    <div class="col-sm-9">
                                        <label class="col-sm-3 control-label areaName"></label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">可选节目</label>
                                    <div class="col-sm-9 programs">
                                        <%--<c:choose>--%>
                                        <%--<c:when test="${empty programs || fn:length(programs) == 0}">--%>
                                        <%--<label class="col-sm-3 control-label">无可选节目</label>--%>
                                        <%--</c:when>--%>
                                        <%--<c:otherwise>--%>
                                        <%--<c:forEach var="program" items="${programs}" varStatus="s">--%>
                                        <%--<label class="checkbox checkbox-inline m-r-20">--%>
                                        <%--<input type="checkbox" value="${program.pid}"--%>
                                        <%--name="${program.name}"--%>
                                        <%--<c:if test="${program.select}">checked="checked"</c:if>  />--%>
                                        <%--<i class="input-helper"></i>--%>
                                        <%--${program.name}--%>
                                        <%--</label>--%>
                                        <%--</c:forEach>--%>
                                        <%--</c:otherwise>--%>
                                        <%--</c:choose>--%>

                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn btn-success btn-s-xs" id="subBtn">提交</button>
                                <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"></script>
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

        loadProvince();

        $('#county').change(function () {
            if ($('#county').val() != "") {
                var paraValue = $("#county").val();
                $('#bccTable').bootstrapTable('refresh', {
                    url: rootPath + "/area/search.shtml?id=" + paraValue + "&level=3"
                });
            } else {
                var paraValue = $("#city").val();
                $('#bccTable').bootstrapTable('refresh', {
                    url: rootPath + "/area/search.shtml?id=" + paraValue + "&level=2"
                });
            }
        });

        /*刷新按钮点击事件绑定,刷新table,不传参数*/
        $('#refreshBtn').click(function () {
            resetProvinceSelect(rootPath + "/area/search.shtml");
        });

        //修改按钮点击事件绑定
        $("#modifyAreaBtn").click(function () {
            var rows = $('#bccTable').bootstrapTable('getSelections');
            if (rows.length == 0) {
                alert("请选中一条记录");
                return;
            }
            if (rows.length > 1) {
                alert("最多选中一条记录");
                return;
            }
            $('.programs').html("");
            $('.areaName').text(rows[0]['province'] + "." + rows[0]['city'] + "." + rows[0]['areaName']);
            $.ajax({
                method: 'post',
                url: rootPath + "/area/getPrograms.shtml",
                data: {id: rows[0]['id']},
                dataType: 'json',
                success: function (data) {
                    console.clear();
                    console.log(data);
                    var html = "";
                    if ($.isEmptyObject(data)) {
                        html = '<label class="col-sm-3 control-label">无可选节目</label>';
                    } else {
                        $.each(data, function (index, item) {
                            html = html +
                                    '<label class="checkbox checkbox-inline m-r-20">' +
                                    '<input type="checkbox" value="' + item.pid + '" name="' + item.name + '"';
                            if (item.select) {
                                html = html + 'checked="checked"';
                            }
                            html = html +
                                    '/>' +
                                    '<i class="input-helper"></i>' + item.name +
                                    '</label>';
                        })
                    }
                    $('.programs').html(html);
                }
            });
            $(".listPage").addClass("hidden");
            $(".modifyPage").removeClass("hidden");
        });

        //提交按钮点击事件绑定
        $('#subBtn').click(function () {
            var select = [];
            var id = $('#id').val();
            console.clear();
            console.log($('.programs').find('input[type="checkbox"]:checked'));
            $.each($('.programs').find('input[type="checkbox"]:checked'), function (index, item) {
                select.push($(item).val() + "&" + $(item).attr("name"));
            });
            $.ajax({
                type: 'post',
                url: rootPath + '/area/modify.shtml',
                data: {id: $('#bccTable').bootstrapTable('getSelections')[0]['id'], select: select.join(",")},
                dataType: 'json',
                success: function (data) {
                    notify('success', '     频点修改成功      ');
                    $(".modifyPage").addClass("hidden");
                    $(".listPage").removeClass("hidden");
                    $('#bccTable').bootstrapTable('refresh');
                },
                error: function (XMLHttpRequest) {
                    console.log(XMLHttpRequest);
                }
            });
            return false;
        });

        //返回按钮点击事件绑定
        $('#closeBtn').click(function () {
            $(".modifyPage").addClass("hidden");
            $(".listPage").removeClass("hidden");
            $('#bccTable').bootstrapTable('refresh');
        });
    });

    //重置
    function resetProvinceSelect(url) {
        $('#province').val("");
        $('#city').val("");
        $('#city').attr("disabled", true);
        resetCountySelect(url);
    }

    function resetCountySelect(url) {
        $('#county').val("");
        $('#county').attr("disabled", true);
        resetCitySelect(url);
    }

    function resetCitySelect(url) {
        $('#bccTable').bootstrapTable('refresh', {
            url: url
        });
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
                resetProvinceSelect(rootPath + "/area/search.shtml");
                return;
            } else {
                var paraValue = $("#province").val();
                $('#bccTable').bootstrapTable('refresh', {
                    url: rootPath + "/area/search.shtml?id=" + paraValue + "&level=1"
                });
            }
        }
        if (type == 2) {
            if ($('#city').val() == "") {
                var paraValue = $('#province').val();
                resetCountySelect(rootPath + "/area/search.shtml?id=" + paraValue + "&level=1");
                return;
            } else {
                var paraValue = $("#city").val();
                $('#bccTable').bootstrapTable('refresh', {
                    url: rootPath + "/area/search.shtml?id=" + paraValue + "&level=2"
                });
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
</script>
<script type="text/javascript" src="${ctx}/js/common/bcc-bootstrap-table.js"/>