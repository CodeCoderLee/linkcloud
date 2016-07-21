<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="base" value="${pageContext.request.contextPath}" />
<c:set var="basedir" value="/frontpage" />
<c:set var="ctx" value="${base}${basedir}" />
<c:set var="pic" value="${base}/front/pic/" />

<script type="text/javascript">
	var rootPath = '${base}';
</script>
<!-- jQuery 2.1.4 -->
<%--<script src="${ctx}/plugins/jQuery/jQuery-2.1.4.min.js"></script>--%>
<script src="${ctx}/frontpage/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
<!-- 日历 -->
<script type="text/javascript" src="${ctx}/dist/js/moment.js"></script>
<script type="text/javascript" src="${ctx}/dist/js/daterangepicker.js"></script>
<!-- 分页 -->
<script type="text/javascript" src="${ctx}/dist/js/extendPagination.js"></script>
<script type="text/javascript" src="${ctx}/js/search.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
//		临时解决轮播图和modal冲突的问题，当本页面加载时，若页面中存在modal-backdrop类的div，则删除。
		$('div.modal-backdrop').remove();
	});
</script>
<style>
.my-div {
	position: absolute;
	width: 80%;
	height: 200px;
	left: 10%;
	top: 20%;
}
.my-label{left:26%;}
.my-span{font-size:16px;color:#3c763d;background-color:#d6e9c6;}

.my-btn{margin-bottom:10px;margin-right:10px;}
.btn-footer{text-align:right;}
.my-margin{margin-left:10px;}
</style>
<!-- row -->
<div class="row" >
	<div class="col-md-12">
		<form action="#" method="post" >
			<div class="input-group col-sm-6  my-input">
				<input type="text" name="searchinput0" id="searchinput0" class="form-control" placeholder="请输入您要搜索的信息..." /> 
				<span class="input-group-btn">
					<input type="hidden" id="starttime0" name="starttime0" />
					<input type="hidden" id="endtime0"  name="endtime0" />
					<button type="button" name="时间" id="searchtime0" class="btn myButton  btn-flat ">
						<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
					</button>
					<button type="button" name="搜索" id="search-btn" class="btn myButton  btn-flat  btn-primary" onclick="goSub0()">
						<i class="fa fa-search"></i>
					</button> 
					<a data-toggle="modal" data-target="#myModal1" class="btn myButton  btn-success active" role="button">高级搜索</a>
				</span>
			</div>
			<div class="input-group col-sm-8 my-label">
				<label id="mylabel0"><small>注：默认时间为当天，如需更改请单击日历来选择</small>
				</label>
				<label id="mytimelabel0" ></label>
			</div>
		</form>

		<h3>
			<strong>搜索条件</strong>
		</h3>
			<!-- row -->
			
			<form>
			<p>
				<input type=hidden id="termlen" value="${fn:length(terms) }" />
				<c:forEach items="${terms}" var="term" varStatus="status">
					
					<input type=hidden id="${term.key }" value="${term.value }" />
					<span class="label my-span">${term.value }</span>
					
				</c:forEach>
			</p>
			</form>
			
		<!-- The time line -->
		<ul class="timeline" id="timelineul">

			<!-- timeline time label -->

			<c:forEach items="${res}" var="res" varStatus="mystatus">

				<!-- one row  开始循环-->
				<li class="time-label"><span class="bg-red"> <fmt:formatDate value="${res.date }" pattern="yyyy-MM-dd " /></span></li>
				<!-- /.timeline-label -->


				<!-- timeline item -->
				<li><i class="fa fa-comments bg-blue"></i>

					<div class="timeline-item">
						<span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${res.date }" pattern="HH:mm:ss" /></span>
						<h3 class="timeline-header">
							<B>检索结果</B>
						</h3>

						<form action="${pageContext.request.contextPath}/front/detail.shtml" role="form" target="_blank">
							<div class="timeline-body">
								<!-- /.box-header -->
								<div class="box-body">

									<ul class="list-group col-md-12">
										<c:if test="${(res.mobiles)!= null && fn:length(res.mobiles) > 0}">
											<li class="list-group-item list-group-item-success">
												<dl class="dl-horizontal margin0">
													<dt class="my_dt">IMEI</dt>
													<dd>
														<c:forEach items="${res.mobiles }" var="mobile" varStatus="status">${mobile.imei }&nbsp;&nbsp;
														<input type=hidden name="ids" id="mo_${status.index }" data="${status.index }" value="${mobile._id }" />
														</c:forEach>
													</dd>
												</dl>
											</li>
											<input type=hidden name="mo_length" id="mo_length" value="${fn:length(res.mobiles) }" />
										</c:if>
										<c:if test="${(res.identifications)!= null && fn:length(res.identifications) > 0}">
											<li class="list-group-item list-group-item-info">
												<dl class="dl-horizontal margin0">
													<dt>身份证号</dt>
													<dd>
														<c:forEach items="${res.identifications }" var="iden" varStatus="status">${iden.uid }&nbsp;&nbsp;
														<input type=hidden name="ids" id="iden_${status.index }" data="${status.index }" value="${iden._id }" />
														</c:forEach>
													</dd>
												</dl>
											</li>
										</c:if>
									</ul>
								</div>

								<c:if test="${(res.faces)!= null && fn:length(res.faces) > 0}">
									<div class="row my-margin ">
										<h4>
										    
											<b>人脸图像</b>
											
										</h4>
									</div>
									
									
									
									<div id="carousel_${mystatus.index }" class="carousel slide" data-ride="carousel">

										<!-- Wrapper for slides -->
										<div class="carousel-inner" role="listbox">
											<c:if test="${fn:length(res.faces) > 5}">
											
											<c:forEach begin="0" end="${ fn:length(res.faces) / 6 - 1}" varStatus="sta">
											<div class="item <c:if test="${sta.index == 0}">active</c:if>">
												<c:forEach  begin="0" end="5" varStatus="status">
													
													<input type=hidden name="ids"  
													value="${res.faces[(status.index)+6*(sta.index)]._id }" />
													<div class="col-xs-6 col-md-2">
														<a href="#" class="thumbnail"> 
														<c:choose>
    														<c:when test="${(res.faces[(status.index)+6*(sta.index)].face)!= null }">
															<img src="${pic }${(res.faces[(status.index)+6*(sta.index)].face) }.shtml" alt="${res.faces[(status.index)+6*(sta.index)]._id }" class="margin">
      														</c:when>
      														<c:when test="${(res.faces[(status.index)+6*(sta.index)].face) == null } 
      														&& ${(res.faces[(status.index)+6*(sta.index)].body)!= null }">
															<img src="${pic }${(res.faces[(status.index)+6*(sta.index)].body) }.shtml" alt="${res.faces[(status.index)+6*(sta.index)]._id }" class="margin">
      														</c:when>
    													</c:choose>
														</a>
													</div>
												
												</c:forEach>
												</div>
											</c:forEach>
											</c:if>
											<c:if test="${fn:length(res.faces) > 6}">
											<div class="item">
											<c:forEach begin="0" end="${ fn:length(res.faces) % 6 - 1}" varStatus="s">
												
													<input type=hidden name="ids" 
													value="${res.faces[fn:length(res.faces)-s.index-1]._id }" />
													<div class="col-xs-6 col-md-2">
														<a href="#" class="thumbnail"> 
														<c:choose>
    														<c:when test="${(res.faces[fn:length(res.faces)-s.index-1].face)!= null }">
															<img src="${pic }${(res.faces[fn:length(res.faces)-s.index-1].face) }.shtml" alt="${res.faces[fn:length(res.faces)-s.index-1]._id }" class="margin">
      														</c:when>
      														<c:when test="${(res.faces[fn:length(res.faces)-s.index-1].face) == null } 
      														&& ${(res.faces[fn:length(res.faces)-s.index-1].body)!= null }">
															<img src="${pic }${(res.faces[fn:length(res.faces)-s.index-1].body) }.shtml" alt="${res.faces[fn:length(res.faces)-s.index-1]._id }" class="margin">
      														</c:when>
    													</c:choose>
														</a>
													</div>
											
											</c:forEach>
											</div>
											</c:if>
											<c:if test="${fn:length(res.faces) < 5}">
											<div class="item active">
											<c:forEach items="${res.faces }" var="face"  varStatus="st">
												
												<input type=hidden name="ids" 
												value="${face._id }" />
												<div class="col-xs-6 col-md-2">
													<a href="#" class="thumbnail"> 
													<c:choose>
   														<c:when test="${face.face!= null }">
														<img src="${pic }${face.face }.shtml" alt="${face._id }" class="margin">
     														</c:when>
     														<c:when test="${face.face == null } && ${face.body!= null }">
														<img src="${pic }${face.body }.shtml" alt="${face._id }" class="margin">
     														</c:when>
   													</c:choose>
													</a>
												</div>
												
											</c:forEach>
											</div>
											</c:if>
										</div>
										
										<c:if test="${fn:length(res.faces) > 6}">
										<div>
											<!-- Controls -->
											<a class="left carousel-control" href="#carousel-example-generic" role="button" onclick="goPre('${mystatus.index }')"> 
												<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
												<span class="sr-only">Previous</span>
											</a> 
											<a class="right carousel-control" href="#carousel-example-generic" role="button" onclick="goNext('${mystatus.index }')" > 
												<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
												<span class="sr-only">Next</span>
											</a>
										</div>	
										</c:if>
										
									</div>
								</c:if>

							</div>
							
							<div class="timeline-footer btn-footer">
							<c:if test="${((res.mobiles)!= null && fn:length(res.mobiles) > 0) || ((res.mobiles)!= null && fn:length(res.mobiles) > 0) || ((res.faces)!= null && fn:length(res.faces) > 0)}">
								<!-- <a class="btn myButton  btn-primary" onclick="goDetaile(this)">查看详情</a> -->
								<button class="btn myButton  btn-primary my-btn " type="submit">查看详情</button>
							</c:if>
							</div>
							
						</form>
					</div>
					</li>
				<!-- END one row  -->

			</c:forEach>

			<li><i class="fa fa-clock-o bg-gray"></i></li>
		</ul>
	</div>
	<!-- /.col -->
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

<input type=hidden name="msgcounts" id="msgcounts" value="${total }" />

<label>总数${total }</label>

<!-- fenye -->
<div id="callBackPager"></div>
