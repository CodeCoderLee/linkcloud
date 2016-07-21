<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/7/13
  Time: 下午2:51
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/vendors/bower_components/bootstrap-table/dist/bootstrap-table.css">
<link rel="stylesheet"
      href="${ctx}/vendors/bower_components/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<div class="container">
    <div class="block-header">
        <h2>视频广告统计</h2>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="col-sm-10">
                    <div class="col-sm-2">
                        <div class="select">
                            <select class="form-control" id="dateType" name="dateType">
                                <option value="1">日</option>
                                <option value="2">月</option>
                                <option value="3">年</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-2 day">
                        <div class="fg-line">
                            <input size="16" type="text" name="day" value="${day}" id="day" readonly
                                   class="day_datetime input-medium ui-autocomplete-input">
                        </div>
                    </div>
                    <div class="col-sm-2 month hidden">
                        <input size="16" type="text" name="month" id="month" readonly
                               class="month_datetime input-medium ui-autocomplete-input">
                    </div>
                    <div class="col-sm-2 year hidden">
                        <div class="fg-line">
                            <input size="16" type="text" name="year" id="year" readonly
                                   class="year_datetime input-medium ui-autocomplete-input">
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="fg-line">
                            <button id="subBtn" class="btn myButton  btn-success btn-s-xs">统计</button>
                        </div>
                    </div>
                </div>

                <%--</form>--%>
            </div>

        </div>
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <label class="control-label"> <span
                    class="h4 font-thin v-middle totalCount">总播放次数:${map.totalCount}</span></label>
                <label class="control-label"> <span
                        class="h4 font-thin v-middle totalTime">总播放时长(秒):${map.totalTime}</span></label>
            </div>
        </div>
        <div class="card-body table-responsive">
            <table id="bccTable"
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
                   data-page-size="5"
                   data-page-list="[5,10,25,50,100]"
                   data-side-pagination="server"
                   data-url="statistics/videoStatistics.shtml"
                   data-refresh="true"
                   data-click-to-select="true"
                   data-locale="zh-CN"
            <%--data-height="300"--%>
            >
                <thead>
                <tr>
                    <th data-field="pid">广告ID</th>
                    <th data-field="videoFileName">广告文件名</th>
                    <th data-field="totalCount">播放次数</th>
                    <th data-field="totalTime">播放时间(单位秒)</th>
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
<script type="text/javascript"
        src="${ctx}/vendors/bower_components/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"/>
<script type="text/javascript" charset="utf-8"
        src="${ctx}/vendors/bower_components/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"/>
<script type="text/javascript">
    var addUrl = "user/addUI.shtml";
    var modifyUrl = "user/modifyUI.shtml?id=";
    var deleteUrl = "user/delete.shtml";
    $(".day_datetime").datetimepicker({
        format: 'yyyymmdd',
        startView: 2,
        minView: 2,
        language:'zh-CN'
    });
    $(".month_datetime").datetimepicker({
        format: 'yyyymm',
        startView: 3,
        minView: 3,
        language:'zh-CN'
    });
    $(".year_datetime").datetimepicker({
        format: 'yyyy',
        startView: 4,
        minView: 4,
        language:'zh-CN'
    });
    $('.day_datetime').datetimepicker().on('show',function (ev) {
        $('.day_datetime').datetimepicker('setDate', new Date());
    });

    $('.month_datetime').datetimepicker().on('show',function (ev) {
        $('.month_datetime').datetimepicker('setDate', new Date());
    });
    $('#dateType').change(function () {
        var value = $('#dateType').val();
        if (value == 1) {
            $('.day').removeClass("hidden");
            $('.month').addClass("hidden");
            $('.year').addClass("hidden");
        } else if (value == 2) {
            $('.month').removeClass("hidden");
            $('.day').addClass("hidden");
            $('.year').addClass("hidden");
        } else {
            $('.year').removeClass("hidden");
            $('.day').addClass("hidden");
            $('.month').addClass("hidden");
        }
    });

    $('#subBtn').click(function () {
        var dateType = $('#dateType').val();
        var date;
        if (dateType == 1) {
            date = $('#day').val();
        }else if (dateType == 2) {
            date = $('#month').val();
        }else {
            date = $('#year').val();
        }
        if (!date) {
            alert("请选择日期");
            return;
        }
        $('#bccTable').bootstrapTable('refresh',{
            query:{
                dateType:dateType,
                date:date
            }
        });

        $.ajax({
            method:'post',
            url:rootPath +'/statistics/videoTotalStatistics.shtml',
            data:{dateType:dateType,date:date},
            dataType:'json',
            success:function(data){
                console.log(data);
                $('.totalCount').text("总播放次数"+data['totalCount']);
                $('.totalTime').text("总播放时长(秒)"+data['totalTime']);
            }
        });
    });

</script>

<script type="text/javascript" src="${ctx}/js/common/bcc-bootstrap-table.js"/>