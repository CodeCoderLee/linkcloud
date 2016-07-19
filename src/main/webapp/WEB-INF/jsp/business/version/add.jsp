<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>添加版本信息</h2>
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
                          action="${ctx}/version/add.shtml" enctype="multipart/form-data">
                        <input type="hidden" name="industryName" id="industryName"/>
                        <input type="hidden" name="areaName" id="areaName"/>
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">版本名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入版本名称" name="name" id="name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">版本号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入版本号" name="version" id="version">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">版本类型</label>
                                    <div class="col-sm-5">
                                        <div class="fg-line">
                                            <div class="select">
                                                <select class="form-control" id="type" name="type">
                                                    <option value="">请选择类型</option>
                                                    <option value="1">引导模块</option>
                                                    <option value="2">转码模块</option>
                                                    <option value="3">流媒体模块</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">上传版本文件</label>
                                    <div class="col-sm-9">
                                        <input type="file" name="file">
                                    </div>
                                </div>

                                <div class="progress progress-striped active">
                                    <div class="progress-bar" id="bar" role="progressbar" aria-valuenow="0"
                                         aria-valuemin="0" aria-valuemax="100"
                                         style="width: 0%">
                                        <span class="sr-only">0% Complete</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">备注</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control auto-size"  name="remarks"></textarea>
                                    </div>
                                </div>

                                <div class="footer text-right bg-light lter">
                                    <button class="btn btn-success btn-s-xs">提交</button>
                                    <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
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
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.min.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script charset="utf-8" src="${ctx}/js/common/area.js"></script>
<script charset="utf-8" src="${ctx}/js/common/industry.js"></script>
<script charset="utf-8" src="${ctx}/js/business/version/add.js"></script>