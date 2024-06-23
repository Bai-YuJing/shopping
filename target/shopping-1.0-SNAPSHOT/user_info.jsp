
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/address.css"/>
    <title>个人信息</title>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        function updateUser() {
            var userName = $.trim($("#userName").val());
            var userSex = $.trim($("#userSex").val());
            if (userName.length < 2 || userName.length >8) {
                layer.msg("姓名,长度2-7个字符")
            } else {
                $.post("UserServlet?m=updateUserNameandUserSex", {
                    "userName": userName,
                    "userSex": userSex
                }, function (data) {
                    console.log(data);
                    if (data == 1) {
                        //重新加载页面
                        top.location.reload()
                    } else {
                        layer.msg("姓名已被占用！！！")
                    }
                })
            }
        }

        function changCode() {
            $("#codeImg").attr("src", "CodeImgServlet?s=" + new Date());
        }

        function updateUserPassword() {
            var oldpassword = $.trim($("#oldpassword").val());
            var newpassword = $.trim($("#newpassword").val());
            var code = $.trim($("#code").val());
            if (oldpassword.length < 6 || oldpassword.length > 20) {
                layer.msg("旧密码,长度6-20个字符！！！")
            } else if (newpassword.length < 6 || newpassword.length > 20) {
                layer.msg("新密码,长度6-20个字符！！！")
            } else if (oldpassword == newpassword) {
                layer.msg("旧密码和新密码不能一样！！！")
            } else if (code.length != 4) {
                layer.msg("验证码不正确！！！")
            } else {
                $.post("UserServlet?m=updateUserPassword", {
                    "oldpassword": oldpassword,
                    "newpassword": newpassword,
                    "code": code
                }, function (data) {
                    console.log(data);
                    if (data == 0) {
                        //重新加载页面
                        layer.msg("验证码错误！！！")

                    } else if (data == 1) {
                        layer.msg("旧密码错误！！！")
                    } else {
                        top.location.href = "main.jsp"
                    }
                })
            }
        }

    </script>
</head>

<body>
<div class="m-address">
    <div class="wrapper">
        <div class="area" style="bottom:110px;">
            <div class="type border-bottom">
                <span class="left">个人信息</span>
            </div>
            <div class="title1 a-user">
                <div class="fl">
							<span><img src="shopping/images/member/desc-icon-name.png"/>
								姓名/性别</span>
                    <span class="pad">${user.userName} ${user.userSex=="M"?"先生":"女士"}</span>
                </div>
                <div class="fr">
                    <a href="#" class="login-redcolor" onclick="change('name_sex',1)">修改</a>
                </div>
            </div>
            <div style="display: none;" class="title1 a-user a-setuser change"
                 id="update_name_sex">
                <div class="fl userleft">
							<span><img src="shopping/images/member/desc-icon-name.png"/>
								姓名/性别</span>
                </div>
                <div class="text-input07" style="width: 155px">
                    <input id="userName" type="text" value="${user.userName}"/>
                </div>
                <div class="text-input07">
                    <select id="userSex" style="width: 110px;height: 34px;color: black;background: #f8f8f6">
                        <option selected value="M">先生</option>
                        <option value="F">女士</option>
                    </select>
                </div>
                <div class="act-botton clear">
                    <div class="save-button">
                        <a href="javascript:updateUser()" class="radius">保存</a>
                    </div>
                    <div class="cancel-button">
                        <a href="javascript:" class="radius"
                           onclick="change('name_sex',2)">取消</a>
                    </div>
                </div>
            </div>
            <div class="border-bottom"></div>
            <div class="title1 a-user">
                <div class="fl">
							<span><img src="shopping/images/member/desc-icon-phone.png"/>
								手机号码</span>
                    <span class="pad">${user.userTel}</span>
                </div>
            </div>
            <div class="border-bottom"></div>
            <div class="title1 a-user">
                <div class="fl">
                    <span><img src="shopping/images/login/icon-name.png"/> 登陆密码</span>
                    <input type="password" placeholder="******" style="border: none"
                           class="pad"/>
                    <span class="add-icon cursor"></span>
                </div>
                <div class="fr">
                    <a href="#" class="login-redcolor" onclick="change('pwd',1)">修改</a>
                </div>
            </div>
            <div style="display: none;" class="title1 a-user change" id="update_pwd">
                <div class="fl">
                    <span><img src="shopping/images/login/icon-name.png"/> 登陆密码</span>
                </div>
                <div class="fl">
                    <div class="text-input07">
                        <input id="oldpassword" type="text" placeholder="请输入旧密码"/>
                    </div>
                    <div class="fr">
                        <p style="line-height: 20px; margin-left: 10px">
                            请输入6-16位密码，可使用阿拉伯数字
                            <br/>
                            英文字母或两者结合
                        </p>
                    </div>
                    <br/>
                    <div class="text-input07">
                        <input id="newpassword" type="text" placeholder="请输入新密码"/>
                    </div>
                    <br/>
                    <div class="text-input07">
                        <input id="code" type="text" placeholder="请验证码"/>
                    </div>
                    <div class="fl">
                        &nbsp;<img id="codeImg" onclick="changCode()" src="CodeImgServlet" alt="验证码加载失败" WW/>
                        <p style="line-height: 30px; margin-left: 10px">
                            看不清？
                            <a href="javascript:changCode()" class="login-redcolor">换一张</a>
                        </p>
                    </div>

                </div>
                <div class="act-botton clear"
                     style="margin: 20px 0; padding: 20px 0">
                    <div class="save-button">
                        <a href="javascript:updateUserPassword()" class="radius">保存</a>
                    </div>
                    <div class="cancel-button">
                        <a href="javascript:" class="radius" onclick="change('pwd',2)">取消</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
</body>
</html>
<SCRIPT Language=VBScript><!--

//-->




</SCRIPT>