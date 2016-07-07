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
                        <input type="hidden" class="form-control checkacc"
                               value="${user.id}" name="id" id="id">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-3 control-label">用户名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control"
                                               placeholder="请输入用户名" value="${user.username}" name="username" id="username">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入账号" value="${user.accountname}" readonly="readonly" name="accountname" id="accountname">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group" style="margin-right:3px" id="selRole"
                                     data-url="/role/selectRole.shtml?userId=${user.id}"></div>

                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">描述</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" placeholder="请输入账号描述"
                                               value="${user.description}" name="description" id="description">
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
