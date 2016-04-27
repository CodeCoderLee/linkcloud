<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="base" value="${pageContext.request.contextPath}" />
<c:set var="basedir" value="/frontpage" />
<c:set var="ctx" value="${base}${basedir}" />
<c:set var="pic" value="${base}/front/pic/" />
<c:set var="serverIP" value="${serverIP}" />
<c:set var="maxTableRows" value="${realtimelimit}" />

<script type="text/javascript">
var rootPath = '${base}';
</script>
<script type="text/javascript" src="${ctx}/js/web_socket.js"></script>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
	function dateToString(date) {
		return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " 
				+ date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
	}
	
	$(function() {
		console.log("111112");
		var address = 'ws://${serverIP}:18887';
		//var address = 'ws://localhost:18887';
		console.log(address);
		var ws = new WebSocket(address);
		ws.onopen = function() {
			console.log("onopen");
		};
		  
		ws.onmessage = function(e) {
			// Receives a message.
		    console.log('message', e.data); 
			var str = e.data;
			if (!str)
				return;
			var array = $.parseJSON(str);
			if (array instanceof Array) {
				for (var i = 0; i < array.length; ++i) {
					var obj = array[i];
					if (!(obj instanceof Object))
						continue;
					
					var messageType = obj["message_type"];
					var $mobileTable = null, $trHead = null, $newTr = null;
					if (messageType === 1) {
						$mobileTable = $("#mobile_table");
						$trHead = $("#mobile_table tr.success");
						
						var timestamp = obj["date"], imei = obj["imei"], location = obj["location"]
						var id = obj["id"], imsi = obj["imsi"];
						
						$newTr = $("<tr></tr>");
						$newTr.append($("<td>" + imei + "</td>"));
						$newTr.append($("<td>" + imsi + "</td>"));
						
						var date = new Date();
						date.setTime(timestamp);
						$newTr.append($("<td>" + date.format("yyyy-MM-dd hh:mm:ss") + "</td>"));
					}
					else if (messageType === 2) {
						$mobileTable = $("#identity_table");
						$trHead = $("#identity_table tr.success");
						
						var uid = obj["uid"], name = obj["name"], gender = obj["gender"], birthday = obj["birthday"];
						var location = obj["location"], expireDate = obj["expDate"], date = obj["date"];
						
						$newTr = $("<tr></tr>");
						$newTr.append($("<td>" + uid + "</td>"));
						$newTr.append($("<td>" + name + "</td>"));
						$newTr.append($("<td>" + gender + "</td>"));
						$newTr.append($("<td>" + birthday + "</td>"));
						$newTr.append($("<td>" + location + "</td>"));
						$newTr.append($("<td>" + expireDate + "</td>"));
						$newTr.append($("<td>" + date + "</td>"));
					}
					else if (messageType === 3) {
						$mobileTable = $("#face_table");
						$trHead = $("#face_table tr.success");
						
						var face = obj["face"], body = obj["body"], age = obj["age"], gender = obj["gender"];
						var height = obj["height"], fat = obj["fat"], timestamp = obj["date"];
						var faceUrl = "", bodyUrl = "";
						if (typeof(face) == "string") {
							var pos1 = face.lastIndexOf("/"), pos2 = face.lastIndexOf(".");
							if (pos1 >= 0 && pos2 >= 0 && pos1 + 1 < pos2)
								faceUrl = "/anshao/front/pic/" + face.substring(pos1 + 1, pos2) + ".shtml";
						}
						if (faceUrl.length == 0)
							faceUrl = "/anshao/front/pic/urlerror_face.shtml";
						
						if (typeof(body) == "string") {
							var pos1 = body.lastIndexOf("/"), pos2 = body.lastIndexOf(".");
							if (pos1 >= 0 && pos2 >= 0 && pos1 + 1 < pos2)
								bodyUrl = "/anshao/front/pic/" + body.substring(pos1 + 1, pos2) + ".shtml";
						}
						if (bodyUrl.length == 0)
							bodyUrl = "/anshao/front/pic/urlerror_body.shtml";
						
						$newTr = $("<tr></tr>");
						var $faceThumbnail = $("<a href='#' class='thumbnail'></a>").append("<img src='" + faceUrl + "' alt='脸部照片' class='margin' />");
						var $faceImage = $("<div class='col-xs-6 col-md-6'></div>").append($faceThumbnail);
						$newTr.append($("<td></td>").append($faceImage));
						
						var $bodyThumbnail = $("<a href='#' class='thumbnail'></a>").append("<img src='" + bodyUrl + "' alt='全身照片' class='margin' />");
						var $bodyImage = $("<div class='col-xs-6 col-md-6'></div>").append($bodyThumbnail);
						$newTr.append($("<td></td>").append($bodyImage));
			
						$newTr.append($("<td>" + age + "</td>"));
						$newTr.append($("<td>" + gender + "</td>"));
						$newTr.append($("<td>" + height + "</td>"));
						$newTr.append($("<td>" + fat + "</td>"));
						
						var date = new Date();
						date.setTime(timestamp);
						$newTr.append($("<td>" + date.format("yyyy-MM-dd hh:mm:ss") + "</td>"));
					}
					else if (messageType === 4) {
						$mobileTable = $("#wifi_table");
						$trHead = $("#wifi_table tr.success");
						
						var mac = obj["mac"], timestamp = obj["date"];
						
						$newTr = $("<tr></tr>");
						$newTr.append($("<td>" + mac + "</td>"));
						
						var date = new Date();
						date.setTime(timestamp);
						$newTr.append($("<td>" + date.format("yyyy-MM-dd hh:mm:ss") + "</td>"));
					}
					
					if ($newTr == null)
						continue;
					
					if ($trHead)
						$trHead.after($newTr);
					else if ($mobileTable)
						$mobileTable.prepend($newTr);
				}
			}
			
			var selectors = ["#mobile_table tr:not(.success)", "#identity_table tr:not(.success)", "#face_table tr:not(.success)", "#wifi_table tr:not(.success)"];
			var maxRows = ${maxTableRows};
			if (maxRows < 0)
				maxRows = 3;
			
			for (var i = 0; i < selectors.length; ++i) {
				var trs = $(selectors[i]);
				for (var j = trs.length - 1; j >= maxRows; --j)
					trs[j].remove();
			}
		};
		  
		ws.onclose = function() {
		}
	});
