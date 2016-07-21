<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<c:set var="basedir" value="/frontpage" />
<c:set var="ctx" value="${base}${basedir}" />

<script type="text/javascript">
var rootPath = '${base}';
</script>
<!-- jQuery 2.1.4 -->
<script src="${ctx}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 日历 -->
<script type="text/javascript" src="${ctx}/dist/js/moment.js"></script>
<script type="text/javascript" src="${ctx}/dist/js/daterangepicker.js"></script>
<script type="text/javascript" src="${ctx}/js/infoview.js"></script>

<style>
.my-div{position: absolute;width:80%;height:200px;left:10%;top:20%;} 
.my-label{left:18%;}

#myModal1 {
 width: 'auto';

}
</style>
	<!-- row -->
	<div class="row">
		<div class="col-md-12 my-div">
			<form id="form"  method="post" target="_self" >
				<div class="input-group col-sm-8 my-label">
					<label id="mylabel">注：默认时间为当天，如需更改请单击日历来选择
					</label>
					<label id="mytimelabel" ></label>
				</div>
				<div class="input-group col-sm-8  my-input">
					<input type="text" id="searchinput"  name="searchinput" class="input-lg form-control" placeholder="请输入您要搜索的信息..." /> 
					<span class="input-group-btn">
					<input type="hidden" id="starttime" name="starttime" />
					<input type="hidden" id="endtime"  name="endtime" />
					<button type="button" name="时间" id="searchtime" class="btn myButton  btn-flat btn-lg">
						<i class="fa fa-calendar"></i></button> 
					<button type="button" name="搜索" id="search-btn" class="btn myButton  btn-flat btn-primary btn-lg" onclick="goSub()">
						<i class="fa fa-search"></i></button> 
					<a data-toggle="modal" data-target="#myModal1" class="btn myButton  btn-success btn-lg active" role="button">高级搜索</a>
					</span>
				</div>
			</form>
		</div>	
		
	</div>
	<!-- /.row -->
	<!-- Modal -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">请输入相应的搜索条件</h4>
				</div>
				<form class="form-horizontal" role="form" method="post" >
				<div class="modal-body">
					<div class="panel-body">
					    
						<c:if test="${mobile_start}">
						<div class="form-group">
							<label class="col-sm-2 control-label">IMEI</label> 
							<div class="col-sm-4">
								<input class="form-control" id="imei" name="imei" value="" /> 
							</div>
							<label class="col-sm-1 control-label">IMSI</label>
							<div class="col-sm-5">
								<input class="form-control" id="imsi" name="imsi" value="" />
							</div>
						</div>
						</c:if>
						
						<c:if test="${face_start}">
						<div class="form-group">
							<label class="col-sm-2 control-label">AGE</label> 
							<div class="col-sm-4">
								<input class="form-control" id="age" name="age" value="" /> 
							</div>
							<label class="col-sm-1 control-label">GENDER</label>
							<div class="col-sm-5">
								<input class="form-control" id="gender" name="gender" value="" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">HEIGHT</label> 
							<div class="col-sm-4">
								<input class="form-control" id="height" name="height" value="" /> 
							</div>
							<label class="col-sm-1 control-label">FAT</label>
							<div class="col-sm-5">
								<input class="form-control" id="fat" name="fat" value="" />
							</div>
						</div>
						</c:if>
						
						<c:if test="${ident_start }">
						
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4">
								<input class="form-control" id="imsi" name="imsi" value="" />
							</div>
							<label class="col-sm-1 control-label">性别</label> 
							<div class="col-sm-5">
								<input class="form-control" id="xingbie" name="xingbie" value="" /> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证号</label> 
							<div class="col-sm-10">
								<input class="form-control" id="iden" name="iden" value="" /> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">出生年月日</label>
							<div class="col-sm-10">
								<input class="form-control" id="birthday" name="birthday" value="" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">户口所在地</label> 
							<div class="col-sm-10">
								<input class="form-control" id="address" name="address" value="" /> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">有效期限</label>
							<div class="col-sm-10">
								<input class="form-control" id="expdate" name="expdate" value="" />
							</div>
						</div>
						</c:if>
						
						<c:if test="${wifi_start}">
						<div class="form-group">
							<label class="col-sm-2 control-label">IMEI</label> 
							<div class="col-sm-10">
								<input class="form-control" id="imei" name="imei" value="" /> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">IMSI</label>
							<div class="col-sm-10">
								<input class="form-control" id="imsi" name="imsi" value="" />
							</div>
						</div>
						</c:if>
						
						<input type=hidden name="mypage0" id="mypage0"  value="0" />
						<input type=hidden name="mysize0" id="mysize0"  value="20" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn myButton  btn-primary" onclick="doComSub()" data-dismiss="modal">确定</button>
					<button type="button" class="btn myButton  btn-default" data-dismiss="modal">关闭</button>
				</div>
				</form>
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
	
	
