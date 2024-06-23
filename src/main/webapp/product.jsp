
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/menu.css"/>
    <title>商品管理</title>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <script type="text/javascript">


        // 删除
        function del(id) {
            var productId = id;
            console.log(id)
            layer.confirm('确定要删除吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.post("ProductServlet?m=removeproduct", {"productId": productId}, function (data) {
                    if (data == 1) {
                        layer.msg('删除成功');
                        location.reload();

                    } else {
                        layer.msg('该分类下面有其他菜品');
                    }
                })
            });
        }


        function update(id, type) {
            var msg;
            if (type == 'N') {
                msg = "下架"
            } else {
                msg = "上架"
            }
            $.post("ProductServlet?m=updateproductStatus", {
                    "id": id,
                    "type": type
                },
                layer.confirm('确定要' + msg + '吗？', {
                    btn: ['确定', '取消'] //按钮
                }, function (data) {
                    if (data == 1) {
                        location.reload()
                        layer.msg(msg + '成功');
                    } else {
                        location.reload()
                        layer.msg(msg + '成功');
                    }

                }));
        }


        function uploadPic(pid) {
            var pic = $("#pic" + pid).val();
            if (pic == "") {
                return;
            }

            var formData = new FormData();
            formData.append('photo', $('#pic' + pid)[0].files[0]);
            $.ajax({
                url: "UploadServlet?m=upload",
                type: "post",
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    $("#productPic" + pid).val(data);
                }
            });
        }

        function addloadPic() {
            var pic = $("#pic").val();
            if (pic == "") {
                return;
            }

            var formData = new FormData();
            formData.append('photo', $('#pic')[0].files[0]);
            $.ajax({
                url: "UploadServlet?m=upload",
                type: "post",
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    $("#productPic").val(data);
                }
            });
        }

        function delPic() {
            var pic = $("#pic").val();
            if (pic == "") {
                return;
            }

            var formData = new FormData();
            formData.append('photo', $('#pic')[0].files[0]);
            $.ajax({
                url: "UploadServlet?m=upload",
                type: "post",
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    $("#productPic" + pid).val(data);
                }
            });
        }


        //增加校验
        function checkFor() {
            var t = true;
            var pic = $.trim($("#pic").val());
            var pN = $.trim($("#pN").val());
            var pP = $.trim($("#pP").val());
            var pD = $.trim($("#pD").val());
            if (pic == "") {
                t = false;
                layer.msg("图片不能为空");
            } else if (pN > 8 || pN == 0) {
                t = false;
                layer.msg("名字输入错误1-7")
            } else if ( pP == 0) {
                t = false;
                layer.msg("不能为0")
            } else if (pD > 8 || pD == 0) {
                t = false;
                layer.msg("描述输入错误1-7")
            }
            return t;

        }

        // 修改校验
        function checkForm(pid) {
            var t = true;
            productId=pid;
            var pic = $.trim($("#pic"+pid).val());
            var pN = $.trim($("#pN"+pid).val());
            var pP = $.trim($("#pP"+pid).val());
            var pD = $.trim($("#pD"+pid).val());
            if (pic == "") {
                t = false;
                layer.msg("图片不能为空");
            } else if (pN > 8 || pN == 0) {
                t = false;
                layer.msg("名字输入错误1-7")
            } else if ( pP == 0) {
                t = false;
                layer.msg("价格输入错误1-20")
            } else if (pD > 10 || pD == 0) {
                t = false;
                layer.msg("描述输入错误1-10")
            }
            return t;

        }



        function n() {
            var a = true;
            var productName = $.trim($("#productName").val());
            if (productName.length > 5) {
                a = false;
                layer.msg("商品有效值位1-4位")
            }
            return a;

        }

    </script>
