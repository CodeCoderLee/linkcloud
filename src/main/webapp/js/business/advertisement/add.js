/**
 * 添加使用申请
 * Created by bcc on 16/5/31.
 */
var errorCount = 0;
$(document).ready(function () {

    $('#form').validate({
        submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
            if($('#fileName').val()==''){
                alert("请选择图片");
                return;
            }
            $('#image').cropper('getCroppedCanvas').toBlob(function (blob) {
                var formData = new FormData();
            
                formData.append('image', blob);
                formData.append('fileName', $('#fileName').val());
                formData.append('originalFileName', $('#originalFileName').val());
                formData.append('industryCode', $('#industryCode').val());
                formData.append('companyId', $('#company').val());
                formData.append('type', $('#type').val());
                formData.append('ratio', $('input[name="aspectRatio"]:checked').val());
                formData.append('width', $('#dataWidth').val());
                formData.append('height', $('#dataHeight').val());
                if($('#dataWidth').val()>640||$('#dataHeight').val()>640){
                    alert("图片的宽和高不能大于640px");
                    return;
                }
                console.log("formData==", formData);
                notify('success', '     图片正在上传,请稍候      ');
                $.ajax(rootPath + '/advertisement/add.shtml', {
                    method: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (data) {

                        console.log('Upload success');
                        console.log('data ==',data);
                        if (data=="EMPTY") {
                            notify('success', '     图片不能为空      ');
                        }else{
                            notify('success', '     图片上传成功      ');
                            $("#content").load(rootPath + "/advertisement/list.shtml");
                        }
                        return false;

                    },
                    error: function () {
                        console.log('Upload error');
                    }
                });
                return false;
            });
            return false;

            // $(form).ajaxSubmit({
            //     type: "post",
            //     dataType: "json",
            //     success: function (data) {
            //         notify('success', '     图片上传成功      ');
            //         $("#content").load(rootPath + "/advertisement/list.shtml");
            //     },
            //     error: function (XMLResponse) {
            //         alert(XMLResponse.responseText);
            //     }
            // });

        },
        ignore: "",
        rules: {
            // "fileName": {
            //     required: true
            // },
            "industryCode": {
                required: true
            },
            "companyId": {
                required: true
            }

            //"contactPhone": {
            //    required: true
        },
        messages: {
            "industryCode": {
                required: "请选择行业"
            },
            "companyId": {
                required: "请选择企业"
            // },
            // "fileName": {
            //     required: "请选择图片"
                //"contactPhone": {
                //    required: "请填写联系电话"
            }
        },
        errorPlacement: function (error, element) {// 自定义提示错误位置
            console.log("error===", error.html(), "==element==", element);
            // if (error.html()!='') {
            //     $(".alert-danger").removeClass("hidden");
            //     $(".alert-danger").html(error.html()+'</br>');
            // }else {
            //
            // }


            $(".alert-danger").removeClass("hidden");
            $(".alert-danger").html(error.html());
        },
        success: function (label) {// 验证通过后
            console.log("success===", label);
            // alert(2);
            $(".alert-danger").addClass("hidden");
            // if (errorCount>0) {
            //     errorCount--;
            // }else{
            //     $(".alert-danger").addClass("hidden");
            //     $(".alert-danger").html("");
            // }


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
