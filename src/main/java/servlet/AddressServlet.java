package servlet;

import entiy.TAddress;
import entiy.TUser;
import org.apache.commons.beanutils.BeanUtils;
import service.TAddressService;
import service.imp.TAddressServiceImp;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


@WebServlet("/AddressServlet")
public class AddressServlet extends BaseServlet {
    private TAddressService as = new TAddressServiceImp();

    /**
     * 获取当前用户的所有地址和分页
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void getAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取当前用户
        TUser user = (TUser) request.getSession().getAttribute("user");

        //默认页码号
        int nowPage = 1;

        //如果有分页请求
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        //将获得的参数对象化封装
        Map<String, String[]> map = request.getParameterMap();
        BeanUtils.populate(user, map);

        //每页的数据量
        int pageSize = 5;

        //获取所有不分页
        List<TAddress> useres = as.queryAddress(user, 0, 0);

//         遍历
//        for (TAddress t : useres) {
//            System.out.println(t);
//        }

        //总数据量
        int total = useres.size();

        //需要的页码
        int pages = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;

        //当前页码展示的数据
        useres = as.queryAddress(user, nowPage, pageSize);

         //每页计算过的总数据
        request.setAttribute("all", useres);

        //总页码数据
        request.setAttribute("pages", pages);

        //当前页码号
        request.setAttribute("nowPage", nowPage);

        //当前页码需要展示数据
        request.setAttribute("user", user);

//        重定向
        request.getRequestDispatcher("address.jsp").forward(request, response);
    }

    /**
     * 添加新地址
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void addAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

    /**
     * 删除一个已有地址
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void removeAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String addressId = request.getParameter("addressId");
        response.getWriter().println(as.del(addressId));
    }


    /**
     * 修改一个已有地址
     *
     * @param request
     * @param response
     * @throws Exception
     */

    public void updateAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String province = request.getParameter("addressProvince");
        String city = request.getParameter("addressCity");
        String district = request.getParameter("addressDistrict");
        String describe = request.getParameter("addressDescribe");
        String addressId = request.getParameter("addressId");
        TUser user = (TUser) request.getSession().getAttribute("user");
        List<TAddress> addresses = as.queryAddress(user, 0, 0);
        String insert = district + describe;
        if (addresses.contains(insert)) {
            response.getWriter().println(0);
        } else {
            response.getWriter().println(as.update(province, city, district, describe, addressId));
        }
    }
}
