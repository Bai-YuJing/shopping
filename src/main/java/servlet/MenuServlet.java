package servlet;

import entiy.Product;
import entiy.TCategory;
import org.apache.commons.beanutils.BeanUtils;
import service.ProductService;
import service.TCategoryService;
import service.imp.ProductServiceImp;
import service.imp.TCategoryServiceImp;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


@WebServlet("/MenuServlet")
public class MenuServlet extends BaseServlet {

    ProductService ps = new ProductServiceImp();
    TCategoryService ts = new TCategoryServiceImp();

    //    餐单显示
    public void showMenu(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TCategory category = new TCategory();
        //获取所有分类
        List<TCategory> all = ts.queryAddress(category, 0, 0);

        //根据分类获取餐品
        Map<String, String[]> map = request.getParameterMap();
        Product product = new Product();
        BeanUtils.populate(product, map);
        product.setProductStatus("Y");

        //默认页码号
        int nowPage = 1;
        //如果有分页请求
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        //每页的数据量
        int pageSize = 15;

        List<Product> products = ps.All(product, 0, 0);

        int total = products.size();
        //需要的页码
        int pages = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        //当前页码展示的数据
        products = ps.All(product, nowPage, pageSize);
        //总页码数据
        request.setAttribute("pages", pages);
        //当前页码号
        request.setAttribute("nowPage", nowPage);

        //搜素条件
        request.setAttribute("p", product);

        //每页计算过的总数据
        request.setAttribute("all", all);

        //当前页码需要展示数据
        request.setAttribute("products", products);


        request.getRequestDispatcher("menu.jsp").forward(request, response);

    }
}
