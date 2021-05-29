package com.ncarsalesys.login;

import com.ncarsalesys.dao.UserDAO;
import com.ncarsalesys.javabean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserDAO userdao = new UserDAO();

        User query = new User();
        query.setId(request.getParameter("id"));
        String password = request.getParameter("password");
        // 判断账号是否存在
        if (!userdao.IfIdExists(query)) {
            session.setAttribute("errorReport", "账号不存在，请重新输入");
            request.getRequestDispatcher("loginError.jsp").forward(request, response);
        } else {
            // 判断密码是否正确
            if (!query.getPassword().equals(password)) {
                session.setAttribute("errorReport", "账号或密码错误，请重新输入");
                request.getRequestDispatcher("loginError.jsp").forward(request, response);
            } else {
                // 判断用户类型
                session.setAttribute("userType", query.getUsertype());
                session.setAttribute("userId", query.getId());
                if (query.getUsertype().equals("2")) {
                    response.sendRedirect("userInterface/adminDetails.jsp");
                }
                if (query.getUsertype().equals("1")) {
                    response.sendRedirect("userInterface/salesmanDetails.jsp");
                }
                if (query.getUsertype().equals("0")) {
                    response.sendRedirect("userInterface/customerDetails.jsp");
                }
            }
        }
    }
}
