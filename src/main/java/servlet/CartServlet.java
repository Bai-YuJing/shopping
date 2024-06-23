package servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import entiy.Cart;
import entiy.CartProduct;
import entiy.TUser;
import org.apache.commons.beanutils.BeanUtils;
import service.CartService;
import service.imp.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;


@WebServlet("/CartServlet")
public class CartServlet extends BaseServlet {
    CartService cs = new CartServiceImpl();

    //    添加到购物车
    public void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
//       获取当前对象
        TUser user = (TUser) request.getSession().getAttribute("user");

        Map<String, String[]> map = request.getParameterMap();

        Cart cart = new Cart();

        BeanUtils.populate(cart, map);

        cart.setProductNum(1);

        cart.setUserId(user.getUserId());

        int i = cs.addCart(cart);
        if (i == 0) {
            response.getWriter().print(0);
        } else {
            response.getWriter().print(1);
        }

    }

    public void getCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取当前登录用户对象
        TUser user = (TUser) request.getSession().getAttribute("user");
        CartProduct cartProduct = new CartProduct();
        cartProduct.setUserId(user.getUserId());
        List<CartProduct> carts = cs.getCart(cartProduct);

        //构建json转换对象
        ObjectMapper om = new ObjectMapper();
        //json输出
        om.writeValue(response.getWriter(), carts);
    }

    public void addAndred(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String num = request.getParameter("num");
        String cid = request.getParameter("cid");
//        System.out.println(num);
//        System.out.println(cid);
        int i = cs.addAndred(num, cid);
//        System.out.println(i);
        if (i == 0) {
            response.getWriter().print(0);
        } else {
            response.getWriter().print(1);
        }
    }

    public void cartDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TUser tuser = (TUser) request.getSession().getAttribute("user");
        String id = String.valueOf(tuser.getUserId()) ;
        int i = cs.cartDel(id);
        if (i==0){
            response.getWriter().print(0);
        }else {
            response.getWriter().print(1);
        }

    }
}
