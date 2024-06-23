# Shopping
 基于servlet+jsp的在线商城

# 1 技术介绍

## 1.1 Bootstrap

Bootstrap是美国Twitter公司的设计师Mark Otto和Jacob Thornton合作基于HTML、CSS、JavaScript 开发的简洁、直观、强悍的前端开发框架，使得 Web 开发更加快捷。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。 国内一些移动开发者较为熟悉的框架，如WeX5前端开源框架等，也是基于Bootstrap源码进行性能优化而来。

## 1.2 Jsp

JSP（全称Java Server Pages）是由Sun Microsystems公司主导创建的一种动态网页技术标准。JSP部署于网络服务器上，可以响应客户端发送的请求，并根据请求内容动态地生成HTML、XML或其他格式文档的Web网页，然后返回给请求者。JSP技术以Java语言作为脚本语言，为用户的HTTP请求提供服务，并能与服务器上的其它Java程序共同处理复杂的业务需求。

JSP将Java代码和特定变动内容嵌入到静态的页面中，实现以静态页面为模板，动态生成其中的部分内容。JSP引入了被称为“JSP动作”的XML标签，用来调用内建功能。另外，可以创建JSP标签库，然后像使用标准HTML或XML标签一样使用它们。标签库能增强功能和服务器性能，而且不受跨平台问题的限制。JSP文件在运行时会被其编译器转换成更原始的Servlet代码。JSP编译器可以把JSP文件编译成用Java代码写的Servlet，然后再由Java编译器来编译成能快速执行的二进制机器码，也可以直接编译成二进制码。

## 1.3 Servlet

Servlet（Server Applet）是Java Servlet的简称，称为小服务程序或服务连接器，用Java编写的服务器端程序，具有独立于平台和协议的特性，主要功能在于交互式地浏览和生成数据，生成动态Web内容。

狭义的Servlet是指Java语言实现的一个接口，广义的Servlet是指任何实现了这个Servlet接口的类，一般情况下，人们将Servlet理解为后者。Servlet运行于支持Java的应用服务器中。从原理上讲，Servlet可以响应任何类型的请求，但绝大多数情况下Servlet只用来扩展基于HTTP协议的Web服务器。

最早支持Servlet标准的是JavaSoft的Java Web Server，此后，一些其它的基于Java的Web服务器开始支持标准的Servlet。

## 1.4 Jdbc

Java数据库连接，（Java Database Connectivity，简称JDBC）是Java语言中用来规范客户端程序如何来访问数据库的应用程序接口，提供了诸如查询和更新数据库中数据的方法。JDBC也是Sun Microsystems的商标。我们通常说的JDBC是面向关系型数据库的。

## 1.5 MVC

经典MVC模式中，M是指模型，V是视图，C则是控制器，使用MVC的目的是将M和V的实现代码分离，从而使同一个程序可以使用不同的表现形式。其中，View的定义比较清晰，就是用户界面。

MVC开始是存在于桌面程序中的，M是指业务模型，V是指用户界面，C则是控制器，使用MVC的目的是将M和V的实现代码分离，从而使同一个程序可以使用不同的表现形式。比如一批统计数据可以分别用柱状图、饼图来表示。C存在的目的则是确保M和V的同步，一旦M改变，V应该同步更新。

模型－视图－控制器（MVC）是Xerox PARC在二十世纪八十年代为编程语言Smalltalk－80发明的一种软件设计模式，已被广泛使用。后来被推荐为Oracle旗下Sun公司Java EE平台的设计模式，并且受到越来越多的使用ColdFusion和PHP的开发者的欢迎。

# 2 概要设计

### 2.1 数据字典

表**3.1** 用户信息表

| **字段名**  | **数据类型** | **默认值** | **允许非空** | **自动递增** | **备注**         |
| ----------- | ------------ | ---------- | ------------ | ------------ | ---------------- |
| user_id     | int(11)      |            | NO           | 是           | 用户编号（主键） |
| user        | varchar(15)  |            | NO           |              | 账号             |
| user_name   | varchar(50)  |            | NO           |              | 姓名             |
| user_pwd    | varchar(20)  |            | NO           |              | 密码             |
| user_sex    | char (1)     |            | NO           |              | 性别             |
| add_time    | timestamp    |            | NO           |              | 注册时间         |
| user_status | char (1)     | Y          | NO           |              | 状态             |
| user_role   | char (1)     | U          | NO           |              | 用户权限         |

表**3.2** **用户**地址表

