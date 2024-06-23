
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/menu.css"/>
    <title>用户管理</title>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        function update(id, type) {
            var msg;
            if (type == 'Y') {
                msg = "停用"
            } else {
                msg = "启用"
            }
            $.post("UserServlet?m=updateUserStatus", {
                "id": id,
                "type": type
            }, layer.confirm('确定要' + msg + '吗？', {
                    btn: ['确定', '取消'] //按钮
                },
                function (data) {
                    if (data == 1) {
                        location.reload()
                        layer.msg(msg + '成功');
                    } else {
                        location.reload()
                        layer.msg(msg + '成功');
                    }

                }));

        }

        function fn() {
            var a = true;
            var tel_test = /^1[3|4|5|6|7|8|9][0-9]\d{8}$/;
            var userTel = $.trim($("#userTel").val());
            var userName = $.trim($("#userName").val());
         else if (userName.length > 8) {
                a=false;
                layer.msg("请输入有效0-7位用户名")
            }
            return a;
        }
    </script>
</head>
<body>
<div class="m-main">
    <div class="m-food">

        <div class="mf-top border-t">
            <form action="UserServlet?m=selectAll" method="post" onsubmit="return fn()">
                <div class="fl">用户管理</div>
                <div class="fr"><input type="date" name="addTime" value="${u.addTime}" placeholder="注册时间-始"
                                       style="width:125px;"/>-<input
                        value="${u.addTimeEnd}" name="addTimeEnd" type="date"
                        placeholder="注册时间-终"
                        style="width:125px;"/>
                    <input type="text" name="userTel" id="userTel${u.userId}" value="${u.userTel}" placeholder="账号"/>
                    <input type="text" name="userName" id="userName${u.userId}" value="${u.userName}"
                           placeholder="用户名"/>
                    <button type="submit">查询</button>
                </div>
            </form>
        </div>


        <c:forEach items="${users}" var="user">
            <div class="mf-menu border-t">
                <div class="fl">
                    <span class="m-wt1"></span>
                    <span>${user.userTel}</span>
                    <span>${user.userName}</span>
                    <span>${user.userSex == "M"?"男":"女"}</span>
                    <span>${user.addTime}</span>
                </div>
                <div class="fr">
                    <button class=${user.userStatus=="Y"?"shangjia":"xiajia"}
                                    onclick="update(${user.userId},'${user.userStatus}')">${user.userStatus=="Y"?"禁用":"启用"}
                    </button>
                </div>
            </div>
        </c:forEach>


        <div class="mf-top" style="margin-top:30px">

            <ul class="pagination" style="margin-left:250px">
                <c:forEach begin="1" end="${pages}" var="pageNum" step="1">
                    <li>
                        <a href="UserServlet?m=selectAll&nowPage=${pageNum}&addTime=${u.addTime}&addTimeEnd=${u.addTimeEnd}&userTel=${u.userTel}&userName=${u.userName}"
                           class='${nowPage == pageNum?"active":""}'>${pageNum}</a></li>
                </c:forEach>
            </ul>
        </div>

    </div>
</div>
</body>
</html>