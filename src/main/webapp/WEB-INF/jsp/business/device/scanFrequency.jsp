<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>设备扫频</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="progress progress-striped active">
                <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100"
                     style="width: 1%">
                    <span class="sr-only">45% Complete</span>
                </div>
            </div>
            <div style="margin-top: 10px" id="info">
                扫描到0个可用频点
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body card-padding">
            <div class="alert alert-danger hidden" role="alert"></div>
            <form id="form" name="form" class="form-horizontal" method="post"
                  action="${ctx}/device/setFrequency.shtml">
                <input type="hidden" name="serialNumber" value="${serialNumber}"/>
                <input type="hidden" id="frequency" name="frequency" value=""/>
                <input type="hidden" id="programIds" name="programIds" value=""/>
                <div role="tabpanel" id="freqTab">
                    <ul class="tab-nav scan-tab" role="tablist">
                        <li class="active"><a href="#home11" aria-controls="home11" role="tab"
                                              data-toggle="tab">Home</a>
                        </li>
                        <li><a href="#profile11" aria-controls="profile11" role="tab" data-toggle="tab">Profile</a></li>
                        <li><a href="#messages11" aria-controls="messages11" role="tab" data-toggle="tab">Messages</a>
                        </li>
                        <li><a href="#settings11" aria-controls="settings11" role="tab" data-toggle="tab">Settings</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home11">
                            <div class="checkbox m-b-15">
                                <label>
                                    <input type="checkbox" value="节目1">
                                    <i class="input-helper"></i>
                                    节目1
                                </label>
                            </div>
                            <div class="checkbox m-b-15">
                                <label>
                                    <input type="checkbox" value="节目2">
                                    <i class="input-helper"></i>
                                    节目2
                                </label>
                            </div>
                            <div class="checkbox m-b-15">
                                <label>
                                    <input type="checkbox" value="节目3">
                                    <i class="input-helper"></i>
                                    节目3
                                </label>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile11">
                            <div class="checkbox m-b-15">
                                <label>
                                    <input type="checkbox" value="节目1">
                                    <i class="input-helper"></i>
                                    节目1
                                </label>
                            </div>
                            <div class="checkbox m-b-15">
                                <label>
                                    <input type="checkbox" value="节目2">
                                    <i class="input-helper"></i>
                                    节目2
                                </label>
                            </div>
                            <div class="checkbox m-b-15">
                                <label>
                                    <input type="checkbox" value="节目3">
                                    <i class="input-helper"></i>
                                    节目3
                                </label>
                            </div>
                            <div class="checkbox m-b-15">
                                <label>
                                    <input type="checkbox" value="节目4">
                                    <i class="input-helper"></i>
                                    节目4
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer text-right bg-light lter">
                    <button id="subBtn" class="btn btn-success btn-s-xs">确定</button>
                    <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script charset="utf-8">
    var ids = [];
    var int = setInterval("getScanFrequency()", 3000);
    $(document).ready(function () {


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
                $(form).ajaxSubmit({
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        notify('success', '     频点设置成功      ');
                        $("#content").load(rootPath + "/device/list.shtml");
                    },
                    error: function (XMLResponse) {
                        alert(XMLResponse.responseText);
                    }
                });
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
                                        '<input type="checkbox" value="' + item.pid + '">' +
                                        '<i class="input-helper"></i>' + item.name +
                                        '</label>' +
                                        '</div>';
                            })

                            divHtml = divHtml + '</div>';
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
                } else {
                    $('#info').html("扫描到" + data.frqsNum + "个可用频点");
                    $('div.progress-bar').attr("aria-valuenow", data.progress);
                    $('div.progress-bar').attr("style", "width:" + data.progress + "%");
                }
                clearInterval(int);

            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }

</script>

