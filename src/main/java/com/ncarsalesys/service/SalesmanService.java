package com.ncarsalesys.service;

import com.ncarsalesys.dao.SalesmanDAO;
import com.ncarsalesys.dao.UserDAO;
import com.ncarsalesys.javabean.Salesman;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SalesmanService")
public class SalesmanService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String result = "销售员信息更新失败";
        boolean rs = false;
        Salesman sa = new Salesman();
        SalesmanDAO sadao = new SalesmanDAO();
        UserDAO userdao = new UserDAO();
        String type = request.getParameter("type");

        if ("update1".equals(type)) {
            sa = sadao.getSalesmanById(request.getParameter("id"));
            if (sa == null)
                response.sendRedirect("saMessage/salesmanUpResult.jsp");
            else {
                request.setAttribute("salesman", sa);
                request.getRequestDispatcher("saMessage/salesmanUpdate.jsp").forward(request, response);
            }

        } else if ("update2".equals(type)) {
            sa.setId(request.getParameter("id"));
            sa.setName(request.getParameter("name"));
            sa.setSex(request.getParameter("sex"));
            sa.setAge(request.getParameter("age"));
            sa.setNativePlace(request.getParameter("nativePlace"));
            sa.setEducation(request.getParameter("education"));
            rs = sadao.updateMessage(sa);
            if (sadao.updateMessage(sa)) {
                result = "销售员信息修改成功";
            }
            session.setAttribute("result", result);
            response.sendRedirect("saMessage/salesmanUpResult.jsp");

        } else if ("delete".equals(type)) {
            String id = request.getParameter("id");
            rs = sadao.deleteById(id);
            if (rs && userdao.deleteById(id))
                result = "销售员信息删除成功";
            else
                result = "销售员信息删除失败";
            session.setAttribute("result", result);
            response.sendRedirect("saMessage/salesmanUpResult.jsp");

        } else if ("add".equals(type)) {
            sa.setId(request.getParameter("id"));
            sa.setName(request.getParameter("name"));
            sa.setSex(request.getParameter("sex"));
            sa.setAge(request.getParameter("age"));
            sa.setNativePlace(request.getParameter("nativePlace"));
            sa.setEducation(request.getParameter("education"));
            rs = sadao.insertMessage(sa);
            if (!userdao.IfIdExists(sa.getId())) {
                userdao.insertMessage(sa.getId(), "1");
            }
            if (!sadao.IfIdExists(sa.getId())) {
                rs = sadao.insertMessage(sa);
                if (rs) {
                    result = "销售员信息添加成功";
                }
            } else {
                result = "销售员账号已存在，信息添加失败";
                session.setAttribute("ifReAdd", "1");
            }
            session.setAttribute("result", result);
            response.sendRedirect("saMessage/salesmanUpResult.jsp");
        } else if ("search".equals(type)) {
            String name = request.getParameter("name");
            System.out.println("search:" + name);
            List<Salesman> query = new ArrayList<Salesman>();
            if (name != null && !("".equals(name))) {
                query = sadao.searchByName(name);
                session.setAttribute("query", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("saMessage/salesmanSearchRS.jsp");
        } else if ("search1".equals(type)) {
            String id = request.getParameter("id");
            System.out.println("search:" + id);
            Salesman query = new Salesman();
            if (id != null && !("".equals(id))) {
                query = sadao.getSalesmanById(id);
                session.setAttribute("Salesman", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("saMessage/idMessage.jsp");
        } else if ("search2".equals(type)) {
            String id = request.getParameter("id");
            System.out.println("search:" + id);
            Salesman query = new Salesman();
            if (id != null && !("".equals(id))) {
                query = sadao.searchByCusId(id);
                session.setAttribute("Salesman", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("saMessage/idMessage.jsp");
        }
    }
}
