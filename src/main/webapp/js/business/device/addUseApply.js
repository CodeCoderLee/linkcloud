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
                    notify('success', '     设备注册成功      ');
                    $("#content").load(rootPath + "/deviceUseApply/list.shtml");
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
            },
            "companyId": {
                required: true
            },
            "contactName": {
                required: true
            },
            "contactPhone": {
                required: true
            }
        },
        messages: {
            "areaId": {
                required: "请选择区域"
            },
            "industryCode": {
                required: "请选择行业"
            },
            "companyId": {
                required: "请选择企业"
            },
            "contactName": {
                required: "请填写联系人"
            },
            "contactPhone": {
                required: "请填写联系电话"
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
        $("#content").load(rootPath + "/deviceUseApply/list.shtml");
    });

    $('#county').change(function () {
        showCompany();
    });

    $('#industryCode').change(function () {
        showCompany();
    });


    $(".glyphicon-plus").click(function () {
        $('#content').load(rootPath + "/company/addUI.shtml?entrance=addUseApply");
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
});


/*type为1时,表示市,type为2时,表示县*/
function showCity(id, type) {
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
                $('#county').trigger("change");
            } else {
                $('#county').html("<option value=\"\">县</option>");
                for (var i = 0; i < dataMap.length; i++) {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#county");

                }
                $('#county').attr("disabled", false);
                $('#county').trigger("change");
            }


        },
        error: function () {
            //请求出错处理
        }
    });
}


// /*type为1时,表示显示二级行业,type为2时,表示3级行业*/
// function showIndustry(parentCode, type) {
//     var grandCode;
//     console.log(type === 2);
//     if (type === 1) {
//         grandCode = "";
//     }
//     if (type === 2) {
//         grandCode = parentCode.substring(0, 1);
//         parentCode = parentCode.substring(1, parentCode.length);
//         console.log(grandCode + "====" + parentCode);
//     }
//     $.ajax({
//         type: "POST",
//         url: rootPath + "/industry/getIndustryByParentCode.shtml",
//         data: {grandCode: grandCode, parentCode: parentCode},
//         dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
//         success: function (data) {
//             console.log("data:::" + data);
//             if (type === 1) {
//                 $('#parentIndustry').html("<option value=\"\">二级行业</option>");
//                 $.each(data, function (index, item) {
//                     $("<option value='" + item.fullCode + "'>" + item.fullName + "</option>").appendTo("#parentIndustry");
//                 });
//                 // $('#parentIndustry').val("");
//                 $('#parentIndustry').attr("disabled", false);
//                 $('#industry').val("");
//                 $('#industry').attr("disabled", true);
//                 $('#industry').trigger("change");
//             } else {
//                 $('#industry').html("<option value=\"\">三级行业</option>");
//                 $.each(data, function (index, item) {
//                     $("<option value='" + item.fullCode + "'>" + item.fullName + "</option>").appendTo("#industry");
//                 });
//                 $('#industry').attr("disabled", false);
//                 $('#industry').trigger("change");
//             }
//
//
//         },
//         error: function (XMLHttpRequest) {
//             //请求出错处理
//             console.log(XMLHttpRequest);
//         }
//     });
// }

function showCompany() {
    var county = $('#county').val();
    var industry = $('#industryCode').val();
    $('#company').html("<option value=\"\">请选择企业</option>");
    if (county != null && county != '' && industry != null && industry != '') {
        $.ajax({
            url: rootPath + "/company/searchCompanyByAreaAndIndustry.shtml",
            data: {areaId: county, industryCode: industry},
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