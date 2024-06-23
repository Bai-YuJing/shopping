
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>分类管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/menu.css"/>
    <link rel="stylesheet" type="text/css" href="shopping/css/address.css"/>
    <script type="text/javascript" src="shopping/js/jquery.min.js"></script>
    <script src="shopping/layer/layer.js" type="text/javascript"></script>
    <script src="shopping/js/main.js" type="text/javascript"></script>
    <script type="text/javascript">

        // 删除
        function del(id) {
            var categoryId = id;
            console.log(id)
            layer.confirm('确定要删除吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.post("CategoryServlet?m=del", {"categoryId": categoryId}, function (data) {
                    if (data == 1) {
                        layer.msg('删除成功');
                        location.reload();
                    } else {
                        layer.msg('该分类下面有其他菜品');
                    }
                })
            });
        }

        // 更新
        function updatecategory(id) {
            var gaiName = $.trim($("#gaiName" + id).val());
            if (gaiName.length == 0 || gaiName.length > 8) {
                layer.msg("请输入分类范围在1-7!!!")

            } else {
                $.post("CategoryServlet?m=update", {
                    "gaiName": gaiName,
                    "categoryId": id
                }, function (data) {
                    if (data == 0) {
                        layer.msg("当前分类已存在!!!")
                    } else {
                        location.reload();
                        layer.msg("修改成功!!!")
                    }
                })
            }

        }


        // 添加
        function addCategory() {
            var categoryName = $("#categoryName").val();
            if (categoryName.length>8) {
                layer.msg("请输入分类范围在1-7!!!")
            } else {
                $.post("CategoryServlet?m=add", {
                    "categoryName": categoryName
                }, function (data) {
                    if (data == 1) {
                        layer.msg("新增成功!!!");
                        location.reload();
                    } else {
                        layer.msg("当前分类已存在!!!")
                    }
                })
            }

        }
    </script>
</head>
<body>
<div class="m-main">
    <div class="m-food">
        <div class="mf-top border-t">
            <div>
                分类管理
            </div>
        </div>

        <c:forEach items="${all}" var="category">
            <div class="mf-menu border-t"
                 style="height: auto; line-height: normal; padding: 30px 0">

                <div class="fl">
                    <span class="m-wt"></span>
                    <span>${category.categoryName}</span>
                </div>
                <div class="fr dingwei">
                    <button class="xiugai" onclick="change('category${category.categoryId}',1)">
                        修改
                    </button>
                    <button class="del" onclick="del('${category.categoryId}')">
                        删除
                    </button>
                </div>


                    <%--            修改框--%>
                <div id="update_category${category.categoryId}" style="display: none;" class="change">
                    <div style="padding-top: 20px" class="clear">
                        <span class="m-wt" style="padding: 0 30px; width: 70px"></span>
                        <input type="text" id="gaiName${category.categoryId}" class="t-ad" style="width: 150px"
                               value="${category.categoryName}"/>
                    </div>

                    <div class="act-botton clear"
                         style="margin: 10px 0 10px 15px; padding: 10px 0">
                        <div class="save-button">
                            <a href="javascript:updatecategory(${category.categoryId})" class="radius">保存</a>
                        </div>
                        <div class="cancel-button">
                            <a href="javascript:" class="radius"
                               onclick="change('category${category.categoryId}',2)">取消</a>
                        </div>
                    </div>
                </div>

            </div>
        </c:forEach>
        <div class="mf-top" style="margin-top:30px;" >

            <ul class="pagination" style="margin-left:250px">
                <c:forEach begin="1" end="${pages}" var="pageNum" step="1">
                    <li>
                        <a href="CategoryServlet?m=getAll&nowPage=${pageNum}"
                           class='${nowPage == pageNum?"active":""}'>${pageNum}</a></li>
                </c:forEach>
            </ul>
        </div>

        <%--        添加--%>
        <div class="mf-top" style="margin-top: 30px">
            <div id="addcategory">
                <div style="line-height: 40px">
                    <span class="m-wt" style="padding: 0 20px"></span><a href="#"
                                                                         class=" rb-red"
                                                                         onclick="change('addcategory',3)">+添加新分类</a>
                </div>
            </div>
            <div id="insert_addcategory" style="display: none;" class="change">
                <div style="padding-top: 20px" class="clear">
                    <span class="m-wt" style="padding: 0 30px; width: 70px"></span>
                    <input type="text" id="categoryName" class="t-ad" style="width: 150px"
                           placeholder="请输入分类名称"/>
                </div>

                <div class="act-botton clear"
                     style="margin: 10px 0 10px 15px; padding: 10px 0">
                    <div class="save-button">
                        <a href="javascript:addCategory()" class="radius">保存</a>
                    </div>
                    <div class="cancel-button">
                        <a href="javascript:" class="radius"
                           onclick="change('addcategory',4)">取消</a>
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