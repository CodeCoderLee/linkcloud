/**
 * 设备注册js
 * Created by bcc on 16/5/28.
 */

$(function () {
    onLoadUrl();
    $('#closeBtn').click(function () {
        $("#content").load(rootPath + "/device/list.shtml");
    });
    $('#form').validate({
        submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
            $(form).ajaxSubmit({
                type: "post",
                dataType: "json",
                success: function (data) {
                    notify('success', '     设备注册成功      ');
                    $("#content").load(rootPath + "/device/list.shtml");
                },
                error: function (XMLResponse) {
                    alert(XMLResponse.responseText);
                }
            });
        },
        rules: {
            "serialNumber": {
                required: true,
                remote: { // 异步验证是否存在
                    type: "POST",
                    url: 'device/isExist.shtml',
                    data: {
                        name: function () {
                            return $("#serialNumber").val();
                        }
                    }
                }
            }
        },
        messages: {
            "serialNumber": {
                required: "请输入序列号",
                remote: "该序列号已经存在"
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
