
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>

    /**
     * check用户是否登录
     * @param t
     */
    function checkUser(t) {
        var userId = $("#userId").val();

        if (t == 1) {
            //会员中心
            if (userId != "" && userId=="1") {
                location.href = "member.jsp";

            } else if(userId != "" && userId!="1"){
                location.href = "memberPT.jsp";
            }else {
                show('', 550, 550, 'login.jsp');
            }
        } else {
            //立即点餐
            if (userId != "") {
                location.href = "MenuServlet?m=showMenu";

            } else {
                show('', 550, 550, 'login.jsp');
            }
        }

    }

    function changeMenu() {
        $("#menu").toggle();
    }

    function out() {
        layer.confirm('确认退出吗？', {
            btn: ['确认', '取消'] //按钮
        }, function () {
            location.href = "UserServlet?m=out";
        }, function () {

        });
    }
    function pt() {
        var userI = $("#userId").val();
            //会员中心
            if (userI != "" && userI=="1") {
                location.href = "member.jsp";
            } else{
                location.href = "memberPT.jsp";
            }

    }
</script>
<div class="m-top">
    <input type="hidden" id="userId" value="${user.userId}">
    <div class="box" id="j-top-nav">
        <a href="main.jsp">
            <div class="logo fl"></div>
        </a>
        <a href="MenuServlet?m=showMenu">
            <div class="menu fl" style="width:100px">
               商品列表
            </div>
        </a>
        <div class="separator fl"></div>
        <a href="javascript:checkUser(1)">
            <div class="menu fl" style="width:100px">
                管理中心
            </div>
        </a>
        <input type="hidden" id="j-is-login" value="false"/>
        <div class="clien fl">
            <a href="#" class="menu" onclick="changeMenu()">${user.userName}</a>
            <dl style="display: none; background-color: white;" id="menu"> <!-- 二级菜单 -->
                <dd><a id="userI" value="${user.userId}" onclick="pt()">个人信息</a></dd>
                <dd><a href="javascript:out()">安全退出</a></dd>
            </dl>
        </div>

        <div class="start fr" id="j-start-order"
             onclick="checkUser(2)">
            前去购物
        </div>

        <input type="hidden" id="isMemberLogin" value=""/>
        <input type="hidden" id="isNewLogin" value=""/>
        <input type="hidden" id="j-is-index" value="true"/>
        <input type="hidden" id="j-has-order" value="false"/>
        <input type="hidden" id="j-order-type" name="orderType" value="null"/>
        <input type="hidden" id="j-defaultClassHtmlName" value="Special.htm"/>
        <input type="hidden" id="j-username-afterlogin" value=""/>

    </div>
</div>