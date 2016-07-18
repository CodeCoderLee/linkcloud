/**
 * 添加企业js
 * Created by bcc on 16/5/28.
 */

$(function () {
    onLoadUrl();

    $('#closeBtn').click(function () {
        //alert($('#entrance'));
        $("#content").load(rootPath + "/version/list.shtml");
    });
    $('#form').validate({
        submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
            $(form).ajaxSubmit({
                uploadProgress: function (event, position, total, percentComplete) {
                    //var bar = document.getElementById("bar");
                    //bar.style.width = "'"+percentComplete+"%'";
                    $('div.progress-bar').attr("style", "width:" + percentComplete + "%");
                    console.log("bar.style.width::",bar.style.width);
                    console.log("percentComplete===", percentComplete);
                    console.log("total===", total);
                },
                type: "post",
                dataType: "json",
                // complete: function(response) { // on complete
                //     console.log("complete!!");
                // },
                success: function (data) {
                    notify('success', '     版本信息修改成功      ');
                    $("#content").load(rootPath + "/version/list.shtml");
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
            "version": {
                required: true
            },
            "type": {
                required: true
            }

        },
        messages: {
            "name": {
                required: "请输入版本名称"
            },
            "version": {
                required: "请输入版本号"
            },
            "type": {
                required: "请选择版本类型"
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

    // $.ajax({
    //     url:rooPath
    // });
});
