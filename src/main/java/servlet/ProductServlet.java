package servlet;

import entiy.Product;
import entiy.TCategory;
import org.apache.commons.beanutils.BeanUtils;
import service.ProductService;
import service.TCategoryService;
import service.imp.ProductServiceImp;
import service.imp.TCategoryServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

/**
 * 商品管理
 *
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends BaseServlet {
    TCategoryService cs = new TCategoryServiceImp();

    ProductService ps = new ProductServiceImp();


    /**
     * 条件搜索与分页
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void selectAll(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, ServletException {
        TCategory tCategory = new TCategory();

        //默认页码号
        int nowPage = 1;
        //如果有分页请求
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        //搜索条件
        Map<String, String[]> map = request.getParameterMap();
        //参数对象化封装
        Product product = new Product();
        BeanUtils.populate(product, map);


        //每页的数据量
        int pageSize = 2;
        //获取所有
        List<Product> products = ps.All(product, 0, 0);
        //总数据量
        int total = products.size();
        //需要的页码
        int pages = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;

        //当前页码展示的数据
        products = ps.All(product, nowPage, pageSize);

        //搜索的条件
        request.setAttribute("p", product);
        //当前页码号
        request.setAttribute("nowPage", nowPage);
        //总页码
        request.setAttribute("pages", pages);
        //当前页码需要展示数据
        request.setAttribute("products", products);
        //获取商品类型列表
        List<TCategory> all = cs.queryAddress(tCategory, 0, 0);
        request.setAttribute("all", all);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }


    /**
     * 获取所有列表
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void selectProduct(HttpServletRequest request,
                              HttpServletResponse response) throws Exception {
        TCategory tCategory = new TCategory();

        //获取商品列表
        List<Product> products = ps.selectProduct();

        //获取商品类型列表
        List<TCategory> all = cs.queryAddress(tCategory, 0, 0);


        request.setAttribute("products", products);
        request.setAttribute("all", all);

        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    /**
     * 修改或者添加商品
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void save(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, String[]> map = request.getParameterMap();
        Product product = new Product();
        BeanUtils.populate(product, map);

        ps.save(product);//修改或者添加

//        product = null;
        //       response.sendRedirect("/ProductServlet?m=selectAll");
        request.getRequestDispatcher("/ProductServlet?m=selectAll").forward(request, response);

    }

    /**
     * 删除
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void removeproduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String productId = request.getParameter("productId");
        response.getWriter().println(ps.del(productId));
    }

    /**
     * 修改餐品状态
     */
    public void updateproductStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        if ("Y".equals(type)) {
            type = "N";
            int i = ps.updateproductStatus(type, id);
            response.getWriter().println(1);
        } else {
            type = "Y";
            int i = ps.updateproductStatus(type, id);
            response.getWriter().println(1);
        }


    }

}
