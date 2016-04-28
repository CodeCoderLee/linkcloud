<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/user/list.js"></script>--%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<iframe id="npcForm"></iframe>
<div class="m-b-md">
    <form class="form-inline" role="form" id="searchForm"
          name="searchForm">
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">账号:</span></label>
            <input class="input-medium ui-autocomplete-input" id="accountName"/>
        </div>
        <a class="btn btn-default" id="search">查询</a>
    </form>
</div>
<div id="userManager" class="container-fluid">
    <div class="row">
        <div id="toolbar">
            <button type="button" class="btn btn-success" id="newBtn">
                <i class="glyphicon glyphicon-plus"></i>新增
            </button>
            <button type="button" class="btn btn-success" id="modifyBtn">
                <i class="glyphicon glyphicon-plus"></i>修改
            </button>
            <button type="button" class="btn btn-success" id="deleteBtn">
                <i class="glyphicon glyphicon-plus"></i>删除
            </button>
            <button id="refreshBtn" class="btn btn-default">
                <i class="glyphicon glyphicon-refresh"></i>刷新
            </button>
        </div>
        <table id="userTable"
               data-toggle="table"
               data-sort-name="id"
               data-sort-order="desc"
               data-pagination="true"
               data-pagination-v-align="bottom"
               data-pagination-h-align="right"
               data-pagination-detail-h-align="left"
               data-pagination-first-text="<<"
               data-pagination-last-text=">>"
               data-pagination-pre-text="<"
               data-pagination-next-text=">"
               data-page-size="10"
               data-page-list="[10,25,50,100]"
               data-side-pagination="server"
               data-url="user/search.shtml"
               data-refresh="true"
               data-click-to-select="true"
               data-height="300"
        >
            <thead>
            <tr>
                <th data-checkbox="true"></th>
                <th data-field="username" data-sortable="true">姓名</th>
                <th data-field="accountname" data-sortable="true">账户名</th>
                <th data-field="description" data-sortable="true">描述</th>
                <th data-field="locked" data-formatter="lockedFormatter" data-sortable="true">是否被锁</th>
                <th data-field="createtime" data-formatter="dateTimeFormatter" data-sortable="true">创建时间</th>
            </tr>
            </thead>
        </table>
    </div>

</div>

<script charset="utf-8" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
<script charset="utf-8"
        src="${pageContext.request.contextPath}/assets/js/components/extensions/export/bootstrap-table-export.js"></script>
<script charset="utf-8"
        src="${pageContext.request.contextPath}/assets/js/components/extensions/filter/bootstrap-table-filter.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/extensions/mobile/bootstrap-table-mobile.js"></script>
<script type="text/javascript">
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
            $('#userTable').bootstrapTable().bootstrapTable('refresh', {
                query: queryObject
            });

        });

        /*刷新按钮点击事件绑定,刷新table,不传参数*/
        $('#refreshBtn').click(function () {
            $('#userTable').bootstrapTable('refresh');
        });

        /*新增按钮点击事件绑定,打开新增窗口*/
        $('#newBtn').click(function(){
//            var $w = $(document).width();
//            window.open('user/addUI.shtml',"",'height=600,width=800,top=200,left='+($w/2-400)+','+'toolbar=no,menubar=yes,scrollbars=no, resizable=no,location=no, status=no');
            $('#npcForm').attr('src','user/addUI.shtml');
            $('#npcForm').css({
                'display':'block'
            });
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
//            var $w = $(document).width();
//            window.open('user/modifyUI.shtml?id='+ids[0],"",'height=600,width=800,top=200,left='+($w/2-400)+','+'toolbar=no,menubar=yes,scrollbars=no, resizable=no,location=no, status=no');
            $('#npcForm').attr('src','user/modifyUI.shtml?id='+ids[0]);
            $('#npcForm').css({
                'display':'block'
            });
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
                        $('#userTable').bootstrapTable('refresh');
                    },
                    error:function(){
                        alert("删除失败!");
                    }

                });
            }


        });

        /*checkbox选中事件*/
        $('#userTable').on('check.bs.table',function(e,row,$element){
            ids.push(row.id);
        });

        /*checkbox取消选中事件*/
        $('#userTable').on('uncheck.bs.table',function(e,row,$element){
            ids.splice(ids.indexOf(row.id),1);
        });

        /*checkbox选中所有事件*/
        $('#userTable').on('check-all.bs.table',function(e,rows){
            ids = [];
            $.each(rows,function(index,item){
                ids.push(item.id);
            });
        });

        /*checkbox取消选中所有事件*/
        $('#userTable').on('uncheck-all.bs.table',function(e){
            ids = [];
        });


        /*排序触发事件*/
        $('#userTable').on('sort.bs.table',function(e,name,order){
            console.log(name,'=====',order);
            var $accountName = $('#accountName').val();
            var queryObject = new Object();
            /*当参数不为空字符串时,传给后台,避免accountname值为"",导致结果为空*/
            if ($accountName.length) {
                queryObject.accountname = $accountName;

            }
            queryObject.sortName = name;
            queryObject.sortOrder = order;
            $('#userTable').bootstrapTable().bootstrapTable('refresh', {
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
</script>

