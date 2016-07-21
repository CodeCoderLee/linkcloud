<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>设备注册</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/device/add.shtml">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">序列号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入序列号" name="serialNumber" id="serialNumber">
                                    </div>
                                </div>

                                <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-3 control-label">设备私钥</label>--%>
                                    <%--<div class="col-sm-9">--%>
                                        <%--<input type="text" class="form-control"--%>
                                               <%--placeholder="请输入私钥" name="privateKey" id="privateKey">--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">物流号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" placeholder="请输入物流号" name="trackNo" id="trackNo">
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
                                <button class="btn myButton  btn-success btn-s-xs">注册</button>
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
<script type="text/javascript" src="${ctx}/js/business/device/add.js"/>