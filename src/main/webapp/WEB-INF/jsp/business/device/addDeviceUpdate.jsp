<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/6/27
  Time: 下午8:37
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>更新升级版本</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-body card-padding">
            <input type="hidden" name="serialNumbers" id="serialNumbers" value="${serialNumbers}"/>
            <input type="hidden" name="msgEntrance" id="msgEntrance" value="${messenger.msgEntrance}"/>
            <input type="hidden" name="msgSerialNumber" id="msgSerialNumber" value="${messenger.msgSerialNumber}"/>
            <input type="hidden" name="msgPageSize" id="msgPageSize" value="${messenger.msgPageSize}"/>
            <input type="hidden" name="msgPageNumber" id="msgPageNumber" value="${messenger.msgPageNumber}"/>
            <input type="hidden" id="msgUrl" name="msgUrl" value="${messenger.msgUrl}"/>

            <div class="row" id="dataDiv">
            </div>
            <div class="footer text-right bg-light lter">
                <button id="subBtn" class="btn btn-success btn-s-xs">确定</button>
                <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript">
    var rootPath = "${ctx}";
</script>
<script charset="utf-8">
    var serialNumber = [];
    $(document).ready(function () {
        $.ajax({
            method: 'get',
            url: rootPath + "/version/searchVersionList.shtml",
            dataType: 'json',
            success: function (data) {
                console.log("data====", data);
                var html = "";
                $('#dataDiv').html("");
                $.each(data, function (index, item) {
                    if (index == 0) {//初始化第一组数据表头
                        html = '<div class="col-sm-12 m-b-20">' +
                                '<p class="f-500 m-b-20 c-black">' + item.modelName + '</p>' +
                                '<ul class="list-group">';
                    } else if (item.modelName != data[index - 1].modelName) {//一个模块结束
                        html = html + '</ul></div>';
                        $('#dataDiv').append(html);
                        //初始化下一组数据
                        html = '<div class="col-sm-12 m-b-20">' +
                                '<p class="f-500 m-b-20 c-black">' + item.modelName + '</p>' +
                                '<ul class="list-group">';
                    }
                    html = html +
                            '<li class="list-group-item">' +
                            '<label class="radio radio-inline m-r-20">' +
                            '<input type="radio" name="' + item.type + '" value="' +
                            item.id + '&' + item.name + '&' + item.url + '&' + item.type + '&' + item.version + '&' + item.fileName + '&' + item.modelName +
                            '">' +
                            '<i class="input-helper"></i>' + '版本名:' + item.name + '  版本号:' + item.version +
                            '</label>' +
                            '</li>';
                    if (index == data.length - 1) {
                        //最后一个数据
                        html = html + '</ul></div>';
                        $('#dataDiv').append(html);
                    }
                });
            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });

        /*确定按钮点击事件绑定,打开新增窗口*/
        $('#subBtn').click(function () {
            var versions = [];
            $('input[type="radio"]:checked').each(function () {
                versions.push(this.value);
            });

            if (versions.length == 0) {
                notify('success', '     请选择升级文件      ');
            } else {
                var serialNumbers = $('#serialNumbers').val();
                var msgEntrance = $('#msgEntrance').val();
                console.log("msgEntrance::",msgEntrance);
                console.log("serialNumbers:::",serialNumbers);
                $.ajax({
                    method: 'post',
                    url: 'deviceUpdate/updateDeviceVersion.shtml',
                    data: {serialNumbers: serialNumbers, versions: versions.join(","),msgEntrance:msgEntrance},
                    success: function (data) {
                        notify('success', '     升级指令已下发      ');
                        goBack();
                    },
                    error: function (XMLHttpRequest) {
                        console.log(XMLHttpRequest);
                    }
                });
            }

        });

        /*返回按钮单击事件绑定*/
        $('#closeBtn').click(function () {
            goBack();
        });
    });

    function goBack() {
        var msgPageSize = $('#msgPageSize').val();
        var msgPageNumber = $('#msgPageNumber').val();
        var msgSerialNumber = $('#msgSerialNumber').val();
        var msgUrl = $('#msgUrl').val();
        if (msgUrl!=null && msgUrl!="") {
            $("#content").load(rootPath + msgUrl, {
                msgPageSize: msgPageSize,
                msgPageNumber: msgPageNumber,
                msgSerialNumber: msgSerialNumber
            });
        }else {
            $("#content").load(rootPath + "/deviceUpdate/list.shtml");
        }


    }
</script>
