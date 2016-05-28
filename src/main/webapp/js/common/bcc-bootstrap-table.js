/**
 * Created by bcc on 16/5/19.
 * 封装公共的bootstrap table 相关方法
 */

$(document).ready(function () {
    var ids = [];
    /*查询按钮点击事件绑定,向后台传参数,请求数据,刷新table*/
    $('#search').click(function () {
        var $accountName = $('#accountName').val();
        var queryObject = new Object();
        /*当参数不为空字符串时,传给后台,避免accountname值为"",导致结果为空*/
        if ($accountName.length) {
            queryObject.accountname = $accountName;
        }
        console.log($accountName);
        $('#bccTable').bootstrapTable().bootstrapTable('refresh', {
            query: queryObject
        });

    });

    /*刷新按钮点击事件绑定,刷新table,不传参数*/
    $('#refreshBtn').click(function () {
        $('#bccTable').bootstrapTable('refresh');
    });

    /*新增按钮点击事件绑定,打开新增窗口*/
    $('#newBtn').click(function(){
        console.log("content==",$("#content"));
        $("#content").load("user/addUI.shtml");

    });

    /*修改按钮点击事件绑定,打开修改窗口*/
    $('#modifyBtn').click(function(){
        if (ids.length==0){
            alert("请选中一条记录");
            return;
        }
        if(ids.length>1){
            alert("最多选中一条记录");
            return;
        }
        $("#content").load("user/modifyUI.shtml?id="+ids[0]);
        ids = [];
    });

    /*删除按钮点击事件绑定*/
    $('#deleteBtn').click(function(){
        if (ids.length==0){
            alert("请选中一条记录");
            return;
        }
        console.log(ids.join(","));
        if(window.confirm("确认删除?")){
            $.ajax({
                url:"user/delete.shtml",
                data:{ids:ids.join(",")},
                type:"post",
                success:function(data){
                    alert("删除成功!");
                    $('#bccTable').bootstrapTable('refresh');
                },
                error:function(){
                    alert("删除失败!");
                }

            });
        }
        ids = [];


    });

    /*checkbox选中事件*/
    $('#bccTable').on('check.bs.table',function(e,row,$element){
        ids.push(row.id);
    });

    /*checkbox取消选中事件*/
    $('#bccTable').on('uncheck.bs.table',function(e,row,$element){
        ids.splice(ids.indexOf(row.id),1);
    });

    /*checkbox选中所有事件*/
    $('#bccTable').on('check-all.bs.table',function(e,rows){
        ids = [];
        $.each(rows,function(index,item){
            ids.push(item.id);
        });
    });

    /*checkbox取消选中所有事件*/
    $('#bccTable').on('uncheck-all.bs.table',function(e){
        ids = [];
    });


    /*排序触发事件*/
    $('#bccTable').on('sort.bs.table',function(e,name,order){
        console.log(name,'=====',order);
        var $accountName = $('#accountName').val();
        var queryObject = new Object();
        /*当参数不为空字符串时,传给后台,避免accountname值为"",导致结果为空*/
        if ($accountName.length) {
            queryObject.accountname = $accountName;

        }
        queryObject.sortName = name;
        queryObject.sortOrder = order;
        $('#bccTable').bootstrapTable().bootstrapTable('refresh', {
            query: queryObject
        });
    });





});
function dateTimeFormatter(value) {
    if (!!value) {
        var date = new Date();
        date.setTime(value);
        return date.toLocaleString();
    } else {
        return "--";
    }

//        return date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate() + " " + date.getHours()
//                + ":" + date.getMinutes() + ":" + date.getSeconds();
}
function lockedFormatter(value) {
    if (!!value) {
        if (value == 1) {
            return "否";
        }
        if (value == 0) {
            return "是";
        }
    }
    return "--";
}