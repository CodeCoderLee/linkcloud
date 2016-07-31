<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="container">
    <div class="block-header">
        <h2>修改角色信息</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${ctx}/role/modify.shtml">
                        <input type="hidden" class="form-control checkacc" value="${role.id}"
                               name="id" id="id">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">角色名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkRole"
                                               placeholder="请输入角色名" name="name" id="name" value="${role.name}"/>
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">roleKey</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入roleKey" name="rolekey" id="rolekey"
                                               value=${role.rolekey}>
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">描述</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" placeholder="请输入角色描述"
                                               name="description" id="description" value="${role.description }">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-3 control-label">角色状态</label>--%>
                                    <%--<div class="col-sm-9">--%>
                                        <%--<div class="btn-group m-r">--%>
                                            <%--<button data-toggle="dropdown"--%>
                                                    <%--class="btn btn-sm btn-default dropdown-toggle">--%>
                            <%--<span class="dropdown-label"><c:if test="${role.state eq 0}">是</c:if><c:if--%>
                                    <%--test="${role.state eq 1}">否</c:if></span> <span class="caret"></span>--%>
                                            <%--</button>--%>
                                            <%--<ul class="dropdown-menu dropdown-select">--%>
                                                <%--<li class=""><a href="#"><input type="radio"--%>
                                                                                <%--name="state" value="0"<c:if--%>
                                                        <%--test="${role.state eq 0}">--%>
                                                                                <%--checked="checked"</c:if>>是</a></li>--%>
                                                <%--<li class="active"><a href="#"><input type="radio"--%>
                                                                                      <%--name="state" value="1" <c:if--%>
                                                        <%--test="${role.state eq 1}"> checked="checked"</c:if>>否</a></li>--%>
                                            <%--</ul>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="line line-dashed line-lg pull-in"></div>
                            </div>
                            <footer class="panel-footer text-right bg-light lter">
                                <button type="submit" class="btn myButton  btn-success btn-s-xs">提交</button>
                                <a id="closeBtn" class="btn myButton  btn-success btn-s-xs">关闭</a>
                            </footer>
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
<script type="text/javascript" src="${ctx}/js/system/role/edit.js"/>