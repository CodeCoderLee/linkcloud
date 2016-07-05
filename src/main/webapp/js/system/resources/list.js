var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		}, {
			colkey : "name",
			name : "菜单名称",
			align : 'left'
		}, {
			colkey : "type",
			name : "菜单类型",
			width : "70px",
		}, {
			colkey : "resKey",
			name : "唯一KEY"
		}, {
			colkey : "resUrl",
			name : "URL地址"
		},{
			colkey : "ishide",
			name : "是否隐藏",
			renderData : function(rowindex, data, rowdata, column) {
				if(data=="0"){
					return "否";
				}else if(data=="1"){
					return "是";
				}
			}
		}, {
			colkey : "description",
			width : "100px",
			name : "描述"
		} ],
		jsonUrl : rootPath + '/resources/treelists.shtml',
		checkbox : true,
		usePage : false,
		records : "treelists",
		treeGrid : {
			type:1,
			tree : true,
			name : 'name',
			id: "id",
			pid: "parentId"
		}
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();
		grid.setOptions({
			data : searchParams
		});
	});
	$("#newBtn").click("click", function() {
		addFun();
	});
	$("#modifyBtn").click("click", function() {
		editFun();
	});
	$("#deleteBtn").click("click", function() {
		delFun();
	});
	$("#lyGridUp").click("click", function() {// 上移
		var jsonUrl=rootPath + '/background/resources/sortUpdate.shtml';
		grid.lyGridUp(jsonUrl);
	});
	$("#lyGridDown").click("click", function() {// 下移
		var jsonUrl=rootPath + '/background/resources/sortUpdate.shtml';
		grid.lyGridDown(jsonUrl);
	});
});
function editFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		notify("success", "只能选中一个");
		return;
	}
	$("#content").load("resources/modifyUI.shtml?id="+cbox);
}
function addFun() {
	$("#content").load("resources/addUI.shtml");
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		notify("success", "请选择删除项");
		return;
	}
	if(window.confirm("确认删除?")){
		$.ajax({
			url: rootPath + '/resources/deleteEntity.shtml',
			data: {ids: cbox.join(",")},
			type: "post",
			success: function (data) {
				notify("success", "删除成功");
				$("#content").load(rootPath + "/resources/list.shtml");
			},
			error: function () {
				notify("success", "删除失败");
				$("#content").load(rootPath + "/resources/list.shtml");
			}

		});
	}
}
