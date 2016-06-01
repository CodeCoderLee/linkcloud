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
					notify('success', '     角色添加成功      ');
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
				required: "请输入角色名",
				rangelength: "角色名由3至10位字符组合构成",
				remote: "该账号已经存在"
			},

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
