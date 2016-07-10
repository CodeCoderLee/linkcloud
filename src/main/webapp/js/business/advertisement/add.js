/**
 * 添加使用申请
 * Created by bcc on 16/5/31.
 */
jQuery.validator.addMethod("contactPhone", function (value, element) {
    var tel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
    return this.optional(element) || (tel.test(value));
}, "请正确填联系电话");
$(document).ready(function () {

    $('#form').validate({
        submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
            $(form).ajaxSubmit({
                type: "post",
                dataType: "json",
                success: function (data) {
                    notify('success', '     图片上传成功      ');
                    $("#content").load(rootPath + "/advertisement/list.shtml");
                },
                error: function (XMLResponse) {
                    alert(XMLResponse.responseText);
                }
            });
        },
        rules: {
            "areaId": {
                required: true
            },
            "industryCode": {
                required: true
            //},
            //"companyId": {
            //    required: true
            //},
            //"contactName": {
            //    required: true
            //},
            //"contactPhone": {
            //    required: true
            }
        },
        messages: {
            "areaId": {
                required: "请选择区域"
            },
            "industryCode": {
                required: "请选择行业"
            //},
            //"companyId": {
            //    required: "请选择企业"
            //},
            //"contactName": {
            //    required: "请填写联系人"
            //},
            //"contactPhone": {
            //    required: "请填写联系电话"
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

    $('#closeBtn').click(function () {
        $("#content").load(rootPath + "/advertisement/list.shtml");
    });

    $('#industryCode').change(function () {
        showCompany();
    });

    $.ajax({
        url: rootPath + "/industry/getIndustryByParentCode.shtml",
        dataType: "json",
        success: function (data) {
            console.log("industryData====", data);
            $.each(data, function (index, item) {
                $("<option value='" + item.fullCode + "'>" + item.fullName + "</option>").appendTo("#industryCode");
            })
        },
        error: function (XMLHttpRequest) {
            console.log(XMLHttpRequest);
        }
    });

});


function showCompany() {
    var industry = $('#industryCode').val();
    $('#company').html("<option value=\"\">请选择企业</option>");
    if (industry != null && industry != '') {
        $.ajax({
            url: rootPath + "/company/searchCompanyByIndustry.shtml",
            data: {industryCode: industry},
            dataType: "json",
            success: function (data) {
                console.log("company===" + data);
                $.each(data, function (index, item) {
                    $("<option value='" + item.id + "'>" + item.name + "</option>").appendTo("#company");
                });
            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }
}
