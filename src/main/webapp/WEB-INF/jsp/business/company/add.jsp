<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>添加企业信息</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <input type="hidden" name="entrance" value="${entrance}" id="entrance"/>

                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/company/add.shtml">
                        <input type="hidden" name="industryName" id="industryName"/>
                        <input type="hidden" name="areaName" id="areaName"/>
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">企业名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入企业名称" name="name" id="name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">企业全称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入企业全称" name="fullName" id="fullName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">选择区域</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="province" name="province"
                                                            onchange="showCity(this.options[this.options.selectedIndex].value,1)">
                                                        <option value="">省</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="city" name="city"
                                                            disabled="true"
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
                                                            disabled="true">
                                                        <option value="">县</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">选择行业</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control company-control" id="industryCode" name="industryCode"
                                                            >
                                                        <option value="">请选择</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">备注</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" placeholder="请输入备注"
                                               name="remark" id="remark">
                                    </div>
                                </div>
                                <div class="footer text-right bg-light lter">
                                    <button class="btn myButton  btn-success btn-s-xs">提交</button>
                                    <a id="closeBtn" class="btn myButton  btn-success btn-s-xs">返回</a>
                                </div>
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
<script charset="utf-8" src="${ctx}/js/common/area.js"></script>
<script charset="utf-8" src="${ctx}/js/common/industry.js"></script>
<script charset="utf-8" src="${ctx}/js/business/company/add.js"></script>