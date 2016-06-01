$(function () {
	onLoadUrl();
	$('#closeBtn').click(function () {
		$("#content").load(rootPath + "/role/list.shtml");
	});
	$('#form').validate({
		submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
			$(form).ajaxSubmit({
				type: "post",
				dataType: "json",
				success: function (data) {
					notify('success', '     角色修改成功      ');
					$("#content").load(rootPath + "/role/list.shtml");
				},
				error: function (XMLResponse) {
					alert(XMLResponse.responseText);
				}
			});
		},
		rules: {
			"name": {
				required: true,
				rangelength: [3, 10]
			}
		},
		messages: {
			"name": {
				required: "请输入角色名称",
				rangelength: "帐号长度为3~10个字符"
			}
		},
		errorPlacement: function (error, element) {// 自定义提示错误位置
			$(".alert-danger").removeClass("hidden");
			$(".alert-danger").html(error.html());
		},
		success: function (label) {// 验证通过后
			$(".alert-danger").addClass("hidden");
		}
	});
});

