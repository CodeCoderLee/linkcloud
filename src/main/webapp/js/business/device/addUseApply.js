/**
 * 添加使用申请
 * Created by bcc on 16/5/31.
 */
$(document).ready(function () {
    $("#city").disabled = true;

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
            $("#city").disabled = false;
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

function showCity(id,type){
    $.ajax({
        type: "POST",
        url: rootPath + "/area/getAreaCity.shtml",
        data:{id:id,type:type},
        dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
        success: function (dataMap) {
            dataMap = eval(dataMap.areaCity);
            //alert("dataMap.length::" + dataMap.length);
            console.log("dataMap:::" + dataMap);
            if (type === 1) {
                for (var i = 0; i < dataMap.length; i++) {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#city");

                }
            } else {
                for (var i = 0; i < dataMap.length; i++) {
                    $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#county");

                }
            }

            $("#county").disabled = false;
        },
        error: function () {
            //请求出错处理
        }
    });
}