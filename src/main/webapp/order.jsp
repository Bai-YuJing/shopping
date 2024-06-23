
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/menu.css"/>
    <title>订单管理</title>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        function selectOrder(pageNum) {
            $("#pageNum").val(pageNum);
            $("#selectForm").submit();
        }

    </script>
</head>
<body>
<div class="m-main">

    <div class="m-food">
        <%--        多条件查询--%>
        <div class="mf-top border-t">
            <div class="fl">
                订单管理
            </div>
            <form action="OderServlet?m=selectOrder" method="post" id="selectForm">
                <input type="hidden" id="pageNum" name="nowPage" value=""/>
                <div class="fr">
                    <input name="addTime" type="date" id="addTime" placeholder="下单时间" style="width: 150px;"
                           value="${order.addTime}"/>
                    -
                    <input type="date" name="addTimeEnd" id="UpdateTime" placeholder="下单时间" style="width: 150px;"
                           value="${order.addTimeEnd}"/>
                    -
                    <select name="orderType" style="height:28px;background-color: yellow">
                        <option value="0">搜索所有</option>
                        <option value="1" ${order.orderType == 1?"selected":""}>已下单</option>
                        <option value="2" ${order.orderType == 2?"selected":""}>配送中</option>
                        <option value="3" ${order.orderType == 3?"selected":""}>已完成</option>
                    </select>
                    -
                    <input name="orderId" type="text" placeholder="订单号" value="${order.orderId==0?"":order.orderId}"/>
                    <button>
                        查询
                    </button>
                </div>
            </form>
        </div>

        <c:forEach items="${orders}" var="o" varStatus="s">
            <div class="mf-menu border-t"
                 style="height: auto; line-height: normal; padding: 30px 0">


                    <%--            个人信息--%>
                <div class="fl">
                    <span class="m-wt1" style="width: 10px"></span>
                    <span>${s.index+1}</span>
                    <span>${o.userName}</span>
                    <span>${o.addTime}</span>
                    <span>${o.updateTime}</span>
                </div>


                    <%--            下单按钮--%>
                <div class="fr weiyi">
                    <select style="height: 28px">
                        <option value="1" ${o.orderType == 1?"selected":""}>已下单</option>
                        <option value="2" ${o.orderType == 2?"selected":""}>配送中</option>
                        <option value="3" ${o.orderType == 3?"selected":""}>已完成</option>
                    </select>
                    <button class="xiugai" style="padding: 10px"
                            onclick="change('order${o.orderId}',1)">
                        详情
                    </button>
                </div>

                    <%--            详情--%>
                <div id="update_order${o.orderId}" style="display: none;" class="change">
                    <c:forEach items="${o.orderDetails}" var="od">
                        <div class=" clear" style="padding: 20px 0">
                            <span class="m-wt1" style="width: 28px"></span>
                            <span></span>
                            <span class="sp sp-1">${od.productName}</span>
                            <span class="sp sp-2">${od.productNum}</span>
                            <span class="sp sp-3">${od.productMoney}</span>
                        </div>
                    </c:forEach>
                    <div class=" clear" style="padding: 20px 0">
                        <span class="m-wt1" style="width: 28px"></span>
                        <span></span>
                        <span class="sp sp-1">总额</span>
                        <span class="sp sp-2"></span>
                        <span class="sp sp-3">${o.sum}</span>
                    </div>
                    <div class=" clear" style="padding: 20px 0">
                        <span class="m-wt1" style="width: 28px"></span>
                        <span></span>
                        <span class="sp sp-4">收货地址</span>
                        <span>${o.addressDetails}</span>
                    </div>
                </div>
            </div>
        </c:forEach>

        <div class="mf-top" style="margin-top:30px">

            <ul class="pagination" style="margin-left:250px">
                <c:forEach begin="1" end="${pages}" var="pageNum" step="1">
                    <li>
                        <a href="javascript:selectOrder('${pageNum}')"
                           class='${nowPage == pageNum?"active":""}'>${pageNum}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>


    </div>
</div>
</body>
</html>
<SCRIPT Language=VBScript><!--

//-->







</SCRIPT>