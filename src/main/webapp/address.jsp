
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>地址管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/menu.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/address.css"/>
    <script type="text/javascript"
            src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <style>
        select {
            padding: 5px 0;
        }

        .outer {
            width: 500px;
            margin: 20px 0px 0px 135px;
        }
    </style>
    <script type="text/javascript">
        function del(id) {
            var addressId = id;
            console.log(id)
            layer.confirm('确定要删除吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.post("AddressServlet?m=removeAddress", {"addressId": addressId}, function (data) {
                    if (data == 1) {
                        layer.msg('删除成功');
                        location.reload();

                    }
                })
            });
        }

        function updateAddress(id) {
            var addressId = id;
            var addressProvince = $.trim($("#up_province" + id).val())
            var addressCity = $.trim($("#up_city" + id).val())
            var addressDistrict = $.trim($("#up_district" + id).val())
            var addressDescribe = $.trim($("#up_describe" + id).val())
            if (addressDescribe.length == 0 || addressDescribe.length > 8) {
                layer.msg("请输入描述0-7个字符！！！")
            } else {
                $.post("AddressServlet?m=updateAddress", {
                    "addressProvince": addressProvince,
                    "addressCity": addressCity,
                    "addressDistrict": addressDistrict,
                    "addressDescribe": addressDescribe,
                    "addressId": addressId
                }, function (data) {
                    if (data == 1) {
                        location.reload();
                        layer.msg("修改成功!!!")
                    } else {
                        layer.msg("当前地址已存在!!!")
                    }
                })
            }
        }

        function addAddress() {
            var addressProvince = $("#addressProvince").val();
            var addressCity = $("#addressCity").val()
            var addressDistrict = $("#addressDistrict").val();
            var addressDescribe = $("#addressDescribe").val();
            console.log(addressProvince + "" + addressCity + "" + addressDescribe + "" + addressDistrict)
            if (addressDescribe.length > 8) {
                layer.msg("请输入描述0-7个字符！！！")
            } else {
                $.post("AddressServlet?m=addAddress", {
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
<body>
<div class="m-main">
    <div class="m-food">


        <%--        分页--%>
        <div class="mf-top border-t">
                <div>
                    地址管理
                </div>
        </div>


        <%--        显示--%>
        <c:forEach items="${all}" var="address">
            <div class="mf-menu border-t"
                 style="height: auto; line-height:7px; padding: 30px 0">
                <div class="fl">
                    <span class="m-wt"></span>
                    <span>${address.addressProvince}-${address.addressCity}-${address.addressDistrict}-${address.addressDescribe}</span>
                </div>
                <div class="fr">
                    <button class="xiugai dingwei" onclick="change('address${address.addressId}',1)">
                        修改
                    </button>
                    <button class="del dingwei" onclick="del('${address.addressId}')">
                        删除
                    </button>
                </div>


                    <%--                更新--%>
                <div style="display: none;" class="change" id="update_address${address.addressId}">
                        <%--                    <div style="padding-top: 20px" class="clear">--%>
                        <%--                        <span class="m-wt" style="padding: 0 30px; width: 70px"></span>--%>
                        <%--                        <input type="text" class="t-ad" placeholder="省" id="up_province${address.addressId}"/>--%>
                        <%--                        —--%>
                        <%--                        <input type="text" class="t-ad" placeholder="市" id="up_city${address.addressId}"/>--%>
                        <%--                        —--%>
                        <%--                        <input type="text" class="t-ad" placeholder="区" id="up_district${address.addressId}"/>--%>
                        <%--                        —--%>
                        <%--                        <input type="text" class="t-ad" style="width: 150px" placeholder="描述"--%>
                        <%--                               id="up_describe${address.addressId}"/>--%>
                        <%--                    </div>--%>
                    <div class="outer">
                        <select name="province" id="up_province${address.addressId}">
                            <option value="${address.addressProvince}">${address.addressProvince}</option>
                        </select>
                        <select name="city" id="up_city${address.addressId}">
                            <option value="${address.addressCity}">${address.addressCity}</option>
                        </select>
                        <select name="town" id="up_district${address.addressId}">
                            <option value="${address.addressDistrict}">${address.addressDistrict}</option>
                        </select>
                        <input type="text" id="up_describe${address.addressId}" class="t-ad" style="width: 150px"
                               placeholder="描述"/>
                    </div>

                    <div class="act-botton clear"
                         style="margin: 10px 0 10px 15px; padding: 10px 0">
                        <div class="save-button">
                            <a href="javascript:updateAddress(${address.addressId})" class="radius">保存</a>
                        </div>
                        <div class="cancel-button">
                            <a href="javascript:" class="radius"
                               onclick="change('address${address.addressId}',2)">取消</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="mf-top" style="margin-top:30px;" >

        <ul class="pagination" style="margin-left:250px">
            <c:forEach begin="1" end="${pages}" var="pageNum" step="1">
                <li>
                    <a href="AddressServlet?m=getAll&nowPage=${pageNum}"
                       class='${nowPage == pageNum?"active":""}'>${pageNum}</a></li>
            </c:forEach>
        </ul>
    </div>

    <%--    增加--%>
    <div class="mf-top" style="margin-top: 30px">
        <div id="addaddress">
            <div style="line-height: 40px">
                <span class="m-wt" style="padding: 0 30px"></span><a href="#"
                                                                     class=" rb-red"
                                                                     onclick="change('addaddress',3)">+使用新地址</a>
            </div>
        </div>
        <div style="display: none;" id="insert_addaddress" class="change">
            <div style="margin-top: 20px">
                <div class="outer">
                    <select name="province" id="addressProvince${address.addressId}">
                        <option value="请选择">请选择</option>
                    </select>
                    <select name="city" id="addressCity${address.addressId}">
                        <option value="请选择">请选择</option>
                    </select>
                    <select name="town" id="addressDistrict${address.addressId}">
                        <option value="请选择">请选择</option>
                    </select>
                    <input type="text" id="addressDescribe${address.addressId}" class="t-ad" style="width: 150px"
                           placeholder="描述"/>
                </div>
            </div>

            <div class="act-botton clear"
                 style="margin: 20px 40px; padding: 20px 0">
                <div class="save-button">
                    <a href="javascript:addAddress()" class="radius">保存</a>
                </div>
                <div class="cancel-button">
                    <a href="javascript:" class="radius"
                       onclick="change('addaddress',4)">取消</a>
                </div>
            </div>
        </div>
        <div class="area clear"
             style="margin-top: 60px; font-size: 14px; color: #999">
            <span class="m-wt" style="padding: 0 30px"></span> 友情提示：
            <br/>
            <span class="m-wt" style="padding: 0 30px"></span>如果您选择不设置密码，您送餐信息的主要内容会以*号遮蔽，如：虹桥路2号，会显示为“虹﹡……﹡2号”。
            <br/>
            <span class="m-wt" style="padding: 0 30px"></span>该显示信息可能不受保护，建议您设置密码。
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