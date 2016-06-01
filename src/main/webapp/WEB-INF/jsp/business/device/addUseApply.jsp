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
                          action="${ctx}/deviceUseApply/add.shtml">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">选择区域</label>
                                    <div class="col-sm-9">
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="province" onchange="showCity(this.options[this.options.selectedIndex].value,1)" >
                                                        <option value="">省</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="city" onchange="showCity(this.options[this.options.selectedIndex].value,2)">
                                                        <option value="">市</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="fg-line">
                                                <div class="select">
                                                    <select class="form-control" id="county">
                                                        <option value="">县</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入账号" name="accountname" id="accountname">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">密码</label>

                                    <div class="col-sm-9"></div>
                                    <div class="col-sm-9" style="color: red;">
                                        默认密码为:123456
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group" style="margin-right:3px" id="selRole"
                                     data-url="/role/selectRole.shtml"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">是否禁用</label>
                                    <div class="col-sm-9">
                                        <div class="btn-group m-r">
                                            <button data-toggle="dropdown"
                                                    class="btn btn-sm btn-default dropdown-toggle">
                                                <span class="dropdown-label">是</span>
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-select">
                                                <li class="active">
                                                    <a href="#">
                                                        <input type="radio" name="locked" value="0" checked="checked">是
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#">
                                                        <input type="radio" name="locked" value="1">否
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">描述</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" placeholder="请输入账号描述"
                                               name="description" id="description">
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
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script type="text/javascript">
    var rootPath = "${ctx}";
</script>

<script type="text/javascript" src="${ctx}/js/business/device/addUseApply.js"/>