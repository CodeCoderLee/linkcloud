<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<div id="log" class="container-fluid">
    <div class="row">
        <table id="logTable"
               data-toggle="table"
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
               data-url="logs/search.shtml"
               data-refresh="true"
               data-click-to-select="true"
               data-height="300"
        >
            <thead>
            <tr>
                <th data-checkbox="true"></th>
                <th data-field="accountname">帐号</th>
                <th data-field="module">模块</th>
                <th data-field="methods">方法</th>
                <th data-field="actiontime">响应时间</th>
                <th data-field="userip">IP地址</th>
                <th data-field="opertime" data-formatter="dateTimeFormatter">操作时间</th>
                <th data-field="description">描述</th>

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
    $('#search').click(function () {
        var $accountName = $('#accountName').val();
        var queryObject = new Object();
        /*当参数不为空字符串时,传给后台,避免accountname值为"",导致结果为空*/
        if ($accountName.length) {
            queryObject.accountname = $accountName;
        }
        console.log($accountName);
        $('#logTable').bootstrapTable().bootstrapTable('refresh', {
            query: queryObject
        });
    });
    function dateTimeFormatter(value) {
        console.log(value);
        if (!!value) {
            var date = new Date();
            date.setTime(value.time);
            return date.toLocaleString();
        } else {
            return "--";
        }
    }
</script>