/**
 * Created by lifm on 16/6/30.
 */

$(document).ready(function () {

    $('#form').validate({
        submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
            $(form).ajaxSubmit({
                type: "post",
                dataType: "json",
                success: function (data) {
                    notify('success', '     视频文件上传成功      ');
                    $("#content").load(rootPath + "/video/list.shtml");
                },
                error: function (XMLResponse) {
                    alert(XMLResponse.responseText);
                }
            });
        },
        rules: {
            "industryCode": {
                required: true
            },
            "companyId": {
                required: true
            }
        },
        messages: {
            "industryCode": {
                required: "请选择行业"
            },
            "companyId": {
                required: "请选择企业"
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
        $("#content").load(rootPath + "/video/list.shtml");
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