</head>
<body>
<div class="m-main">

    <div class="m-food">
        <div class="mf-top border-t">
            <form action="ProductServlet?m=selectAll" method="post" onsubmit="return n()">
                <div class="fl">
                    商品管理
                </div>
                <div class="fr">
                    <input type="text" name="productName" id="productName" value="${p.productName}" placeholder="商品名称"/>
                    <select name="categoryId" class="select" style="background-color: yellow">
                        <option value="">查询所有</option>
                        <c:forEach items="${all}" var="a">
                            <option value="${a.categoryId}" ${p.categoryId == a.categoryId?"selected":""}>${a.categoryName}</option>
                        </c:forEach>
                    </select>
                    <button type="submit">
                        搜索
                    </button>
                </div>
            </form>
        </div>
        <c:forEach items="${products}" var="p">
            <div class="mf-menu clear"
                 style="line-height: normal; padding: 20px 0; width: 1000px; height: auto;">
                <div class="fl mf-prd">
                    <img src="upload/${p.productPic}"
                         width="100" align="center"/>
                    <span>${p.productName}</span>
                    <span>${p.productPrice}</span>
                    <span>${p.productDescribe}</span>
                    <c:forEach items="${all}" var="a">
                        <c:if test="${a.categoryId == p.categoryId}">
                            <span>${a.categoryName}</span>
                        </c:if>
                    </c:forEach>

                </div>
                <div class="fr weizhi" style="width:300px">
                    <button class=${p.productStatus=="Y"?"shangjia":"xiajia"}
                                    onclick="update(${p.productId},'${p.productStatus}')">${p.productStatus=="Y"?"下架":"上架"}
                    </button>
                    <button class="xiugai" onclick="change('product${p.productId}',1)">
                        修改
                    </button>
                    <button class="del" onclick="del(${p.productId})">
                        删除
                    </button>
                </div>


                    <%--                //修改--%>
                <form action="ProductServlet?m=save&productId=${p.productId}" method="post"
                      onsubmit="return checkForm(${p.productId});">
                    <div id="update_product${p.productId}" style="display: none;" class="change">
                        <div class="new-food clear">
                            <div>
                                <input type="hidden" id="productPic${p.productId}" name="productPic"/>
                                <input placeholder="选择图片" id="pic${p.productId}" type="file"
                                       onchange="uploadPic('${p.productId}')"/>
                                <input placeholder="商品" id="pN${p.productId}" value="${p.productName}"
                                       name="productName"
                                       type="text"/>
                                <input placeholder="单价" id="pP${p.productId}" value="${p.productPrice}"
                                       name="productPrice"
                                       type="text"/>
                            </div>
                            <div>
                                <input placeholder="描述" id="pD${p.productId}" value="${p.productDescribe}"
                                       name="productDescribe"
                                       type="text" style="width: 390px"/>
                                <select class="select" name="categoryId" style="background-color: yellow">
                                    <c:forEach items="${all}" var="a">
                                        <option value="${a.categoryId}">${a.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div>
                                <input type="submit" class="nw-btn xiugai m-submit"
                                       style="border: none; height: 40px"/>
                                <input type="reset" value="取消" onclick="change('product${p.productId}',2)"
                                       class="del" style="height: 40px; border-radius: 5px"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </c:forEach>


        <div class="mf-top clear">
            <div class="fl" style="line-height: 40px; margin-top:40px">
                <a href="#" class=" rb-red" onclick="change('addproduct',3)">+添加新商品</a>
            </div>


            <%--            增加--%>
            <form action="ProductServlet?m=save" method="post"
                  onsubmit="return checkFor();">
                <div id="insert_addproduct" style="display: none;" class="change">
                    <div class="new-food clear">
                        <div>
                            <input type="hidden" id="productPic" name="productPic"/>
                            <input placeholder="选择图片" id="pic" type="file"
                                   onchange="addloadPic()"/>
                            <input placeholder="商品名" id="pN" name="productName" type="text"/>
                            <input placeholder="单价" id="pP" name="productPrice" type="text"/>
                        </div>
                        <div>
                            <input placeholder="描述" id="pD" name="productDescribe" type="text" style="width: 390px"/>
                            <select class="select" name="categoryId" style="background-color: yellow">
                                <c:forEach items="${all}" var="a">
                                    <option value="${a.categoryId}">${a.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <input type="submit" class="nw-btn xiugai m-submit"
                                   style="border: none; height: 40px"/>
                            <input type="reset" value="取消" onclick="change('addproduct',4)"
                                   class="del" style="height: 40px; border-radius: 5px"/>
                        </div>
                    </div>

                </div>
            </form>

            <div>
                <ul class="pagination fr" style="margin-right: 50px; margin-top:40px">
                    <c:forEach begin="1" end="${pages}" var="pageNum" step="1">
                        <li>
                            <a href="ProductServlet?m=selectAll&nowPage=${pageNum}&productName=${p.productName}&categoryId=${p.categoryId}"
                               class='${nowPage == pageNum?"active":""}'>${pageNum}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>


    </div>
</div>
</body>
</html>

