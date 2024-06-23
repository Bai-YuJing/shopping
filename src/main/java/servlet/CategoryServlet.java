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

@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet {
    TCategoryService tcs = new TCategoryServiceImp();
    ProductService ptd = new ProductServiceImp();

    //显示所有分类
    public void getAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TCategory tCategory = new TCategory();
        List<TCategory> all = tcs.queryAddress(tCategory,0,0);
        request.getSession().setAttribute("all", all);

        //默认页码号
        int nowPage = 1;
        //如果有分页请求
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        //搜索条件
        Map<String, String[]> map = request.getParameterMap();
        //参数对象化封装
        TCategory category = new TCategory();
        BeanUtils.populate(category, map);


        //每页的数据量
        int pageSize = 2;
        //获取所有
        List<TCategory> users = tcs.queryAddress(category, 0, 0);
        //总数据量
        int total = users.size();
        //需要的页码
        int pages = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;

        //当前页码展示的数据
        users = tcs.queryAddress(category, nowPage, pageSize);


        //每页计算过的总数据
        request.setAttribute("all", users);
        //当前页码号
        request.setAttribute("nowPage", nowPage);
        //总页码
        request.setAttribute("pages", pages);
        //当前页码需要展示数据
        request.setAttribute("category", category);
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }


    //增加分类
    public void add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String categoryName = request.getParameter("categoryName");
        TCategory tCategory = new TCategory();
        List<TCategory> list = tcs.queryAddress(tCategory,0,0);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getCategoryName());
            if (categoryName.equals(list.get(i).getCategoryName())) {
                response.getWriter().println(0);
                return;
            }
        }
        tcs.add(categoryName, tCategory.getCategoryId());
        response.getWriter().println(1);
    }


    //删除分类
    public void del(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Product> list = ptd.selectProduct();
//        System.out.println(list);
        String categoryId = request.getParameter("categoryId");
        for (int i = 0; i < list.size(); i++) {
            if (categoryId.equals(list.get(i).getCategoryId())) {
                response.getWriter().println(0);
                return;
            }
        }
        tcs.del(categoryId);
        response.getWriter().println(1);

    }


    //修改分类
    public void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String gaiName = request.getParameter("gaiName");
        String id = request.getParameter("categoryId");
        TCategory tCategory = new TCategory();
        List<TCategory> list = tcs.queryAddress(tCategory,0,0);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getCategoryName());
            if (gaiName.equals(list.get(i).getCategoryName())) {
                response.getWriter().println(0);
                return;
            }
        }
        tcs.update(gaiName, id);
        response.getWriter().println(1);

    }

}
