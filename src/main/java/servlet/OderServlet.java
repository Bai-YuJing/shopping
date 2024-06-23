package servlet;

import entiy.*;
import org.apache.commons.beanutils.BeanUtils;
import service.CartService;
import service.OrderDetailsService;
import service.OrderService;
import service.TAddressService;
import service.imp.CartServiceImpl;
import service.imp.OrderDetailsServiceImp;
import service.imp.OrderServiceImp;
import service.imp.TAddressServiceImp;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@WebServlet("/OderServlet")
public class OderServlet extends BaseServlet {
    private TAddressService as = new TAddressServiceImp();
    private OrderService os = new OrderServiceImp();
    private OrderDetailsService ods = new OrderDetailsServiceImp();
    private CartService cs = new CartServiceImpl();


    //获取提交钱数和地址
    public void MoneyAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TUser user = (TUser) request.getSession().getAttribute("user");
        //地址列表
        List<TAddress> address = as.queryAddress(user, 0, 0);
        //存储数据
        String money = request.getParameter("money");
        request.setAttribute("money", money);
        request.setAttribute("address", address);

        request.getRequestDispatcher("order_submit.jsp").forward(request, response);
    }


    //通过提交订单加入数据库数据
    public void addOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取地址
        String address = request.getParameter("address");
//         System.out.println(address);

        //获取当前登录对象
        TUser user = (TUser) request.getSession().getAttribute("user");
//        System.out.println(user);


        //添加订单返回主键
        int orderId = os.addOrder(new Order((int) user.getUserId(), address));

        //获取购物车列表
        CartProduct cartProduct = new CartProduct();
        cartProduct.setUserId(user.getUserId());
        List<CartProduct> carts = cs.getCart(cartProduct);
//        System.out.println(carts);

        //根据购物车列表生成订单详情
        List<OrderDetails> list = new ArrayList<>();
//        System.out.println(list);

        for (int i = 0; i < carts.size(); i++) {
            list.add(new OrderDetails(carts.get(i).getProductName(), (int) carts.get(i).getProductNum(), carts.get(i).getProductNum() * carts.get(i).getProductPrice(), orderId));
        }
//        System.out.println(list);


        //执行添加购物车详情操作
        ods.addOrderDetails(list);

        //删除购物车
        Cart cart = new Cart();
        String id = String.valueOf(user.getUserId());
        cart.setUserId(user.getUserId());
        cs.cartDel(id);
        response.sendRedirect("/shoping/MenuServlet?m=showMenu");


    }

    //提交订单加入地址
    public void addaddres(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String province = request.getParameter("addressProvince");
        String city = request.getParameter("addressCity");
        String district = request.getParameter("addressDistrict");
        String describe = request.getParameter("addressDescribe");
        String insert = district + describe;
//        System.out.println(insert);
        TUser user = (TUser) request.getSession().getAttribute("user");
        as.add(province, city, district, describe, (int) user.getUserId());
        response.getWriter().println(1);

    }


    //订单管理
    public void selectOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取当前登录用户对象
        TUser user = (TUser) request.getSession().getAttribute("user");
        //获取当前页码号
        int nowPage = 1;
        if (request.getParameter("nowPage") != null && !"".equals(request.getParameter("nowPage"))) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        //每页显示的数据量
        int pageSize = 5;
        //搜索条件
        Map<String, String[]> map = request.getParameterMap();
        Order order = new Order();
        BeanUtils.populate(order, map);
//        System.out.println("111" + order);

//        判断权限
        if (!"A".equals(user.getUserRole())) {
            order.setUserId((int) user.getUserId());
        }
        //计算出总页数
        List<Order> orders = ods.selectOrderAndDetails(order, 0, 0);
        int pages = orders.size() % pageSize == 0 ? orders.size() / pageSize : orders.size() / pageSize + 1;

        //展示当前数据
        orders = ods.selectOrderAndDetails(order, nowPage, pageSize);
//        System.out.println(orders);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("pages", pages);
        request.setAttribute("order", order);
        request.setAttribute("orders", orders);

        request.getRequestDispatcher("order.jsp").forward(request, response);


    }

}
