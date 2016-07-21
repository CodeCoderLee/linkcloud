<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>设备扫频</h2>
        <input type="hidden" id="msgPageSize" name="msgPageSize" value="${messenger.msgPageSize}"/>
        <input type="hidden" id="msgPageNumber" name="msgPageNumber" value="${messenger.msgPageNumber}"/>
        <input type="hidden" id="msgSerialNumber" name="msgSerialNumber" value="${messenger.msgSerialNumber}"/>
        <input type="hidden" id="msgUrl" name="msgUrl" value="${messenger.msgUrl}"/>
        <input type="hidden" id="msgEntrance" name="msgEntrance" value="${messenger.msgEntrance}"/>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="progress progress-striped active">
                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                     style="width: 0%">
                    <span class="sr-only">0% Complete</span>
                </div>
            </div>
            <div style="margin-top: 10px" id="info">
                扫描到0个可用频点
            </div>
            <div class="footer text-right bg-light lter">
                ` <a id="scanFrequencyBtn" class="btn myButton  btn-success btn-s-xs">扫频</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body card-padding">
            <div class="alert alert-danger hidden" role="alert"></div>
            <form id="form" name="form" class="form-horizontal" method="post"
                  action="${ctx}/device/setFrequency.shtml">
                <input type="hidden" id="serialNumber" name="serialNumber" value="${serialNumber}"/>
                <input type="hidden" id="frequency" name="frequency" value=""/>
                <input type="hidden" id="programIds" name="programIds" value=""/>
                <input type="hidden" id="areaId" name="areaId" value="${areaId}"/>
                <div role="tabpanel" id="freqTab">
                </div>
                <div class="footer text-right bg-light lter">
                    <button id="subBtn" class="btn myButton  btn-success btn-s-xs hidden">设为工作频点</button>
                    <c:if test="${areaId != null && areaId != ''}">
                        <c:forEach items="${res}" var="key">
                            <a id="setDefaultFrequencyBtn" onclick="setDefaultFrequency('${key.resurl}')"
                               class="btn myButton  btn-success btn-s-xs hidden">设为默认频点</a>
                        </c:forEach>
                    </c:if>

                    <%--<a id="setDefaultFrequencyBtn" class="btn myButton  btn-success btn-s-xs hidden">设为默认频点</a>--%>
                    <a id="closeBtn" class="btn myButton  btn-success btn-s-xs">返回</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"></script>
<script charset="utf-8">
    var ids = [];
    var flag = false;
    var int;
    //    var int = setInterval("getScanFrequency()", 3000);
    $(document).ready(function () {

        getScanFrequency();
        /*返回按钮单击事件绑定*/
        $('#closeBtn').click(function () {
            /*关闭定时扫频请求*/
            clearInterval(int);
            goBack();
//            $("#content").load(rootPath + "/device/settingList.shtml");
        });

        $('#scanFrequencyBtn').click(function () {
            var serialNumber = $('#serialNumber').val();
            $.ajax({
                method: 'post',
                url: rootPath + "/device/startScanFrequency.shtml",
                data: {serialNumber: serialNumber},
                dataType: 'json',
                success: function (data) {
                    alert("扫频命令下发成功,请等待");
                    int = setInterval("getScanFrequency()", 3000);
                    flag = true;
                    $('#info').html("扫描到0个可用频点");
                    $('#freqTab').html("");
                    $('#subBtn').addClass("hidden");
                    $('#setDefaultFrequencyBtn').addClass("hidden");
                    $('div.progress-bar').attr("aria-valuenow", 0);
                    $('div.progress-bar').attr("style", "width:" + 0 + "%");
                }
            });
        });

        $('ul.scan-tab >li').click(function () {
            $('input[type="checkbox"]').attr("checked", false);
            ids = [];
            $('#programIds').val("");
        });
        $('div.checkbox').find('input[type="checkbox"]').click(function () {
            console.log($(this));
            console.log($(this).is(':checked'));
            if ($(this).is(':checked')) {
                ids.push($(this).val());
            } else {
                ids.splice(ids.indexOf($(this).val()), 1);
            }
            if (ids.length == 0) {
                $('#programIds').val("");
            } else {
                $('#programIds').val(ids.join(","));
            }
            $('#programIds').trigger("input");
        });
        $('#form').validate({
            submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
                $('#frequency').val($('ul.scan-tab > li.active').find('a').text());
                if (window.confirm('确认设置工作频点?')) {
                    $(form).ajaxSubmit({
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            notify('success', '     频点设置成功      ');
                            goBack();
//                            $("#content").load(rootPath + "/device/settingList.shtml");
                        },
                        error: function (XMLResponse) {
                            alert(XMLResponse.responseText);
                        }
                    });
                }

            },
            ignore: "",
            rules: {
                "programIds": {
                    required: true
                }
            },
            messages: {
                "programIds": {
                    required: "请至少勾选一个节目"
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
    });


    function getScanFrequency() {
        $.ajax({
            method: "post",
            url: "${ctx}/device/getScanFrequency.shtml",
            data: {serialNumber: "${serialNumber}"},
            dataType: "json",
            success: function (data) {
                console.log(data);
                var ulHtml = "";
                var divHtml = "";
                if (data.scanEnded) {
                    $('#scanFrequencyBtn').text("重新扫频");
                    $('#info').html("扫描到" + data.frqsNum + "个可用频点");
                    $('div.progress-bar').attr("aria-valuenow", 100);
                    $('div.progress-bar').attr("style", "width:100%");
                    if (data.frqsNum > 0) {
                        ulHtml = ulHtml + '<ul class="tab-nav scan-tab" role="tablist">';
                        divHtml = divHtml + '<div class="tab-content">';
                        $.each(data.freqList, function (index, item) {
                            ulHtml = ulHtml + '<li ';
                            divHtml = divHtml + '<div role="tabpanel" class="tab-pane';
                            if (index == 0) {
                                ulHtml = ulHtml + 'class="active"';
                                divHtml = divHtml + ' active';
                            }
                            ulHtml = ulHtml + ' ><a href="#' + item.frq + '" aria-controls="' + item.frq + '" role="tab"' +
                                    'data-toggle="tab">' + item.frq + '</a>';
                            divHtml = divHtml + '" id="' + item.frq + '">';

                            $.each(item.programList, function (index, item) {
                                divHtml = divHtml + '<div class="checkbox m-b-15">' +
                                        '<label>' +
                                        '<input type="checkbox" value="' + item.pid + '" name="' + item.name + '">' +
                                        '<i class="input-helper"></i>' + item.name +
                                        '</label>' +
                                        '</div>';
                            });

                            divHtml = divHtml + '</div>';
                            $('#subBtn').removeClass('hidden');
                            $('#setDefaultFrequencyBtn').removeClass('hidden');
                        });
                        divHtml = divHtml + '</div>';
                        ulHtml = ulHtml + '</ul>';
                        $('#freqTab').html(ulHtml + divHtml);
                        $('ul.scan-tab >li').click(function () {
                            $('input[type="checkbox"]').attr("checked", false);
                            ids = [];
                            $('#programIds').val("");
                        });
                        $('div.checkbox').find('input[type="checkbox"]').click(function () {
                            console.log($(this));
                            console.log($(this).is(':checked'));
                            if ($(this).is(':checked')) {
                                ids.push($(this).val());
                            } else {
                                ids.splice(ids.indexOf($(this).val()), 1);
                            }
                            if (ids.length == 0) {
                                $('#programIds').val("");
                            } else {
                                $('#programIds').val(ids.join(","));
                            }
                            $('#programIds').trigger("input");
                        });
                    }
                    if (flag) {
                        clearInterval(int);
                        flag = false;
                    }


                } else {
                    $('#info').html("扫描到" + data.frqsNum + "个可用频点");
                    $('div.progress-bar').attr("aria-valuenow", data.progress);
                    $('div.progress-bar').attr("style", "width:" + data.progress + "%");
                }


            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }

    function setDefaultFrequency(url) {
        if (window.confirm('确认设置默认频点?')) {
            var serialNumber = $('#serialNumber').val();
            var frequency = $('ul.scan-tab > li.active').find('a').text();
            var areaId = $('#areaId').val();
            var programs = [];
            $.each($('.tab-pane.active').find('input'), function (index, item) {
                programs.push($(item).val() + "&" + $(item).attr("name") + "&" + $(item).is(":checked"));
            });
            $.ajax({
                method: 'post',
                url: url,
                data: {areaId: areaId, frequency: frequency, programs: programs.join(",")},
                dataType: 'json',
                success: function (data) {
                    notify('success', '     默认频点设置成功      ');
                }
            });
        }

    }

    function startScanFrequency() {

    }

    function goBack() {
        var msgPageSize = $('#msgPageSize').val();
        var msgPageNumber = $('#msgPageNumber').val();
        var msgSerialNumber = $('#msgSerialNumber').val();
        var msgUrl = $('#msgUrl').val();
        $("#content").load(rootPath + msgUrl, {
            msgPageSize: msgPageSize,
            msgPageNumber: msgPageNumber,
            msgSerialNumber: msgSerialNumber
        });

    }

</script>

