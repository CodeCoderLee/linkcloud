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
<%--<head>--%>
<%--<meta charset="utf-8">--%>
<%--<meta http-equiv="x-ua-compatible" content="ie=edge">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>

<%--</head>--%>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>
<link href="${ctx}/css/fontawesome/font-awesome.min.css" rel="stylesheet">
<link href="${ctx}/vendors/cropper/cropper.css" rel="stylesheet">
<link href="${ctx}/vendors/cropper/main.css" rel="stylesheet">

<div class="container">
    <div class="block-header">
        <h2>新增图文广告素材</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-header">
            <div class="m-b-md" style="margin-bottom: 18px">
                <div class="alert alert-danger hidden" role="alert">
                </div>
                <div class="card-body">
                    <form id="form" name="form" class="form-horizontal" method="post"
                          enctype="multipart/form-data">
                        <input type="hidden" name="originalFileName" id="originalFileName"/>
                        <section class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class=" col-sm-2 control-label">选择行业</label>
                                    <div class="col-sm-5">
                                        <div class="fg-line">
                                            <div class="select">
                                                <select class="form-control company-control" id="industryCode"
                                                        name="industryCode"
                                                >
                                                    <option value="">请选择</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="company">企业</label>

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

                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">广告类型</label>
                                    <div class="col-sm-5">
                                        <div class="fg-line">
                                            <div class="select">
                                                <select class="form-control" id="type" name="type">
                                                    <option value="1">自带广告</option>
                                                    <option value="2">第三方企业广告</option>
                                                    <option value="3">自定义广告</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <%--<div class="form-group">--%>
                                <%--<label class="col-sm-2 control-label">上传广告图片</label>--%>
                                <%--<div class="col-sm-9">--%>
                                <%--<div class="fileinput fileinput-new" data-provides="fileinput">--%>
                                <%--<span class="btn myButton  btn-primary btn-file m-r-10">--%>
                                <%--<span class="fileinput-new">选择图片文件</span>--%>
                                <%--<span class="fileinput-exists">重新选择</span>--%>
                                <%--<input type="file" name="file">--%>
                                <%--</span>--%>
                                <%--<span class="fileinput-filename"></span>--%>
                                <%--<a href="#" class="close fileinput-exists"--%>
                                <%--data-dismiss="fileinput">&times;</a>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <div class="form-group">
                                    <%--<label class="control-label">上传广告图片</label>--%>
                                    <div class="col-sm-8">
                                        <div class="img-container cropper-bg">
                                            <img id="image" src="">
                                        </div>
                                        <div id="file-info" style="margin-bottom: 10px;height: 10px"></div>
                                        <div class="form-group">
                                            <div class="col-sm-10 docs-buttons">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="zoom"
                                                            data-option="0.1" title="Zoom In">
                                                <span class="docs-tooltip" data-toggle="tooltip"
                                                      title="放大">
                                                    <span class="fa fa-search-plus"></span>
                                                </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="zoom"
                                                            data-option="-0.1" title="Zoom Out">
                                                <span class="docs-tooltip" data-toggle="tooltip"
                                                      title="缩小">
                                                    <span class="fa fa-search-minus"></span>
                                                </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="move"
                                                            data-option="-10" data-second-option="0" title="Move Left">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="左移">
                                                          <span class="fa fa-arrow-left"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="move"
                                                            data-option="10" data-second-option="0" title="Move Right">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="右移">
                                                          <span class="fa fa-arrow-right"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="move"
                                                            data-option="0" data-second-option="-10" title="Move Up">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="上移">
                                                          <span class="fa fa-arrow-up"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="move"
                                                            data-option="0" data-second-option="10" title="Move Down">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="下移">
                                                          <span class="fa fa-arrow-down"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="rotate"
                                                            data-option="-45" title="Rotate Left">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="左旋45度">
                                                            <span class="fa fa-rotate-left"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="rotate"
                                                            data-option="45" title="Rotate Right">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="右旋45度">
                                                            <span class="fa fa-rotate-right"></span>
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="scaleX"
                                                            data-option="-1" title="Flip Horizontal">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="水平反转">
                                                          <span class="fa fa-arrows-h"></span>
                                                        </span>
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-method="scaleY"
                                                            data-option="-1" title="Flip Vertical">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="垂直反转">
                                                          <span class="fa fa-arrows-v"></span>
                                                        </span>
                                                    </button>
                                                </div>


                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary" data-method="reset"
                                                            title="Reset">
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="重置">
                                                          <span class="fa fa-refresh"></span>
                                                        </span>
                                                    </button>
                                                    <label class="btn btn-primary btn-upload" for="inputImage"
                                                           title="Upload image file">
                                                        <input type="file" class="sr-only" id="inputImage" name="file"
                                                               accept="image/*"/>
                                                        <span class="docs-tooltip" data-toggle="tooltip"
                                                              title="选择图片">
                                                            <span class="fa fa-folder-open-o"></span>
                                                        </span>
                                                    </label>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="docs-preview clearfix">
                                            <div class="img-preview preview-lg cropper-bg"></div>
                                            <div class="img-preview preview-md cropper-bg"></div>
                                            <div class="img-preview preview-sm cropper-bg"></div>
                                            <div class="img-preview preview-xs cropper-bg"></div>

                                        </div>
                                        <div class="docs-data">
                                            <div class="input-group input-group-sm">
                                                <label class="input-group-addon" for="dataX">X</label>
                                                <input type="text" class="form-control" id="dataX" placeholder="x">
                                                <span class="input-group-addon">px</span>
                                            </div>
                                            <div class="input-group input-group-sm">
                                                <label class="input-group-addon" for="dataY">Y</label>
                                                <input type="text" class="form-control" id="dataY" placeholder="y">
                                                <span class="input-group-addon">px</span>
                                            </div>
                                            <div class="input-group input-group-sm">
                                                <label class="input-group-addon" for="dataWidth">宽</label>
                                                <input type="text" class="form-control" id="dataWidth"
                                                       placeholder="width">
                                                <span class="input-group-addon">px</span>
                                            </div>
                                            <div class="input-group input-group-sm">
                                                <label class="input-group-addon" for="dataHeight">高</label>
                                                <input type="text" class="form-control" id="dataHeight"
                                                       placeholder="height">
                                                <span class="input-group-addon">px</span>
                                            </div>
                                            <div class="input-group input-group-sm">
                                                <label class="input-group-addon" for="dataRotate">旋转</label>
                                                <input type="text" class="form-control" id="dataRotate"
                                                       placeholder="rotate">
                                                <span class="input-group-addon">deg</span>
                                            </div>
                                            <div class="input-group input-group-sm">
                                                <label class="input-group-addon" for="dataScaleX">ScaleX</label>
                                                <input type="text" class="form-control" id="dataScaleX"
                                                       placeholder="scaleX">
                                            </div>
                                            <div class="input-group input-group-sm">
                                                <label class="input-group-addon" for="dataScaleY">ScaleY</label>
                                                <input type="text" class="form-control" id="dataScaleY"
                                                       placeholder="scaleY">
                                            </div>
                                        </div>
                                        <%--<div class="docs-data">--%>
                                        <%--<div class="input-group input-group-sm">--%>
                                        <%--<label class="input-group-addon" for="dataWidth">宽</label>--%>
                                        <%--<input class="form-control" id="dataWidth" readonly="readonly"--%>
                                        <%--placeholder="0">--%>
                                        <%--<span class="input-group-addon">px</span>--%>
                                        <%--</div>--%>
                                        <%--<div class="input-group input-group-sm">--%>
                                        <%--<label class="input-group-addon" for="dataHeight">高</label>--%>
                                        <%--<input class="form-control" id="dataHeight" readonly="readonly"--%>
                                        <%--placeholder="0">--%>
                                        <%--<span class="input-group-addon">px</span>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <div style="margin-bottom: 20px;height: 10px"></div>
                                        <div class="btn-group docs-aspectRatio">
                                            <label class="btn btn-primary active">
                                                <input type="radio" class="sr-only" id="aspectRatio0" name="aspectRatio"
                                                       value="1.7777777777777777" checked="checked">
                                                <span class="docs-tooltip" data-toggle="tooltip"
                                                      title="宽高比: 16 / 9">
                                                  16:9
                                                </span>
                                            </label>
                                            <label class="btn btn-primary">
                                                <input type="radio" class="sr-only" id="aspectRatio1" name="aspectRatio"
                                                       value="1.3333333333333333">
                                                <span class="docs-tooltip" data-toggle="tooltip"
                                                      title="宽高比: 4 / 3">
                                                  4:3
                                                </span>
                                            </label>
                                            <label class="btn btn-primary">
                                                <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio"
                                                       value="4">
                                                <span class="docs-tooltip" data-toggle="tooltip" title="宽高比: 4 / 1">
                                                  4:1
                                                </span>
                                            </label>
                                            <label class="btn btn-primary">
                                                <input type="radio" class="sr-only" id="aspectRatio3" name="aspectRatio"
                                                       value="3">
                                                <span class="docs-tooltip" data-toggle="tooltip" title="宽高比: 3 / 1">
                                                  3:1
                                                </span>
                                            </label>
                                            <label class="btn btn-primary">
                                                <input type="radio" class="sr-only" id="aspectRatio4" name="aspectRatio"
                                                       value="2">
                                                <span class="docs-tooltip" data-toggle="tooltip" title="宽高比: 2 / 1">
                                                  2:1
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">文件名</label>
                                    <div class="col-sm-5">
                                        <div class="fg-line">
                                            <input class="form-control" id="fileName" name="fileName"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer text-right bg-light lter">
                                <button class="btn myButton  btn-success btn-s-xs">提交</button>
                                <a id="closeBtn" class="btn myButton  btn-success btn-s-xs">返回</a>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-2.1.1.min.js"/>
<script charset="utf-8" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<%--<script src="${ctx}/vendors/fileinput/fileinput.min.js"></script>--%>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script src="${ctx}/vendors/cropper/cropper.min.js"></script>
<script src="${ctx}/vendors/cropper/main.js"></script>
<script src="${ctx}/vendors/cropper/canvas-to-blob.js"></script>
<script type="text/javascript">
    var rootPath = "${ctx}";
    //    $('.img-container > img').cropper({
    //        aspectRatio: 16 / 9,
    //        crop: function (data) {
    //            // 出来裁切后的图片数据.
    //        }
    //    });

</script>

<script type="text/javascript" src="${ctx}/js/business/advertisement/add.js"/>
