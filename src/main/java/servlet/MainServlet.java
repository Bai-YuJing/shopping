package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MainServlet",value = "/")
public class MainServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("匹配根路径请求");
        //这里的/ 表示服务器中项目的虚拟路径  http://localshot:8888/
        req.getRequestDispatcher("main.jsp").forward(req,resp);

    }
}
