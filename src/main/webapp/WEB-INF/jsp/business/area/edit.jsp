<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/7/6
  Time: 下午10:17
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="container">
    <div class="block-header">
        <h2>修改频点信息</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/area/modify.shtml">
                        <input type="hidden" class="form-control"
                               value="${area.id}" name="id" id="id">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">区域</label>
                                    <div class="col-sm-9">
                                        <label class=" col-sm-3 control-label">${area.province}.${area.city}.${area.areaName}</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">可选节目</label>
                                    <div class="col-sm-9">
                                        <c:choose >
                                            <c:when test="${empty programs || fn:length(programs) == 0}">
                                                <label class="col-sm-3 control-label">无可选节目</label>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="program" items="${programs}" varStatus="s">
                                                    <label class="checkbox checkbox-inline m-r-20">
                                                        <input type="checkbox" value="${program.pid}" name="${program.name}"
                                                               <c:if test="${program.select}">checked="checked"</c:if>  />
                                                        <i class="input-helper"></i>
                                                            ${program.name}
                                                    </label>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn myButton  btn-success btn-s-xs" id="subBtn">提交</button>
                                <a id="closeBtn" class="btn myButton  btn-success btn-s-xs">返回</a>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"></script>
<script charset="UTF-8">
    $(document).ready(function () {
        $('#subBtn').click(function (){
            var select = [];
            var id = $('#id').val();
            $.each($('input[type="checkbox"]:checked'),function (index,item) {
                select.push($(item).val()+"&"+$(item).attr("name"));
            });
            $.ajax({
                type:'post',
                url:rootPath +'/area/modify.shtml',
                data:{id:id,select:select.join(",")},
                dataType:'json',
                success:function(data){
                    notify('success', '     频点修改成功      ');
                    $("#content").load(rootPath + "/area/list.shtml");

                },
                error:function(XMLHttpRequest){
                    console.log(XMLHttpRequest);
                }
            });
            return false;
        });

        $('#closeBtn').click(function () {
            $("#content").load(rootPath + "/area/list.shtml");
        });
    });
</script>