</script>

				<c:if test="${mobile_start}">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">	
						<div class="box">
							<div class="box-header">
							  <h2 class="box-title"><i class="fa fa-mobile-phone fa-fw"></i><strong>电子设备实时数据</strong></h2>
							 <div class="box-tools">
							 <ul class="pagination pagination-sm no-margin pull-right">
									<li>
									<i class="fa  fa-clock-o"></i>
									<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss.S" />
									</li>
								</ul>
							 </div>
							 
							</div>
							
							<!-- /.box-header -->
							<div class="box-body no-padding">
							  <table class="table table-striped" id="mobile_table">
								<tr class="success">
								  <th>IMEI</th>
								  <th>IMSI</th>
								  <th>采集时间</th>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								
								</tr>
							  </table>
							</div>
							<!-- /.box-body -->
						  </div>
						  <!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				</c:if>
				
				<c:if test="${ident_start }">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">	
						<div class="box">
							<div class="box-header">
							  <h2 class="box-title"><i class="fa fa-credit-card fa-fw"></i><strong>身份证信息采集</strong></h2>
							  <div class="box-tools">
								<ul class="pagination pagination-sm no-margin pull-right">
									<li>
									<i class="fa  fa-clock-o"></i>
									<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss.S" />
									</li>
								</ul>
							 </div>
							</div>
							
							<!-- /.box-header -->
							<div class="box-body no-padding">
							  <table class="table table-striped" id="identity_table">
								<tr class="success">
								  <th>身份证号</th>
								  <th>姓名</th>
								  <th>性别</th>
								  <th>出生年月日</th>
								  <th>户口所在地</th>
								  <th >有效期限</th>
								  <th><i class="fa  fa-clock-o"></i>&nbsp; 采集时间</th>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								</tr>
							  </table>
							</div>
							<!-- /.box-body -->
						  </div>
						  <!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				</c:if>
				
				<c:if test="${face_start}">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">	
						<div class="box">
							<div class="box-header">
							  <h2 class="box-title"><i class="fa fa-file-image-o fa-fw"></i><strong>人脸照片信息采集</strong></h2>
							 <div class="box-tools">
							 <ul class="pagination pagination-sm no-margin pull-right">
							 	<li>
									<i class="fa  fa-clock-o"></i>
									<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss.S" />
								</li>
							</ul>
							 </div>
							 
							</div>
							
							<!-- /.box-header -->
							<div class="box-body no-padding">
							  <table class="table table-striped" id="face_table">
								<tr class="success">
								  <th style="width:300px">face</th>
								  <th style="width:300px">body</th>
								  <th>age </th>
								  <th>gender </th>
								  <th>height </th>
								  <th>fat </th>
								  <th>date </th>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								  <td></td>
								</tr>
							  </table>
							</div>
							<!-- /.box-body -->
						  </div>
						  <!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				</c:if>
				
				<c:if test="${wifi_start }">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">	
						<div class="box">
							<div class="box-header">
							  <h2 class="box-title"><i class="fa  fa-wifi fa-fw"></i><strong>无线WIFI实时数据</strong></h2>
							 <div class="box-tools">
							 <ul class="pagination pagination-sm no-margin pull-right">
									<li>
									<i class="fa  fa-clock-o"></i>
									<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss.S" />
									</li>
								</ul>
							 </div>
							 
							</div>
							
							<!-- /.box-header -->
							<div class="box-body no-padding">
							  <table class="table table-striped" id="wifi_table">
								<tr class="success">
								  <th>MAC地址</th>
								  <th>采集时间</th>
								</tr>
								<tr>
								  <td></td>
								  <td></td>
								</tr>
							  </table>
							</div>
							<!-- /.box-body -->
						  </div>
						  <!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				</c:if>
				
				
			