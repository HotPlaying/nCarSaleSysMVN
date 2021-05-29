package com.ncarsalesys.service;

import com.ncarsalesys.dao.CarDAO;
import com.ncarsalesys.javabean.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CarService")
public class CarService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String result;
        boolean rs = false;
        Car car = new Car();
        CarDAO cardao = new CarDAO();
        String type = request.getParameter("type");

        if ("update1".equals(type)) {
            car = cardao.searchById(request.getParameter("carId"));
            if (car == null) {
                result = "汽车信息更新失败";
                session.setAttribute("result", result);
                response.sendRedirect("carMessage/carUpResult.jsp");
            } else {
                request.setAttribute("car", car);
                request.getRequestDispatcher("carMessage/carUpdate.jsp").forward(request, response);
            }

        } else if ("update2".equals(type)) {
            car.setCarId(request.getParameter("carId"));
            car.setCarName(request.getParameter("carName"));
            car.setColor(request.getParameter("color"));
            car.setManufactor(request.getParameter("manufactor"));
            car.setCarDate(request.getParameter("carDate"));
            car.setCarPrice(request.getParameter("carPrice"));
            car.setCarId_origin(request.getParameter("carId_origin"));
            rs = cardao.updateMessage(car);

            if (rs) {
                result = "汽车信息更新成功";
            } else {
                result = "汽车信息更新失败";
            }
            session.setAttribute("result", result);
            response.sendRedirect("carMessage/carUpResult.jsp");

        } else if ("delete".equals(type)) {
            System.out.println("delete:");
            rs = cardao.deleteById(request.getParameter("carId"));
            if (rs)
                result = "汽车信息删除成功";
            else
                result = "汽车信息删除失败";
            session.setAttribute("result", result);
            response.sendRedirect("carMessage/carUpResult.jsp");

        } else if ("add".equals(type)) {
            car.setCarId(request.getParameter("carId"));
            car.setCarName(request.getParameter("carName"));
            car.setColor(request.getParameter("color"));
            car.setManufactor(request.getParameter("manufactor"));
            car.setCarDate(request.getParameter("carDate"));
            car.setCarPrice(request.getParameter("carPrice"));
            rs = cardao.insertMessage(car);
            if (rs)
                result = "汽车信息添加成功";
            else {
                result = "汽车信息添加失败";
                session.setAttribute("ifReAdd", "1");
            }
            session.setAttribute("result", result);
            response.sendRedirect("carMessage/carUpResult.jsp");

        } else if ("search".equals(type)) {
            String carName = request.getParameter("carName");
            System.out.println("search:" + carName);
            List<Car> query = new ArrayList<Car>();
            if (carName != null && !("".equals(carName))) {
                query = cardao.searchByCarName(carName);
                session.setAttribute("queryByName", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("carMessage/carSearchRS.jsp");
        } else if ("search1".equals(type)) {
            String id = request.getParameter("id");
            if (!cardao.isExistByCid(id)) {
                session.setAttribute("carExist", 0);
            } else {
                Car query = new Car();
                query = cardao.searchByCusId(id);
                session.setAttribute("carExist", 1);
                session.setAttribute("car", query);
                System.out.println("result:" + query);
            }
            response.sendRedirect("carMessage/idMessage.jsp");
        }
    }
}