| **字段名**       | **数据类型** | **默认值** | **允许非空** | **自动递增** | **备注** |
| ---------------- | ------------ | ---------- | ------------ | ------------ | -------- |
| address_id       | int(11)      |            | NO           | 是           | 地址ID   |
| address_province | varchar(10)  |            | NO           |              | 省       |
| address_city     | varchar(10)  |            | NO           |              | 市       |
| address_district | varchar(20)  |            | NO           |              | 区       |
| address_describe | varchar(50)  |            | NO           |              | 详细地址 |
| user_id          | int(11)      |            | NO           |              | 用户ID   |

 

表**3.3** 订单表

| **字段名**      | **数据类型** | **默认值**        | **允许非空** | **自动递增** | **备注** |
| --------------- | ------------ | ----------------- | ------------ | ------------ | -------- |
| order_id        | int(11)      |                   | NO           | 是           | 订单ID   |
| add_time        | timestamp    | CURRENT_TIMESTAMP | NO           |              | 添加时间 |
| update_time     | timestamp    | NULL              | YES          |              | 更新时间 |
| user_id         | int(11)      |                   | NO           |              | 用户ID   |
| address_details | varchar(100) | NULL              | YES          |              | 用户地址 |
| order_type      | int(11)      | 1                 | NO           |              | 订单属性 |

 

表**3.4** 订单详情表

| **字段名**       | **数据类型** | **默认值** | **允许非空** | **自动递增** | **备注**   |
| ---------------- | ------------ | ---------- | ------------ | ------------ | ---------- |
| order_details_id | int(11)      |            | NO           | 是           | 商品详情ID |
| product_name     | varchar(20)  |            | NO           |              | 商品名称   |
| product_num      | int(11)      |            | NO           |              | 商品数量   |
| product_money    | decimal(8,2) |            | NO           |              | 商品价格   |
| order_id         | int(11)      |            | NO           |              | 订单ID     |

表**3.5** 购物车表

| **字段名**  | **数据类型** | **默认值** | **允许非空** | **自动递增** | **备注** |
| ----------- | ------------ | ---------- | ------------ | ------------ | -------- |
| cart_id     | int(11)      |            | NO           | 是           | 购物车ID |
| product_id  | int(11)      |            | NO           |              | 商品ID   |
| product_num | int(11)      |            | NO           |              | 商品数量 |
| user_id     | int(11)      |            | NO           |              | 用户ID   |

表**3.6** 分类信息表

| **字段名**    | **数据类型** | **默认值** | **允许非空** | **自动递增** | **备注** |
| ------------- | ------------ | ---------- | ------------ | ------------ | -------- |
| category_id   | int(11)      |            | NO           | 是           | 分类ID   |
| category_name | varchar(20)  |            | NO           |              | 分类名   |



| **字段名**       | **数据类型** | **默认值** | **允许非空** | **自动递增** | **备注** |
| ---------------- | ------------ | ---------- | ------------ | ------------ | -------- |
| product_id       | int(11)      |            | NO           | 是           | 商品ID   |
| product_name     | varchar(40)  |            | NO           |              | 商品名   |
| product_pic      | varchar(20)  |            | NO           |              | 商品图片 |
| product_price    | decimal(8,2) |            | NO           |              | 商品价格 |
| product_describe | varchar(100) |            | NO           |              | 商品描述 |
| category_id      | int(11)      |            | NO           |              | 分类ID   |
| product_status   | char(1)      | 'Y'        | NO           |              | 商品状态 |



## 3 文档结构

文档结构中的SRC文件夹存放着一些核心类的包。其中的servlet层用来匹配请求的，执行对应的业务，去调用service业务层，主要功能在于交互式地浏览和修改数据，生成动态Web内容。Service层为服务层，用来帮助servlet进行提供业务，至于为什么service层要使用接口来定义有以下几点好处：在java中接口是多继承的，而类是单继承的，如果你需要一个类实现多个service，你用接口可以实现，用类定义service就没那么灵活。，需要操作数据库帮忙也就是dao层。Dao(data access object 数据访问对象)层:专门用来操作数据库的 jdbc，查询的数据需要java对象进行存储。DAO层中的Impl包用来实现DAO层中的接口。entity层用来处理java类型和数据表的映射关系。Util是utiliy的缩写，是一个多功能、基于工具的包。如字符串处理、日期处理等，(建立数据库之间的连接），是通用的、与业务无关的，可以独立出来，可供其他项目使用 。

## 4 关键代码

```java
package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;


@WebServlet("/BaseServlet")
public class BaseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String login = request.getParameter("m");
            Class<? extends BaseServlet> aClass = this.getClass();
            Method method = aClass.getMethod(login, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
```

## 5 联系方式



[1522993472@qq.com](mailto:1522993472@qq.com)

[zhouxiongwei346@outlook.com](mailto:zhouxiongwei346@outlook.com)
