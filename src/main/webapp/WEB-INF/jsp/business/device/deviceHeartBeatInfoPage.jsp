<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<script type="text/javascript" src="${ctx}/common/common.js"></script>--%>

<div class="container">
    <div class="block-header">
        <h2>设备${serialNumber}心跳包详细数据</h2>
    </div>
    <div class="line line-dashed line-lg pull-in"></div>
    <div class="card">
        <div class="card-body card-padding">
            <div class="alert alert-danger hidden" role="alert"></div>
            <form id="form" name="form" class="form-horizontal" method="post"
                  action="">
                <input type="hidden" name="serialNumber" value="${serialNumber}"/>
                <input type="hidden" id="frequency" name="frequency" value=""/>
                <input type="hidden" id="programIds" name="programIds" value=""/>
                <input type="hidden" id="msgPageSize" name="msgPageSize" value="${messenger.msgPageSize}"/>
                <input type="hidden" id="msgPageNumber" name="msgPageNumber" value="${messenger.msgPageNumber}"/>
                <input type="hidden" id="msgSerialNumber" name="msgSerialNumber" value="${messenger.msgSerialNumber}"/>
                <input type="hidden" id="msgUrl" name="msgUrl" value="${messenger.msgUrl}"/>
                <input type="hidden" id="msgEntrance" name="msgEntrance" value="${messenger.msgEntrance}"/>
                <div role="tabpanel" id="freqTab">

                    <div class="card">
                        <div class="card-body card-padding">
                            <div class="pmbb-view">
                                <dl class="dl-horizontal">
                                    <dt>设备状态</dt>
                                    <dd>${postData.dstat}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>line</dt>
                                    <dd>${postData.line}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>温度</dt>
                                    <dd>${postData.temper}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>dtmb状态</dt>
                                    <dd>${postData.locked}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>dtmb工作频点</dt>
                                    <dd>${postData.frq}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>dtmb信号强</dt>
                                    <dd>${postData.strength}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>dtmb信号质量</dt>
                                    <dd>${postData.snr}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>dtmb节目数量</dt>
                                    <dd>${postData.dprogs}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>网盘数量</dt>
                                    <dd>${postData.ndisks}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>摄像头数量</dt>
                                    <dd>${postData.camers}</dd>
                                </dl>
                                <dl class="dl-horizontal">
                                    <dt>用户正在观看的视频数量</dt>
                                    <dd>${postData.sessions}</dd>
                                </dl>

                            </div>
                        </div>
                        </div>
                </div>
                <div class="footer text-right bg-light lter">
                    <a id="closeBtn" class="btn btn-success btn-s-xs">返回</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"/>
<script src="${ctx}/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common/common.js"/>
<script>
    $('#closeBtn').click(function () {
        var msgPageSize = $('#msgPageSize').val();
        var msgPageNumber = $('#msgPageNumber').val();
        var msgSerialNumber = $('#msgSerialNumber').val();
        var msgUrl = $('#msgUrl').val();
        if ($('#msgEntrance').val()=="setting") {
            $("#content").load(rootPath + msgUrl,{
                msgPageSize:msgPageSize,
                msgPageNumber:msgPageNumber,
                msgSerialNumber:msgSerialNumber
            });
        }else{
            $("#content").load(rootPath + msgUrl,{
                msgPageSize:msgPageSize,
                msgPageNumber:msgPageNumber,
                msgSerialNumber:msgSerialNumber
            });
        }

    });
</script>