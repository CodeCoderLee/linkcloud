$(document).ready(function () {
	    /**
	     * 前端登陆验证
	     */
	    var message_tips = $("span[name='loginTips']"); // 获得提示文本对象
	    //用户登陆前端验证
	    var username_input = $("input[name='username']");
	    username_input.blur(function (event) {
	        checkUserName();
	    });
	    //用户名验证的方法
	    function checkUserName() {
	        var username = username_input.val();
	        if (username == "" || username == null) {
	            message_tips.html("用户名不能为空！");
	            message_tips.css("color","red");
	            return false;
	        }
	        return true;
	    }
	 
	    // 密码前端检测
	    var password_input = $("input[name='password']");
	    password_input.blur(function (event) {
	        checkPassword();
	    });
	    password_input.focus(function (event) {
	        message_tips.html("登录验证");
	        message_tips.css("color","black");
	    });
	 
	    //登陆的密码验证
	 
	    function checkPassword() {
	        var password = $("input[name='password']").val();
	        if (password == "" || password == null) {
	            message_tips.html("密码不能为空！");
	            message_tips.css("color","red");
	            return false;
	        }
	        return true;
	    }
	    //登陆按钮点击事件
	    $("form").submit(function () {
	        if (checkUserName() && checkPassword()){
	            $.ajax({
	                type: "post",
	                url: "../users/login",
	                data:{username:username_input.val(),password:password_input.val()},
	                async: true,
	                cache: false,
	                dataType: "json",
	                success: function (data) {
	                    if (data == false) {
	                        message_tips.html("用户名或密码错误！");
	                        message_tips.css("color","red");
	                        return false;
	                    } else {
	                    	message_tips.html("登录成功！正在跳转页面.......");
	                    	message_tips.css("color","green");
	                    	setTimeout(function () {
	                    		 window.location="../users/getUserList";
	                    	}, 1500); //页面刷新
	                    	return false;
	                    }
	                },
	                error: function (XMLHttpRequest, textStatus,errorThrown) {
	                    alert("error:::"+errorThrown);
	                    return false;
	                }
	            });
	          }
	        return false;
	    });
	});