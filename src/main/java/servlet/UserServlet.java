package servlet;

import entiy.TUser;
import entiy.User;
import org.apache.commons.beanutils.BeanUtils;
import service.TUserService;
import service.imp.TUserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
    TUserService ts = new TUserServiceImp();

    /**
     * 处理登录
     *
     * @param request
     * @param response
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取用户登录输入的信息
        Map<String, String[]> map = request.getParameterMap();

        //调用service
        TUser tUser = new TUser();
        BeanUtils.populate(tUser, map);

//        System.out.println(tUser);
        TUser user = ts.login(tUser);
        if (user == null) {
            response.getWriter().println(0);
        }
        //判断是否有这个用户
        //普通用户
        else if (tUser.getUserPwd().equals(user.getUserPwd())&& "Y".equals(user.getUserStatus())&&user.getUserRole().equals("A")) {
            //存储当前用户对象
            request.getSession().setAttribute("user", user);
            response.getWriter().println(1);
        } else if(!user.getUserStatus().equals("Y")){
            response.getWriter().println(2);
        } else if(tUser.getUserPwd().equals(user.getUserPwd())&&"U".equals(user.getUserRole())){
            request.getSession().setAttribute("user", user);
            response.getWriter().println(3);
        }else {
            response.getWriter().println(0);
        }


    }


    /**
     * 处理注册
     */
    public void register(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, IOException {
        //获取用户登录输入的信息
        Map<String, String[]> map = request.getParameterMap();

        //参数对象化封装
        TUser tUser = new TUser();
        BeanUtils.populate(tUser, map);
//        System.out.println(tUser);

        //检验usertel是否被占用
        TUser login = ts.login(tUser);
        if (login != null && tUser.getUserTel().equals(login.getUserTel())) {
            //手机号码被占用
            response.getWriter().println(0);
        } else {
            //执行注册
            ts.register(tUser);
            //自动登录
            request.getSession().setAttribute("user", ts.login(tUser));
            //信号
            response.getWriter().println(1);
        }
    }


    /**
     * 退出用户
     */
    public void out(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("user");
        response.sendRedirect("main.jsp");
    }


    /**
     * 修改用户的姓名/性别
     */
    public void updateUserNameandUserSex(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, IOException {
        //获取用户登录输入的信息
        Map<String, String[]> map = request.getParameterMap();

        //参数对象化封装
        TUser tUser = new TUser();
        BeanUtils.populate(tUser, map);
//        System.out.println(tUser);

        //获取id
        tUser.setUserId(((TUser) request.getSession().getAttribute("user")).getUserId());
        //获取tel
        tUser.setUserTel(((TUser) request.getSession().getAttribute("user")).getUserTel());
        int i = ts.updateUserNameandSex(tUser);
//        System.out.println(i);
        if (i == 0) {
            response.getWriter().println(0);
        } else {
            request.getSession().setAttribute("user", tUser);
            response.getWriter().println(1);
        }
    }

    /**
     * 密码校验
     */
    public void updateUserPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        String code = request.getParameter("code");

        System.out.println(oldpassword);
        TUser tUser = (TUser) request.getSession().getAttribute("user");
        System.out.println(tUser);
//        判断验证码
        if (!request.getSession().getAttribute("code").equals(code)) {
            response.getWriter().println(0);
            //判断旧密码是否存在
        } else if (!oldpassword.equals(tUser.getUserPwd())) {
            response.getWriter().println(1);
        } else {
            //调用service层执行修改密码
            TUser user = (TUser) request.getSession().getAttribute("user");
            tUser.setUserPwd(newpassword);
            System.out.println(tUser);
            ts.updateUserPassword(tUser);
            request.getSession().setAttribute("user", tUser);

            //清理session
            request.getSession().removeAttribute("user");
            //提示修改成功信号
            response.getWriter().println(2);
        }

    }


    /**
     * 用户管理分页和多条件查询
     */
    public void selectAll(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, ServletException {
        //默认页码号
        int nowPage = 1;
        //如果有分页请求
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        //搜索条件
        Map<String, String[]> map = request.getParameterMap();
        //参数对象化封装
        User u = new User();
        BeanUtils.populate(u, map);


        //每页的数据量
        int pageSize = 3;
        //获取所有
        List<User> users = ts.All(u, 0, 0);
        //总数据量
        int total = users.size();
        //需要的页码
        int pages = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;

        //当前页码展示的数据
        users = ts.All(u, nowPage, pageSize);


        //搜索的条件
        request.setAttribute("u", u);
        //当前页码号
        request.setAttribute("nowPage", nowPage);
        //总页码
        request.setAttribute("pages", pages);
        //当前页码需要展示数据
        request.setAttribute("users", users);
        request.getRequestDispatcher("user_list.jsp").forward(request, response);
    }

    /**
     * 修改用户状态
     */
    public void updateUserStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        if ("Y".equals(type)) {
            type = "N";
            int i = ts.updateUserStatus(type, id);
            response.getWriter().println(1);
        }else {
            type = "Y";
            int i = ts.updateUserStatus(type, id);
            response.getWriter().println(1);
        }


    }
}

