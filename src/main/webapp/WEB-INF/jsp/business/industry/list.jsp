<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<div class="container">
    <div class="block-header">
        <h2>行业管理</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <form class="form-inline" role="form" id="searchForm"
                      name="searchForm">
                    <div class="form-group">
                        <label class="control-label"> <span
                                class="h4 font-thin v-middle">行业名称:</span></label>
                        <input class="input-medium ui-autocomplete-input" name="fullName" id="fullName"/>
                    </div>
                    <a class="btn myButton btn-default" id="search">查询</a>
                </form>
            </div>
            <button type="button" class="btn myButton  btn-success" id="newBtn">
                <i class="glyphicon glyphicon-edit"></i>新增
            </button>
            <button type="button" class="btn myButton  btn-info" id="modifyBtn">
                <i class="glyphicon glyphicon-edit"></i>修改
            </button>
            <button type="button" class="btn myButton  btn-danger" id="deleteBtn">
                <i class="glyphicon glyphicon-minus"></i>删除
            </button>
            <button id="refreshBtn" class="btn myButton  btn-default">
                <i class="glyphicon glyphicon-refresh"></i>刷新
            </button>
        </div>
        <div class="card-body table-responsive">
            <table id="industryTable"
                   data-toggle="table"
                   data-sort-name="fullCode"
                   data-sort-order="asc"
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
                   data-url="industry/search.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            <%--data-height="300"--%>
            >
                <thead>
                <tr>
                    <th data-checkbox="true"></th>
                    <th data-field="fullCode" data-sortable="true">行业代码</th>
                    <th data-field="fullName" >行业名称</th>
                    <th data-field="description">描述</th>
                    <th data-field="parentCode" data-sortable="true">上级行业代码</th>
                    <th data-field="parentName">上级行业名称</th>
                    <th data-field="grandCode" data-sortable="true">顶级行业代码</th>
                    <th data-field="grandName" data-sortable="true">顶级行业名称</th>
                    <th data-field="createDate" data-formatter="dateTimeFormatter" data-sortable="true">创建时间</th>
                    <th data-field="updateDate" data-formatter="dateTimeFormatter" data-sortable="true">修改时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.js"/>
<script type="text/javascript"
        src="${ctx}/vendors/bower_components/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"/>
<script type="text/javascript">
    $(document).ready(function () {
        var ids = [];

        /*查询按钮点击事件绑定,向后台传参数,请求数据,刷新table*/
        $('#search').click(function () {
            var $fullName = $('#fullName').val();
            var queryObject = new Object();
            /*当参数不为空字符串时,传给后台,避免accountname值为"",导致结果为空*/
            if ($fullName.length) {
                queryObject.fullName = $fullName;
            }
            console.log($fullName);
            $('#industryTable').bootstrapTable().bootstrapTable('refresh', {
                query: queryObject
            });

        });

        /*刷新按钮点击事件绑定,刷新table,不传参数*/
        $('#refreshBtn').click(function () {
            $('#industryTable').bootstrapTable('refresh');
        });

        /*新增按钮点击事件绑定,打开新增窗口*/
        $('#newBtn').click(function(){
//            var $w = $(document).width();
//            window.open('user/addUI.shtml',"",'height=600,width=800,top=200,left='+($w/2-400)+','+'toolbar=no,menubar=yes,scrollbars=no, resizable=no,location=no, status=no');
//            $('#npcForm').attr('src','user/addUI.shtml');
//            $('#npcForm').css({
//                'display':'block'
//            });
            console.log("content==",$("#content"));
            $("#content").load("industry/addUI.shtml");

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
            $('#npcForm').attr('src','industry/modifyUI.shtml?id='+ids[0]);
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
        $('#industryTable').on('check.bs.table',function(e,row,$element){
            ids.push(row.id);
        });

        /*checkbox取消选中事件*/
        $('#industryTable').on('uncheck.bs.table',function(e,row,$element){
            ids.splice(ids.indexOf(row.id),1);
        });

        /*checkbox选中所有事件*/
        $('#industryTable').on('check-all.bs.table',function(e,rows){
            ids = [];
            $.each(rows,function(index,item){
                ids.push(item.id);
            });
        });

        /*checkbox取消选中所有事件*/
        $('#industryTable').on('uncheck-all.bs.table',function(e){
            ids = [];
        });


        /*排序触发事件*/
        $('#industryTable').on('sort.bs.table',function(e,name,order){
            console.log(name,'=====',order);
            var $fullName = $('#fullName').val();
            var queryObject = new Object();
            /*当参数不为空字符串时,传给后台,避免accountname值为"",导致结果为空*/
            if ($fullName.length) {
                queryObject.accountname = $fullName;

            }
            queryObject.sortName = name;
            queryObject.sortOrder = order;
            $('#industryTable').bootstrapTable().bootstrapTable('refresh', {
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