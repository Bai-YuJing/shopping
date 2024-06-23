
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <title>首页</title>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script type="text/javascript" src="shopping/js/handlebars.min-v4.7.7.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>

    <script type="text/javascript">
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
    </script>
</head>

<body>
<%@include file="top.jsp"%>
<!-- 首页内容区域 -->
<div class="m-main">
    <div class="m-main-box m-home" id="j-homepage">
        <div class="ui-chat" id="j-chat">
            <div class="online chat" id="j-chat-online"></div>
            <div class="offline chat" id="j-chat-offline">
                <div class="tip"></div>
            </div>
        </div>

        <!--大Banner轮播区域 begin-->
        <div class="banner" id="j-banner">
            <div class="banner-item">
                <ul>



                    <li>
                        <a href='javascript:' alt='' style='cursor: default'
                           onfocus='this.blur()'><img
                                src="shopping/images/banner/banner1.png" alt=''
                                null/> </a>
                    </li>
                </ul>
            </div>
            <div class="banner-nav"></div>
        </div>
        <!--大Banner轮播区 end-->

        <!-- 菜单导航 -->
        <div class="nav">
            <div class="nav-menu clear-fix">
                <div class="menu-box clear-fix">
                    <a href="#">
                        <dl nameEn="">
                            <dt>
                                <img src="shopping/images/banner/phone.png"
                                     alt="手机"/>
                            </dt>
                            <dd class="font-weight">
                                手机
                            </dd>
                            <dd></dd>
                        </dl>
                    </a>
                    <a href="#">
                        <dl nameEn="">
                            <dt>
                                <img src="shopping/images/banner/youyanji.png"
                                     alt="抽烟油烟"/>
                            </dt>
                            <dd class="font-weight">
                                抽油烟机
                            </dd>
                            <dd></dd>
                        </dl>
                    </a>
                    <a href="#">
                        <dl nameEn="">
                            <dt>
                                <img src="shopping/images/banner/computer.png"
                                     alt="电脑"/>
                            </dt>
                            <dd class="font-weight">
                                电脑
                            </dd>
                            <dd></dd>
                        </dl>
                    </a>
                    <a href="#">
                        <dl nameEn="">
                            <dt>
                                <img src="shopping/images/banner/photo.png"
                                     alt="相机"/>
                            </dt>
                            <dd class="font-weight">
                                相机
                            </dd>
                            <dd></dd>
                        </dl>
                    </a>

                    <a href="#">
                        <dl nameEn="">
                            <dt>
                                <img src="shopping/images/banner/xiyiji.png"
                                     alt="洗衣机"/>
                            </dt>
                            <dd class="font-weight">
                                洗衣机
                            </dd>
                            <dd></dd>
                        </dl>
                    </a>
                    <a href="#">
                        <dl nameEn="All Menu">
                            <dt>
                                <div class="more"></div>
                            </dt>
                            <dd class="font-weight">
                                全部餐品
                            </dd>
                            <dd></dd>
                        </dl>
                    </a>

                </div>
                <a href="#">
                    <div class="coupon-left" id="j-combo">
                        <div class="title">
                            当季特选
                        </div>
                        <div class="desc font14">
                            &nbsp;
                        </div>
                    </div>
                </a>

                <a href="javascript:" style="cursor: default">
                    <div
                            class="coupon-right hidden" id="j-workday-lunch"
                            startTime="00:01" endTime="23:59">
                        <div class="title">
                            登录享更多优惠活动
                        </div>
                        <div class="desc font14">
                            &nbsp;
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="img-banner">
            <a href="#"> <img
                    src="shopping/images/banner/Banner_22_2017_08_28_14_34_03.jpg" alt=""/>
            </a>
        </div>
        <div class="img-banner">
            <a href="#"> <img
                    src="shopping/images/banner/Banner2.png" alt=""/>
            </a>
        </div>
        <!-- 下载区域 -->
        <div class="down_level" alt="下载必胜客全新App ">
            <div class="down_content">
                <div class="down-content-left">
                    <div class="down_title">
                        下载志刚购物APP
                    </div>
                    <div class="down-info-tip">
                        菠萝手机送到你家
                    </div>
                    <div class="down-info-tip">
                        志刚开着兰博基尼
                    </div>
                    <div class="down-info-tip">
                        250迈直到你家
                    </div>
                    <div class="down-info-tip">
                        志刚购物
                    </div>
                    <div class="down-info-tip">
                       购物网站中的战斗机
                    </div>
                </div>
                <div class="down-content-center">
                    <div class="down-iphone-content">
                        <a href="" target="_blank" class="down_ios">iOS下载</a>
                    </div>
                    <div class="down-android-content">
                        <a href="" target="_blank" class="down_ad">Android下载</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /菜单导航 -->
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
                           tppabs="https://www.4008123123.com/phhs_ios/Special.htm">优惠商品</a>
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
                    </li>
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


<!-- 购物车-->
<c:if test="${sessionScope.user != null}">
    <%@include file="cart.jsp" %>
</c:if>


</body>
</html>

