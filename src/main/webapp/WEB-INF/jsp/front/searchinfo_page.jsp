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

<style>
.my-div {
	position: absolute;
	width: 80%;
	height: 200px;
	left: 10%;
	top: 20%;
}
.my-label{left:26%;}
.my-btn{margin-bottom:10px;margin-left:10px;}
.btn-footer{text-align:right;}
.my-margin{margin-left:10px;}
</style>


			<!-- timeline time label -->

			<c:forEach items="${res}" var="res" varStatus="status">

				<!-- one row  开始循环-->
				<li class="time-label"><span class="bg-red"> <fmt:formatDate value="${res.date }" pattern="yyyy-MM-dd " /> </span></li>
				<!-- /.timeline-label -->


				<!-- timeline item -->
				<li><i class="fa fa-comments bg-blue"></i>

					<div class="timeline-item">
						<span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${res.date }" pattern="HH:mm:ss.S" /></span>
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
										<c:if
											test="${(res.identifications)!= null && fn:length(res.identifications) > 0}">
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
								<!-- <a class="btn myButton  btn-primary" onclick="goDetaile(this)">查看详情</a> -->
								<button class="btn myButton  btn-primary my-btn" type="submit">查看详情</button>
							</div>
						</form>
					</div>
					</li>
				<!-- END one row  -->

			</c:forEach>

			<li><i class="fa fa-clock-o bg-gray"></i></li>
		
<input type=hidden name="msgcounts" id="msgcounts" value="${total }" />
<input type=hidden name="activepage" id="activepage" value="${activepage }" />

