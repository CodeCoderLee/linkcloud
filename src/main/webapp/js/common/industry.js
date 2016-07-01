/**
 * 行业三级联动
 * Created by bcc on 16/6/2.
 */
$(document).ready(function () {
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
//
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