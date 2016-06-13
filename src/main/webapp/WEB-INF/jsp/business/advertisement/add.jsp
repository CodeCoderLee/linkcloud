<%--
  Created by IntelliJ IDEA.
  User: bcc
  Date: 16/6/3
  Time: 下午3:41
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>新增使用申请</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/deviceUseApply/add.shtml" enctype="multipart/form-data" >
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">选择区域</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control company-control" id="province"
                                                            onchange="showCity(this.options[this.options.selectedIndex].value,1)">
                                                        <option value="">省</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control company-control" id="city"
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
                                                    <select class="form-control company-control" id="county" name="areaId"
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
                                                    <select class="form-control company-control" id="grandIndustry"
                                                            onchange="showIndustry(this.options[this.options.selectedIndex].value,1)">
                                                        <option value="">一级行业</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control company-control" id="parentIndustry"
                                                            disabled="true"
                                                            onchange="showIndustry(this.options[this.options.selectedIndex].value,2)">
                                                        <option value="">二级行业</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control company-control" id="industry" name="industryCode"
                                                            disabled="true">
                                                        <option value="">三级行业</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="company">企业</label>

                                    <div class="col-sm-5">
                                        <div class="fg-line">
                                            <div class="select">
                                                <select class="form-control" id="company" name="companyId">
                                                    <option value="">请选择企业</option>
                                                    <c:forEach var="company" varStatus="s" items="${companyList}">
                                                        <option value="${company.id}">${company.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    </div>
                                    <label class="col-sm-3 control-label" style="color: red;">注:需要先选择区域和行业</label>
                                </div>



                                <div class="form-group">
                                    <label class="col-sm-3 control-label">上传广告图片</label>
                                    <div class="col-sm-9">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div class="fileinput-preview thumbnail" data-trigger="fileinput"></div>
                                            <div>
                                                <span class="btn btn-info btn-file">
                                                    <span class="fileinput-new">选择广告图片</span>
                                                    <span class="fileinput-exists">重新选择</span>
                                                    <input type="file" name="...">
                                                </span>
                                                <a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">移除</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn btn-success btn-s-xs">提交</button>
                                <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
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
<script src="${ctx}/vendors/fileinput/fileinput.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript">
    var rootPath = "${ctx}";
</script>

<script type="text/javascript" src="${ctx}/js/business/device/addUseApply.js"/>
