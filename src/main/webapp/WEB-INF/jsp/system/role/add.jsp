<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="container">
    <div class="block-header">
        <h2>添加角色信息</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/role/add.shtml">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">角色名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入角色名" name="name" id="name">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">roleKey</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入roleKey" name="rolekey" id="rolekey">
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
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">角色状态</label>
                                    <div class="col-sm-9">
                                        <div class="btn myButton -group m-r">
                                            <button data-toggle="dropdown"
                                                    class="btn myButton  btn-sm btn-default dropdown-toggle">
                                                <span class="dropdown-label">是</span> <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-select">
                                                <li class=""><a href="#"><input type="radio"
                                                                                name="state" value="0"
                                                                                checked="checked">是</a></li>
                                                <li class="active"><a href="#"><input type="radio"
                                                                                      name="state" value="1">否</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                            </div>
                            <div class="panel-footer text-right bg-light lter">
                                <button type="submit" class="btn myButton  btn-success btn-s-xs">提交</button>
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
<script type="text/javascript" src="${ctx}/js/system/role/add.js"/>

