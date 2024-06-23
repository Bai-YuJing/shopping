
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/menu.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/address.css"/>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <title>地址</title>
    <script type="text/javascript">
        function addOrder() {
            // 获取地址
            var address = $("#address").val();
            location.href = "OderServlet?m=addOrder&amp;address=" + address;

        }
        function addAddres() {
            var addressProvince = $("#addressProvince").val();
            var addressCity = $("#addressCity").val()
            var addressDistrict = $("#addressDistrict").val();
            var addressDescribe = $("#addressDescribe").val();
            console.log(addressProvince + "" + addressCity + "" + addressDescribe + "" + addressDistrict)
            if (addressDescribe.length > 8) {
                layer.msg("请输入描述0-7个字符！！！")
            } else {
                $.post("OderServlet?m=addaddres", {
                    "addressProvince": addressProvince,
                    "addressCity": addressCity,
                    "addressDistrict": addressDistrict,
                    "addressDescribe": addressDescribe
                }, function (data) {
                    if (data == 1) {
                        layer.msg("新增成功!!!");
                        location.reload();
                    } else {
                        layer.msg("当前地址已存在!!!")
                    }
                })
            }


        }
    </script>
</head>

<body style="background:#F1F5F4">
<div class="m-top">
    <div class="box" id="j-top-nav">
        <a href="main.jsp">
            <div class="logo fl"></div>
        </a>
        <a href="MenuServlet?m=showMenu">
            <div class="menu fl" style="width:100px">
                菜单
            </div>
        </a>
        <div class="separator fl"></div>
        <a href="member.jsp">
            <div class="menu fl" style="width:100px">
                管理中心
            </div>
        </a>
        <input type="hidden" id="j-is-login" value="false"/>
        <div class="clien fl"><span>${user.userName}<img src="shopping/images/common/arrow-down.png"
                                                         align="center"/></span></div>
        <div class="start fr" id="j-start-order"
             onclick="show('',550,550,'login.jsp')">
            立即点餐
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

<div class="m-address clear">
    <div class="wrapper">
        <div class="area clear" style="padding-left:20px">
            <!-- 送餐方式 -->
            收货餐地址

            <div class="type clear">
                <select style="height: 28px" id="address">
                    <c:forEach items="${address}" var="address" varStatus="s">
                        <option ${s.index == 0?"selected":""}
                                value="${address.addressProvince}-${address.addressCity}-${address.addressDistrict}-${address.addressDescribe}">${address.addressProvince}-${address.addressCity}-${address.addressDistrict}-${address.addressDescribe}</option>
                    </c:forEach>
                </select>
                <a href="#" class=" rb-red" onclick="change('addaddress',3)">+使用新地址</a>
            </div>


            <div style="display: none; margin-left:50px" id="insert_addaddress" class="change">
                <div style="margin-top: 20px">
                    <div class="outer">
                        <select name="province" style="height: 33px" id="addressProvince">
                            <option value="请选择">请选择</option>
                        </select>
                        <select name="city" style="height: 33px" id="addressCity">
                            <option value="请选择">请选择</option>
                        </select>
                        <select name="town" style="height: 33px" id="addressDistrict">
                            <option value="请选择">请选择</option>
                        </select>
                        <input type="text" id="addressDescribe" class="t-ad" style="width: 150px"
                               placeholder="描述"/>
                    </div>
                </div>
                <div class="act-botton clear"
                     style="margin: 20px 40px; padding: 20px 0">
                    <div class="save-button">
                        <a href="javascript:addAddres()" class="radius">保存</a>
                    </div>
                    <div class="cancel-button">
                        <a href="javascript:" class="radius"
                           onclick="change('addaddress',4)">取消</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="area">
            <div class="addr-box-line">
                <span class="text-w02 fl">顾客姓名</span>
                <span class="text-w02 fl">${user.userName}</span>
            </div>
            <div class="addr-box-line">
                <span class="text-w02 fl">用户账号</span>
                <span class="text-w02 fl" style="margin-left: 30px">${user.userTel}</span>
            </div>
            <div class="addr-box-line">
                <span class="text-w02 fr">总共金额</span>
                <span class="text-w02 fr"><span class="login-redcolor" style="font-size:24px">${money}</span>元</span>
            </div>
            <div class="addr-box-line" id="j-address-reminder">
            </div>
            <div class="act-botton" id="j-act-botton" style="padding:10px 50px; ">
                <div style="padding:10px 50px; background:#DF544E; width:120px; text-align:center;
        border-radius:5px
       "><a href="javascript:addOrder()" style="color:#FFF; font-size:22px;">提交订单 &gt;</a></div>
            </div>
        </div>


        <div class="area clear" style="margin-top:60px; font-size:14px; color:#999; padding-left:30px">
            友情提示：网络订餐不提供订单修改和取消功能，请提交前仔细核实订单内容
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
                               tppabs="#">志刚社区</a>
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

</div>
</body>
</html>
<script src="shopping/js/area.js"></script>
<script src="shopping/js/select.js"></script>
<SCRIPT Language=VBScript><!--

//-->











</SCRIPT>