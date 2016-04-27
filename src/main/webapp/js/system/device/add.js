$(function() {
	$("form").validate({
		rules : {
			"deviceType" : {
				required : true,
				remote : { // 异步验证是否存在
					type : "POST",
					url : 'isExist.shtml',
					data : {
						name : function() {
							return $("#deviceType").val();
						}
					}
				}
			}
		},
		messages : {
			"deviceType" : {
				required : "请选择设备类型",
				remote : "该设备已经存在"
			}
		},
		errorPlacement : function(error, element) {// 自定义提示错误位置
			$(".l_err").css('display', 'block');
			$(".l_err").html(error.html());
		},
		success : function(label) {// 验证通过后,提交表单
			$(".l_err").css('display', 'none');
			addDevice();
		}
	});

});

function addDevice() {
	ly.ajaxSubmit(form, {// 验证新增是否成功
		type : "post",
		dataType : "json",
		beforeSubmit: function(){
			var top = $("#addtopli");
			top.html(CommnUtil.loadingImg());
		},
		success : function(data) {
			if (data == "success") {
				layer.alert('添加成功,是否关闭窗口?', function(index) {
					// TODO 提交成功后，update dom
					parent.reload();
					parent.layer.close(parent.pageii);
					return false;
				});
				$("#form")[0].reset();
			} else {
				layer.alert('添加失败,请联系后台管理员?', function(index) {
					// TODO 提交成功后，update dom
					parent.layer.close(parent.pageii);
				});
			}
		}
	})
}


