var pageii = null;
function reload(){
	this.layer.close();
	var tb = $("#loadhtml");
	tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/device/list.shtml");
}

function addDevice() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", '30%' ],
		content : rootPath + '/device/addUI.shtml'
	});
}

function editDevice(object) {
	var edit = $(object).val();
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : ["600px","auto"],
		offset:"200px",
		content : rootPath + '/device/editUI.shtml?id=' + edit
	});
}

function delDevice(object) {
	var del = $(object).val();
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/device/deleteEntity.shtml?id=' + del;
		var s = CommnUtil.ajax(url,del,"json");
		if (s == "success") {
			layer.msg('删除成功');
			reload();
		} else {
			layer.msg('删除失败');
		}
	});
}


// function delDevice() {
//	var cbox = document.getElementsByName("deviceSelect");
//	var cval=[];
//	var j = 0;
//	if(cbox.length > 0){
//		for(var i=0;i<cbox.length;i++){
//			if (cbox[i].checked == true) {
//				cval[j] = cbox[i].value;
//				j++;
//			}
//		}
//	}else if(cbox.length == 0){
//		layer.msg("无可删除项！！");
//		return;
//	}
//	if(cval == ""){
//		layer.msg("请选择删除项！！");
//		return;
//	} else {
//		layer.confirm('是否删除？', function(index) {
//			var url = rootPath + '/device/deleteEntity.shtml';
//			var s = CommnUtil.ajax(url, {
//				ids : cval.join(",")
//			}, "json");
//			if (s == "success") {
//				layer.msg('删除成功');
//				reload();
//			} else {
//				layer.msg('删除失败');
//			}
//		});
//	}
//}