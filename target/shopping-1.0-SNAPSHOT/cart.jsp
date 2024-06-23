
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    //提交钱数
    var money;
    //获取需要放数据的容器
    var containerCart;
    //获取我们定义的模板的dom对象。主要是想获取里面的内容
    var templateCart;


    $(function () {
        containerCart = $('#containerCart');
        templateCart = $('#templateCart');
        getCart();
    });

    /**
     * 获取购物车
     */
    function getCart() {
        $.get("CartServlet?m=getCart", function (data) {
            var sum = 0;
            var num = 0;
            console.log(data);
            for (var i = 0; i < data.length; i++) {
                sum += data[i].productNum * data[i].productPrice;
                num += data[i].productNum;
            }
            if (sum != 0) {
                sum += 9;
            }

            //编译模板的里的内容
            var template = Handlebars.compile(templateCart.html());
            $("#num").text(num);
            $("#cart_image").text(sum);
            //把后台获取到的数据渲染到页面
            containerCart.html(template(data));
            money=sum;

        }, "json");
    }


    // +-
    function save(num, cid) {
        // alert(num + " " + cid);

        //掉后台执行数据加或者减
        $.post("CartServlet?m=addAndred", {
            "num": num,
            "cid": cid,
        }, function (data) {
            if (data == 1) {
                // layer.msg("成功");
                // location.reload();
            } else {
                // layer.msg("失败");
            }
        })
        getCart();
        //重新获取cart数据
    }


    // 清空购物车
    function del() {
        layer.confirm('确认清空吗？', {
            btn: ['确认', '取消'] //按钮
        }, function () {
            $.post("CartServlet?m=cartDel", {}, function (data) {
                if (data == 1) {
                    layer.msg("清空购物车成功！！！");

                    getCart();
                } else {
                    layer.msg("清空购物车失败！！！");
                }
            })

        })

    }

    function MoneyAll() {
        if (money>9){
            location.href="OderServlet?m=MoneyAll&money="+money
        }else {
            layer.msg("您还没有商品加入购物车！！！")
        }

    }
</script>
<div class="m-shopping" id="cart" style="overflow-y: scroll">
    <div class="m-cart">
        <div id="close">
            <img src="shopping/images/common/close.png" class="m-img"/>
        </div>
        <span> 我的购物盒</span>
        <a href="#" onclick="del()">清空购物盒</a>
    </div>
    <div id="containerCart">
        <div>
            <script type="text/x-handlebars-template" id="templateCart">
                {{#each this}}
                <div class="border-bot eat">
                    <div class=" eat-left fl">
                        <img src="upload/{{productPic}}"/> <span>{{productName}}</span>
                        <br/> <span class="login-redcolor">{{productPrice}}元</span>
                    </div>
                    <div class="fr  eat-right">
                        <button class="cursor">
                            <img src="shopping/images/common/minus-red.png"
                                 onclick="save({{productNum}}-1,{{cartId}})"/>
                        </button>
                        <input type="text" placeholder="{{productNum}}"/>
                        <button class="cursor">
                            <img src="shopping/images/common/plus-green.png"
                                 onclick="save({{productNum}}+1,{{cartId}})"/>
                        </button>
                    </div>
                </div>
                {{/each}}
            </script>
        </div>
    </div>
    <div class="login-bgrcolor eat-bot" id="cart_show" style="position: fixed">
        <img src="shopping/images/menu/box.png" class="e-img"/> <span
            class="e-top login-redcolor" id="num"> </span><strong class="e-title1">总计 : <span
            class="e-bigfont" id="cart_image"></span><span> 元 (包含配送费9元)</span>
    </strong>
        <button class="e-btn"
                onclick="MoneyAll()">选好了 &gt;
<%--            --%>
        </button>
    </div>
</div>
