
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
    <title>登录</title>

</head>

<body>

<!--login begin-->
<div class="m-login">
    <div class="login-logo"><img src="shopping/images/common/jd.png"/></div>
    <div class="login-title border-bot login-redcolor" style="font-weight:normal">账号密码登陆</div>
    <div class="input-box  border-bot"><img src="shopping/images/login/icon-user.png"/><input type="text" id="tel"
                                                                                                placeholder="请输入账号"
                                                                                                class="input-box1"/>
    </div>
    <div class="input-box  border-bot"><img src="shopping/images/login/icon-password.png"/><input type="password" id="pwd"
                                                                                                   placeholder="密码，长度6-16字符"
                                                                                                   class="input-box1"/>
    </div>
    <div class="input-box" style="text-align:left"><a href="register.jsp" class="login-redcolor"
                                                      style="text-decoration:underline; font-size:18px">快速注册</a></div>
    <div class="input-box "></div>
    <div class="login-me cursor" onclick="login()">
        <button class="cursor">登陆</button>
    </div>
</div>
<!--login end-->


<script type="text/javascript">
    function login() {
        var tel = $.trim($("#tel").val());
        var pwd = $.trim($("#pwd").val());

        if (pwd.length < 6 || pwd.length > 20) {
            alert("请输入密码6-20位");
        } else {
            //非脏数据
            $.post("UserServlet?m=login", {"userTel": tel, "userPwd": pwd}, function (data) {
                console.log(data);
                if (data == 1) {
                    // 登录特效
                    layer.msg("管理员用户登录成功", {icon: 1, time: 1000}, function () {
                        window.location.href="member.jsp";
                        top.location.reload();
                    })
                    // alert("登录成功！！")
                    // 父类页面重新加载
                    // top.location.reload();
                } else if (data == 2) {
                    layer.msg("该用户已被停用",{icon:2,time:1000});
                } else if(data==3){
                    layer.msg("普通用户登录成功", {icon: 1, time: 1000}, function () {
                       top.window.location="memberPT.jsp";
                    })
                }else {
                    layer.msg("用户或者密码错误",{icon:7,time:1000});
                }
            })
        }
    }
</script>
</body>

</html>
