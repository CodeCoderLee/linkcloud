$(function() {
	parent.layer.iframeAuto(parent.pageii);
	$("form").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",//ajaxSubmi带有文件上传的。不需要设置json
				beforeSubmit: function(){
					var top = $("#edittopli");
					top.html(CommnUtil.loadingImg());
				},
				success : function(data) {
					if (data == "success") {
						layer.alert('更新成功!是否关闭窗口?', function(index) {
							parent.reload();
							parent.layer.close(parent.pageii);
							return false;
						});
					} else {
						layer.alert('更新失败，请联系后台管理员', function(index) {
							parent.layer.close(parent.pageii);
						});
					}
				}
			});
		},
		errorPlacement : function(error, element) {// 自定义提示错误位置
			$(".l_err").css('display', 'block');
			// element.css('border','3px solid #FFCCCC');
			$(".l_err").html(error.html());
		},
		success : function(label) {// 验证通过后
			$(".l_err").css('display', 'none');
		}
	});
});



