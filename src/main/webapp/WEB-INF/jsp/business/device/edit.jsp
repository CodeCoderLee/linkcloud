<%--
  Created by IntelliJ IDEA.
  User: lifm
  Date: 16/7/8
  Time: 下午3:08
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>设备修改</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/device/modify.shtml">
                        <input type="hidden" name="id" value="${device.id}"/>
                        <input type="hidden" id="provinceValue" value="${device.province}"/>
                        <input type="hidden" id="cityValue" value="${device.city}"/>
                        <input type="hidden" id="areaId" value="${device.areaId}"/>
                        <input type="hidden" name="serialNumber" value="${device.serialNumber}"/>
                        <input type="hidden" name="exStatus" value="${device.exStatus}"/>
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">序列号</label>
                                    <div class="col-sm-9">
                                        <label class=" col-sm-3 control-label">${device.serialNumber}</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">设备私钥</label>
                                    <div class="col-sm-9">
                                        <label class=" col-sm-3 control-label">${device.privateKey}</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">设备状态</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="status" name="status">
                                                        <option value="1" <c:if test="${device.status==1}">selected="selected"</c:if>>调试状态</option>
                                                        <option value="4" <c:if test="${device.status==4}">selected="selected"</c:if>>入库状态</option>
                                                        <option value="2" <c:if test="${device.status==2}">selected="selected"</c:if>>出库状态</option>
                                                        <option value="3" <c:if test="${device.status==3}">selected="selected"</c:if>>演示状态</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">前状态</label>
                                    <div class="col-sm-9">
                                        <label class=" col-sm-3 control-label">
                                            <c:choose>
                                                <c:when test="${device.exStatus == 1}">调试状态</c:when>
                                                <c:when test="${device.exStatus == 2}">出库状态</c:when>
                                                <c:when test="${device.exStatus == 3}">演示状态</c:when>
                                                <c:when test="${device.exStatus == 4}">入库状态</c:when>
                                                <c:otherwise>无</c:otherwise>
                                            </c:choose>
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">设备区域</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="province"
                                                            onchange="showCity(this.options[this.options.selectedIndex].value,1)">
                                                        <option value="">省</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="city"
                                                            onchange="showCity(this.options[this.options.selectedIndex].value,2)">
                                                        <option value="">市</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="county" name="areaId"
                                                    >
                                                        <option value="">县</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn myButton  btn-success btn-s-xs">修改</button>
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
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script charset="utf-8">

</script>
<script type="text/javascript" src="${ctx}/js/business/device/edit.js"/>

