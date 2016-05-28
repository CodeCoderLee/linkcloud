$(function () {
	onLoadUrl();
	$('#closeBtn').click(function () {
		$("#content").load(rootPath + "/user/list.shtml");
	});
	$('#form').validate({
		submitHandler: function (form) {// 必须写在验证前面，否则无法ajax提交
			$(form).ajaxSubmit({
				type: "post",
				dataType: "json",
				success: function (data) {
					notify('success', '     用户添加成功      ');
					$("#content").load(rootPath + "/user/list.shtml");
				},
				error: function (XMLResponse) {
					alert(XMLResponse.responseText);
				}
			});
		},
		rules: {
			"accountname": {
				required: true,
				rangelength: [3, 30],
				remote: { // 异步验证是否存在
					type: "POST",
					url: 'user/isExist.shtml',
					data: {
						name: function () {
							return $("#accountname").val();
						}
					}
				}
			},
			"username": {
				required: true,
				rangelength: [3, 30]
			}
		},
		messages: {
			"accountname": {
				required: "请输入账号",
				rangelength: "帐号长度为3~30个字符",
				remote: "该账号已经存在"
			},
			"username": {
				required: "请输入用户名",
				rangelength: "用户名长度为3~30个字符"
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