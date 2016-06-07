/**
 * 添加企业js
 * Created by bcc on 16/5/28.
 */

$(function () {
    onLoadUrl();

    $('#industry').change(function () {
        console.log($(this).find('option:selected').text());
        $('#industryName').val($(this).find('option:selected').text());
    });

    $('#county').change(function () {
        console.log($(this).find('option:selected').text());
        $('#areaName').val($(this).find('option:selected').text());
    });

    $('#closeBtn').click(function () {
        alert($('#entrance'));
        if ($('#entrance').val() != null && $('#entrance').val() != '') {
            $("#content").load(rootPath + "/deviceUseApply/addUI.shtml");
        } else
            $("#content").load(rootPath + "/company/list.shtml");
    });
    $('#form').validate({
        submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
            $(form).ajaxSubmit({
                type: "post",
                dataType: "json",
                success: function (data) {
                    notify('success', '     企业添加成功      ');
                    if ($('#entrance').val() != null && $('#entrance').val() != '') {
                        $("#content").load(rootPath + "/deviceUseApply/addUI.shtml");
                    } else
                        $("#content").load(rootPath + "/company/list.shtml");
                },
                error: function (XMLResponse) {
                    alert(XMLResponse.responseText);
                }
            });
        },
        ignore: "",
        rules: {
            "name": {
                required: true
            },
            "fullName": {
                required: true
            },
            "areaId": {
                required: true
            },
            "industryCode": {
                required: true
            }

        },
        messages: {
            "name": {
                required: "请输入企业名称"
            },
            "fullName": {
                required: "请输入企业全称"
            },
            "areaId": {
                required: "请选择所属地区"
            },
            "industryCode": {
                required: "请输选择所属行业"
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
