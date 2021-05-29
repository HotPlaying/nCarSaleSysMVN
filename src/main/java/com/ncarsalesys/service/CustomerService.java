package com.ncarsalesys.service;

import com.ncarsalesys.dao.CustomerDAO;
import com.ncarsalesys.dao.UserDAO;
import com.ncarsalesys.javabean.Customer;
import com.ncarsalesys.javabean.Messtext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CustomerService")
public class CustomerService extends HttpServlet {
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
        Customer cus = new Customer();
        CustomerDAO cusdao = new CustomerDAO();
        UserDAO userdao = new UserDAO();
        String type = request.getParameter("type");

        if ("update1".equals(type)) {
            cus = cusdao.searchById(request.getParameter("id"));
            if (cus == null)
                response.sendRedirect("cusMessage/customerUpResult.jsp");
            else {
                request.setAttribute("Customer", cus);
                request.getRequestDispatcher("cusMessage/customerUpdate.jsp").forward(request, response);
            }

        } else if ("update2".equals(type)) {
            cus.setId(request.getParameter("id"));
            cus.setName(request.getParameter("name"));
            cus.setCusPhone(request.getParameter("cusPhone"));
            cus.setCusAddress(request.getParameter("cusAddress"));
            cus.setCarId(request.getParameter("carId"));
            cus.setSaleDate(request.getParameter("saleDate"));
            cus.setSid(request.getParameter("sid"));
            rs = cusdao.updateMessage(cus);
            if (rs) {
                result = "客户信息更新成功";
            } else {
                result = "客户信息更新失败";
            }
            session.setAttribute("result", result);
            response.sendRedirect("cusMessage/customerUpResult.jsp");

        } else if ("delete".equals(type)) {
            String id = request.getParameter("id");
            rs = cusdao.deleteById(id);
            if (rs && userdao.deleteById(id))
                result = "客户信息删除成功";
            else
                result = "客户信息删除失败";
            session.setAttribute("result", result);
            response.sendRedirect("cusMessage/customerUpResult.jsp");

        } else if ("add".equals(type)) {
            System.out.println("insert");
            cus.setId(request.getParameter("id"));
            cus.setName(request.getParameter("name"));
            cus.setCusPhone(request.getParameter("cusPhone"));
            cus.setCusAddress(request.getParameter("cusAddress"));
            cus.setCarId(request.getParameter("carId"));
            cus.setSaleDate(request.getParameter("saleDate"));
            cus.setSid(request.getParameter("sid"));
            if (!userdao.IfIdExists(cus.getId())) {
                userdao.insertMessage(cus.getId(), "0");
            }
            if (!cusdao.IfIdExists(cus.getId())) {
                rs = cusdao.insertMessage(cus);
                if (rs) {
                    result = "客户信息添加成功";
                }
            } else {
                result = "客户账号已存在，信息添加失败";
                session.setAttribute("ifReAdd", "1");
            }
            session.setAttribute("result", result);
            response.sendRedirect("cusMessage/customerUpResult.jsp");
        } else if ("search".equals(type)) {
            String name = request.getParameter("name");
            List<Customer> query = new ArrayList<Customer>();
            if (name != null && !("".equals(name))) {
                query = cusdao.searchByName(name);
                session.setAttribute("query", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("cusMessage/customerSearchRS.jsp");
        } else if ("search1".equals(type)) {
            String id = request.getParameter("id");
            List<Customer> query = new ArrayList<Customer>();
            if (id != null && !("".equals(id))) {
                query = cusdao.searchBySid(id);
                session.setAttribute("query", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("cusMessage/customerSearchRS.jsp");
        } else if ("search2".equals(type)) {
            String id = request.getParameter("id");
            Customer query = new Customer();
            if (id != null && !("".equals(id))) {
                query = cusdao.searchById(id);
                session.setAttribute("customer", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("cusMessage/idMessage.jsp");
        } else if ("comment".equals(type)) {
            String cid = request.getParameter("id");
            if (cusdao.IfMesstextExists(cid)) {
                Messtext mt = new Messtext();
                mt = cusdao.getComment(cid);
                session.setAttribute("messtext", mt);
                response.sendRedirect("cusMessage/checkComment.jsp");
            } else {
                response.sendRedirect("cusMessage/addComment.jsp");
            }
        } else if ("comment1".equals(type)) {
            String cid = request.getParameter("id");
            Messtext mess = new Messtext();
            mess.setCid(cid);
            mess.setSid(cusdao.getSidByCusId(cid));
            mess.setCmt(request.getParameter("cmt"));
            mess.setLem(request.getParameter("lem"));
            rs = cusdao.insertMesstext(mess);
            if (rs)
                result = "留言添加成功";
            else
                result = "留言添加失败";
            session.setAttribute("result", result);
            response.sendRedirect("cusMessage/customerUpResult.jsp");
        }
    }
}
