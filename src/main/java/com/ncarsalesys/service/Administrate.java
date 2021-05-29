package com.ncarsalesys.service;

import com.ncarsalesys.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/Administrate")
public class Administrate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String result = "操作失败";
        boolean rs = false;
        String type = request.getParameter("type");

        UserDAO userdao = new UserDAO();

        if ("passwordReset".equals(type)) {
            if (!userdao.IsAdminPswRight(request.getParameter("lastPsw"))) {
                result = "原密码错误，操作失败";
            } else {
                rs = userdao.adminPswReset(request.getParameter("newPsw"));
                if (rs) {
                    result = "管理员密码修改成功";
                }
            }
            session.setAttribute("result", result);
            response.sendRedirect("userInterface/operationRS.jsp");
        }

    }
}
