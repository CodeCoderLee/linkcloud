<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<%@include file="/common/common.jspf" %>--%>

<div class="container">
    <div class="block-header">
        <h2>添加资源菜单</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="l_err" style="width: 100%;height:10px; margin-top: 2px;"></div>
                <div class="card-body">
                    <div class="l_err" style="width: 100%; margin-top: 2px;"></div>
                    <form id="form" name="form" class="form-horizontal" method="post"
                          action="${pageContext.request.contextPath}/resources/addEntity.shtml">
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">菜单名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入菜单名称" name="name" id="name">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">菜单标识</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入菜单标识" name="resKey" id="resKey">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">菜单url</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入菜单url" name="resUrl" id="resUrl">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">上级菜单</label>
                                    <div class="col-sm-9">
                                        <select id="parentId" name="parentId" class="form-control m-b"
                                                tabindex="-1">
                                        </select>
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">菜单类型</label>
                                    <div class="col-sm-9">
                                        <select id="type" name="type" class="form-control m-b"
                                                tabindex="-1">
                                            <option value="0">------ 目录 ------</option>
                                            <option value="1">------ 菜单 ------</option>
                                            <option value="2">------ 按扭 ------</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group" id="divbut" style="display: none;">
                                    <label class="col-sm-3 control-label">选择</label>
                                    <div class="col-sm-9">
                                        <div id="but" class="doc-buttons">
                                        </div>
                                        <font color="red">可自定义填入html代码</font>
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">图标</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control checkacc"
                                               placeholder="请输入icon" name="icon" id="icon">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">是否隐藏</label>
                                    <div class="col-sm-9">
                                        <input id="gritter-light" type="checkbox" name="ishide" id="ishide"
                                               class="ace ace-switch ace-switch-5" value="1">
                                    </div>
                                </div>
                                <div class="line line-dashed line-lg pull-in"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">菜单描述</label>
                                    <div class="col-sm-9">
                                        <select id="description" name="description" class="form-control m-b"
                                                tabindex="-1" placeholder="请输入菜单描述">
                                            <option value="other">------ 其他 ------</option>
                                            <option value="permissions">------ 分配权限 ------</option>
                                            <option value="search">------ 查询 ------</option>
                                            <option value="add">------ 添加 ------</option>
                                            <option value="modify">------ 修改 ------</option>
                                            <option value="delete">------ 删除 ------</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <footer class="panel-footer text-right bg-light lter">
                                <button type="submit" class="btn btn-success btn-s-xs">提交</button>
                                <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
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
<script type="text/javascript" src="${ctx}/js/system/resources/add.js"></script>