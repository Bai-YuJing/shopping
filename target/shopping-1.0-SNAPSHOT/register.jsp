
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <title>注册</title>

    <script type="text/javascript">
        var userSex = "M";
        function changeSex(s) {
            if(s == "M") {
                $("#M").addClass("login-redcolor");
                $("#F").removeClass("login-redcolor");
                userSex = "M";
            }else{
                $("#F").addClass("login-redcolor");
                $("#M").removeClass("login-redcolor");
                userSex = "F";
            }

        }

        function register() {
            var userTel = $.trim($("#userTel").val());
            var userPwd = $.trim($("#userPwd").val());
            var userName = $.trim($("#userName").val());

         if(userPwd.length < 6 || userPwd.length > 20){
                layer.msg("密码，长度6-16字符");
            }else if(userName.length < 3 || userName.length > 5){
                layer.msg("姓名，长度3-5字符");
            }else {
                //非脏数据
                $.post("UserServlet?m=register", {"userTel": userTel, "userPwd": userPwd,"userName":userName,"userSex":userSex}, function (data) {
                    console.log(data);
                    if(data == 1){
                        //父类页面重新加载
                        top.location.reload();
                    }else{
                        layer.msg("手机号被占用");
                    }
                })
            }
        }
    </script>
</head>

<body>

<!--register begin-->
<div class="m-login">
    <div class="login-logo"><img src="shopping/images/common/jd.png" /></div>
    <div class="login-title border-bot">欢迎注册加入会员中心</div>
    <div class="input-box  border-bot"><img src="shopping/images/login/icon-user.png" /><input type="text" id="userTel" placeholder="请输入账号"  class="input-box1"/></div>

    <div class="input-box  border-bot"><img src="shopping/images/login/icon-password.png" /><input type="password" id="userPwd" placeholder="密码，长度6-16字符"  class="input-box1" /></div>
    <div class="input-box  border-bot"><img src="shopping/images/login/icon-name.png" /><input type="text" id="userName" placeholder="姓名，最多5个字" /> <span><a href="#" id="M" onclick="changeSex('M')" class="login-redcolor">先生</a> | <a href="#" style="margin:0" id="F" onclick="changeSex('F')">女士</a></span></div>
    <div class="input-box "></div>
    <div class="login-me cursor" onclick="register()"><button class="cursor">立即注册</button></div>
</div>
<!--register end-->
</body>
</html>
