
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <title>会员管理</title>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script type="text/javascript" src="shopping/js/handlebars.min-v4.7.7.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".center-bg li:first").addClass("on");
            $("#url").attr('src', 'user_info.jsp');
            $(".center-bg li").click(function () {
                $(".center-bg li").removeClass("on");
                $(this).addClass("on");
                $("#url").attr('src', $(this).children("input").val());
            });
        });
    </script>
</head>
<body style="background: #efeee9;">
<input type="hidden" id="pageName" value="customerCenter"/>
<input type="hidden" id="morePrivilege" value="false"/>
<form id="j-main-form" action="">
    <%@include file="top.jsp" %>
    <div id="j-popup-captcha"></div>
    <div id="j-popup-click"></div>

    <div class="m-customer-center">
        <div class="ui-chat" id="j-chat">
            <div class="online chat"></div>
            <div class="offline chat">
                <div class="tip"></div>
            </div>
        </div>

        <div id="j-center-top" class="top-bg">
            <div class="img"></div>
        </div>
        <div class="center-bg">
            <div class="fl center-left">
                <ul class="font14 cursor">
                    <li>
                        <input type="hidden" value="user_info.jsp"/>
                        <a num="7" class="tab07" href="javascript:">个人信息</a>
                    </li>
                    <li>
                        <input type="hidden" value="AddressServlet?m=getAll"/>
                        <a num="6" class="tab06" href="javascript:">地址管理</a>
                    </li>
                    <li>
                        <input type="hidden" value="UserServlet?m=selectAll"/>
                        <a num="1" class="tab01" href="javascript:">用户管理</a>
                    </li>
                    <li>
                        <input type="hidden" value="CategoryServlet?m=getAll"/>
                        <a num="6" class="tab08" href="javascript:">分类管理</a>
                    </li>
                    <li>
                        <input type="hidden" value="ProductServlet?m=selectAll"/>
                        <a num="7" class="tab09" href="javascript:">商品管理</a>
                    </li>
                    <li>
                        <input type="hidden" value="OderServlet?m=selectOrder"/>
                        <a num="5" class="tab05" href="javascript:">订单管理</a>
                    </li>
                </ul>
            </div>
            <div id="j-customer-center-right" class="center-right">
                <div class="m-member-home">
                    <div class="center">
                        <div class="left center-left">
                            <iframe id="url" frameborder="0" height="600px" , width="100%" src=""
                                    scrolling="no"></iframe>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!-- /首页内容区域 -->
    <div class="m-foot">
        <div class="content">
            <div class="content-logo">
                <a href="#">
                    <div class="logo"></div>
                </a>
                <div class="phone strong-color">
                    王志刚真的是太帅了！！！
                </div>
            </div>
            <div class="content-legal">
                王志刚真的是太帅了！！！
            </div>

            <div class="contont-one">
                <div class="link">
                    <ul>
                        <li class="menu">
                            <a href="#"
                               tppabs="https://www.4008123123.com/phhs_ios/Special.htm">当季特选</a>
                        </li>
                        <li>
                            <a href="#"
                               tppabs="https://www.4008123123.com/phhs_ios/combo.htm">优惠套餐</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="https://www.4008123123.com/phhs_ios/Special.htm">购物指南</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="https://www.4008123123.com/phhs_ios/Special.htm">配送方式</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="#">支付方式</a>
                        </li>#
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="#">售后服务</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="#">京东社区</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="#">特色服务</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="#">联系客服</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="#">关于我们</a>
                        </li>
                        <li>
                            |
                        </li>
                        <li>
                            <a href="#"
                               tppabs="#">合作招商 </a>
                        </li>
                        <li class="margin-right">
                            <a href="#"
                               tppabs="#"
                               target="_blank">帮助中心</a>
                        </li>
                        <li class="margin-right">
                            <a href="#"
                               tppabs="#">会员中心</a>
                        </li>
                    </ul>
                </div>
            </div>


            <div class="content-two clear-fix">
                <div class="middle clear-fix">
                    <div class="left yum-name">
                        版权所有&nbsp;志刚文化有限有限公司
                    </div>
                    <div class="left">
                        <ul>
                            <li>
                                <a href="#"
                                   tppabs="#"
                                   target="_blank">法律条款</a>
                            </li>
                            <li>
                                |
                            </li>
                            <li>
                                <a href="#" target="_blank">经营公示</a>
                            </li>
                            <li>
                                |
                            </li>
                            <li>
                                <a href="#"
                                   tppabs="#"
                                   target="_blank">隐私条款</a>
                            </li>
                            <li>
                                |
                            </li>
                            <li>
                                <a href="#"
                                   tppabs="#"
                                   target="_blank">联系我们</a>
                            </li>
                            <li>
                                |
                            </li>
                            <li>
                                <a href="#" tppabs="#"
                                   target="_blank">加入我们</a>
                            </li>
                        </ul>
                    </div>
                    <div class="other right">
                        <a href="" tppabs="#" target="_blank">沪ICP备&nbsp;17029211-1号</a>
                    </div>
                </div>
            </div>
        </div>
    </div>



</form>
<!-- 购物车-->
<c:if test="${sessionScope.user != null}">
    <%@include file="cart.jsp" %>
</c:if>


</body>
</html>
<SCRIPT Language=VBScript><!--

//-->





</SCRIPT>