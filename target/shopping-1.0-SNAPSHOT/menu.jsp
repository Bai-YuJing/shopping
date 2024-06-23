<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/menu.css"/>
    <title>全部商品</title>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script type="text/javascript" src="shopping/js/handlebars.min-v4.7.7.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="shopping/js/jquery.fly.min.js"></script>
    <!-- 兼容IE10 -->
    <script type="text/javascript" src="shopping/js/requestAnimationFrame.js"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".m-main li").click(function () {
                $(".m-main li").removeClass("on");
                $(this).addClass("on");
            });
        });

        //添加购物车动态效果
        function fly(t) {
            var cartLeft = $('#cart_image').offset().left - $(document).scrollTop(); // 获取a标签距离屏幕顶端的距离(因为fly插件的start开始位置是根据屏幕可视区域x，y来计算的，而不是根据整个文档的x，y来计算的)
            var cartTop = $('#cart_image').offset().top; // 获取a标签的y坐标


            var btnLeft = $(t).parent().find('img').offset().left - $(document).scrollTop() + 20;
            var btnTop = $(t).parent().find('img').offset().top + 20;

            var img = $(t).parent().find('img').attr('src');
            var flyer = $('<img class="u-flyer" src="' + img + '">');
            flyer.fly({
                start: {
                    left: btnLeft,
                    top: btnTop
                },
                end: {
                    left: cartLeft, //结束位置（必填）
                    top: cartTop, //结束位置（必填）
                    width: 0, //结束时宽度
                    height: 0 //结束时高度
                },
                onEnd: function () { //结束回调
                    console.log('加入成功！');
                    this.destory(); //移除dom

                }
            });
        }

        function checkMenu(t, pid) {
            var userId = $("#userId").val();

            if (userId != "") {
                $.get("CartServlet?m=addCart&productId=" + pid, function (data) {
                    if (data == 1) {
                        //特效
                        fly(t);
                        getCart();
                    } else {
                        layer.msg("添加失败，请稍后重试！！！");
                    }

                })


            } else {
                //引导登录
                show('', 550, 550, 'login.jsp');
            }
        }
    </script>

</head>
<body style="background: #efeee9;">
<input type="hidden" id="pageName" value="customerCenter"/>
<input type="hidden" id="morePrivilege" value="false"/>
<form id="j-main-form" action="">

    <%@include file="top.jsp" %>
    <div class="m-main">
        <div class="m-menu fl">
            <ul>
                <!-- 菜单 -->
                <li class="${p.categoryId == null?"on":""}">
                    <a href="MenuServlet?m=showMenu"> 当季特选</a>
                </li>
                <c:forEach items="${all}" var="a">

                    <li class="${p.categoryId == a.categoryId?"on":""}">
                        <a href="MenuServlet?m=showMenu&categoryId=${a.categoryId}"> ${a.categoryName}</a>
                    </li>
                </c:forEach>

                <!-- /菜单 -->
            </ul>
        </div>
        <div class="m-menu-content fr" style="position: relative; top: 70px">
            <!-- 产品列表 -->
            <div style="height: 450px; display: none;"></div>
            <div class="m-product-list">

                <c:forEach items="${products}" var="p">
                    <div class="product" condid="0" style="background: #FFF">
                        <div class="img cursor">
                            <img src="upload/${p.productPic}"/>
                        </div>
                        <div class="title">
                                ${p.productName}
                        </div>
                        <div class="desc grey">
                        </div>
                        <div class="order j-menu-order" onclick="checkMenu(this,'${p.productId}')">
                            <div class="start ui-bgbtn-green">
                                +
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <!-- /产品列表 -->

        </div>

    </div>
    <div class="mf-top" style="margin-top:30px;">

        <ul class="pagination" style="margin-left:600px;">
            <c:forEach begin="1" end="${pages}" var="pageNum" step="1">
                <li>
                    <a href="MenuServlet?m=showMenu&nowPage=${pageNum}"
                       class='${nowPage == pageNum?"active":""}'>${pageNum}</a>
                </li>
            </c:forEach>
        </ul>
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
                必胜客宅急送不同城市或不同餐厅的送餐菜单和价格有所不同。
                不同时段产品品项及价格有所不同。工作日特惠午餐及下午茶产品只在部分时段供应。详情以输入送餐地址后显示的实际供应的菜单为准。
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
                        <li>
                            <a href="#"
                               tppabs="#">合作招商</a>
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
