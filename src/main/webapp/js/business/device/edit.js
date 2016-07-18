/**
 * Created by lifm on 16/7/8.
 */
/**
 * 设备注册js
 * Created by bcc on 16/5/28.
 */
var first = true;
$(function () {
    onLoadUrl();
    
    




});

function loadModifyProvince(){
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
                if (dataMap[i].areaName == row['provinceId']) {
                    $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyProvince");
                    if (first) {
                        showModifyCity(dataMap[i].id, 1);
                    }
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

}

/*type为1时,表示市,type为2时,表示县*/
function showModifyCity(id, type) {
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
                    if (dataMap[i].areaName == row['cityId'] && first) {
                        $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCity");
                        showCity(dataMap[i].id, 2);
                    } else {
                        $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCity");
                    }
                }
                // $('#city').val("");
                $('#city').attr("disabled", false);
                $('#county').val("");
                $('#county').attr("disabled", true);
            } else {
                $('#county').html("<option value=\"\">县</option>");
                for (var i = 0; i < dataMap.length; i++) {
                    if(dataMap[i].id == row['areaId'] && first){
                        $("<option value='" + dataMap[i].id + "' selected='selected'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCounty");
                        first = false;
                    }else{
                        $("<option value='" + dataMap[i].id + "'>" + dataMap[i].areaName + "</option>").appendTo("#modifyCounty");
                    }
                }
                $('#modifyCounty').attr("disabled", false);
            }


        },
        error: function () {
            //请求出错处理
        }
    });
}
