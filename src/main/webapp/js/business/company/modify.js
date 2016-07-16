/**
 * Created by lifm on 16/7/16.
 */
var errorCount = 0;
$(document).ready(function () {
    $('#form').validate({
        submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
            $(form).ajaxSubmit({
                type: "post",
                dataType: "json",
                success: function (data) {
                    notify('success', '     企业修改成功      ');
                    $(".modifyPage").addClass("hidden");
                    $(".listPage").removeClass("hidden");
                    $('#bccTable').bootstrapTable('refresh');
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
            "province": {
                required: true
            },
            "city": {
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
            "province": {
                required: "请选择所属地区"
            },
            "city": {
                required: "请选择所属地区"
            },
            "areaId": {
                required: "请选择所属地区"
            },
            "industryCode": {
                required: "请输选择所属行业"
            }
        },
        errorPlacement: function (error, element) {// 自定义提示错误位置
            if (errorCount == 0) {
                $(".alert-danger").removeClass("hidden");
                $(".alert-danger").html(error.html() + '</br>');
            }
            errorCount++;
        },
        success: function (label) {// 验证通过后
            $(".alert-danger").addClass("hidden");
            $(".alert-danger").html("");
            errorCount = 0;
        }
    });
});
function loadAreas(provinceId, cityId, areaId) {
    //获取省
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
                if (dataMap[i].id == provinceId) {
                    $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyProvince");
                } else {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyProvince");
                }
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
    //获取市
    $.ajax({
        type: "POST",
        url: rootPath + "/area/getAreaCity.shtml",
        data: {id: provinceId, type: 1},
        dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
        success: function (dataMap) {
            dataMap = eval(dataMap.areaCity);
            //alert("dataMap.length::" + dataMap.length);
            console.log("dataMap:::" + dataMap);
            $('#modifyCity').html("<option value=\"\">市</option>");
            for (var i = 0; i < dataMap.length; i++) {
                if (cityId == dataMap[i].id) {
                    $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCity");
                } else {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCity");
                }
            }
        },
        error: function () {
            //请求出错处理
        }
    });

    //获取区县
    $.ajax({
        type: "POST",
        url: rootPath + "/area/getAreaCity.shtml",
        data: {id: cityId, type: 2},
        dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
        success: function (dataMap) {
            dataMap = eval(dataMap.areaCity);
            //alert("dataMap.length::" + dataMap.length);
            console.log("dataMap:::" + dataMap);
            $('#modifyCounty').html("<option value=\"\">市</option>");
            for (var i = 0; i < dataMap.length; i++) {
                if (areaId == dataMap[i].id) {
                    $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCounty");
                } else {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCounty");
                }
            }


        },
        error: function () {
            //请求出错处理
        }
    });
}

function loadIndustry(industryCode){
    $.ajax({
        url: rootPath + "/industry/getIndustryByParentCode.shtml",
        dataType: "json",
        success: function (data) {
            console.log("industryData====", data);
            $.each(data, function (index, item) {
                if(industryCode == item.fullCode){
                    $("<option value='" + item.fullCode + "' selected='selected'>" + item.fullName + "</option>").appendTo("#modifyIndustryCode");
                }else{
                    $("<option value='" + item.fullCode + "'>" + item.fullName + "</option>").appendTo("#modifyIndustryCode");
                }

            })
        },
        error: function (XMLHttpRequest) {
            console.log(XMLHttpRequest);
        }
    });
}


/*type为1时,表示市,type为2时,表示县*/
function showCity1(id, type) {
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
                $('#modifyCity').html("<option value=\"\">市</option>");
                for (var i = 0; i < dataMap.length; i++) {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCity");

                }
                // $('#city').val("");
                $('#modifyCity').attr("disabled", false);
                $('#modifyCounty').val("");
                $('#modifyCounty').attr("disabled", true);
            } else {
                $('#modifyCounty').html("<option value=\"\">县</option>");
                for (var i = 0; i < dataMap.length; i++) {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCounty");

                }
                $('#modifyCounty').attr("disabled", false);
            }


        },
        error: function () {
            //请求出错处理
        }
    });
}
