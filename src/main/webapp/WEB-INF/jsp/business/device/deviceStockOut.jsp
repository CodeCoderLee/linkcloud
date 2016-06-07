<%--
  Created by IntelliJ IDEA.
  User: bcc
  Date: 16/6/2
  Time: 下午9:28
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/assets/css/bootstrap-multiselect.css" type="text/css"/>

<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>设备绑定出库</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/deviceUseApply/stockOut.shtml">
                        <input type="hidden" class="form-control checkacc"
                               value="${applyId}" name="id" id="id">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">可选设备</label>
                                    <div class="col-sm-5">
                                        <div class="fg-line">
                                            <div class="select">
                                                <select class="form-control" id="example-multiple-selected"
                                                        multiple="multiple" name="deviceNumbers">
                                                    <c:forEach var="device" items="${deviceList}" varStatus="de">
                                                        <option value="${device.serialNumber}">${device.serialNumber}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn btn-success btn-s-xs" id="sub">出库</button>
                                <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript" src="${ctx}/assets/js/plugins/bootstrap-multiselect.js"></script>
<script type="text/javascript">
    var rootPath = "${ctx}";
    $(document).ready(function () {
        $('#example-multiple-selected').multiselect({
            enableFiltering: true,
            includeSelectAllOption: true,
            maxHeight: 400
        });

        $("#sub").click(function () {
            $('#form').ajaxSubmit({
                type: "post",
                dataType: "json",
                success: function (data) {
                    notify('success', '     设备出库成功     ');
                    $("#content").load(rootPath + "/deviceUseApply/list.shtml");
                },
                error: function (XMLResponse) {
                    alert(XMLResponse.responseText);
                }
            });
            return false;
        });


    });


</script>
</script>

