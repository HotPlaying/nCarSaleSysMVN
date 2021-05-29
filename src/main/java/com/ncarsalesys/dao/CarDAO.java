package com.ncarsalesys.dao;

import com.ncarsalesys.dbUtil.DBUtil;
import com.ncarsalesys.javabean.Car;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement ptst = null;
    boolean flag = false;
    List<Car> carList = null;
    int line = 0;

    public List<Car> getCar() {
        return carList;
    }

    public int getLine() {
        queryAllResult();
        return line;
    }

    public List<Car> queryAllResult() {
        try {
            carList = new ArrayList<Car>();
            DBUtil db = new DBUtil();
            conn = db.getCon();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from car");
            rs.last();
            line = rs.getRow();
            System.out.println("line = " + line);
            rs.beforeFirst();
            while (rs.next()) {
                Car car = new Car();
                car.setCarId(rs.getString("carId"));
                car.setCarName(rs.getString("carName"));
                car.setColor(rs.getString("color"));
                car.setManufactor(rs.getString("manufactor"));
                car.setCarDate(rs.getString("carDate"));
                car.setCarPrice(rs.getString("carPrice"));
                carList.add(car);
            }
        } catch (Exception e) {
            System.out.println("tttt:" + e);
        } finally {
            closeDB();
        }
        return carList;
    }

    public boolean updateMessage(Car mess) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition1 = "update car set carId=?,carName=?,color=?,manufactor=?,carDate=?,carPrice=? where carId=?";
            ptst = conn.prepareStatement(condition1);
            ptst.setString(1, mess.getCarId());
            ptst.setString(2, mess.getCarName());
            ptst.setString(3, mess.getColor());
            ptst.setString(4, mess.getManufactor());
            ptst.setString(5, mess.getCarDate());
            ptst.setString(6, mess.getCarPrice());
            ptst.setString(7, mess.getCarId_origin());
            System.out.println(ptst);
//			if (searchCusIfExistsCarId(mess.getCarId_origin())) {
//				String condition2 = "update customer set carId=? where carId=?";
//				ptst = conn.prepareStatement(condition2);
//				ptst.setString(1, mess.getCarId());
//				ptst.setString(2, mess.getCarId_origin());
//				System.out.println(ptst);
//			}
            if (ptst.executeUpdate() >= 1) {
                flag = true;
            }
        } catch (Exception ex) {
            flag = false;
        } finally {
            closeDB();
        }
        return flag;
    }

    public List<Car> searchByCarName(String carName) {
        List<Car> carList = new ArrayList<Car>();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from car where carName like '%" + carName + "%'";
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
            System.out.println("searchByCarName" + carName);
            while (rs.next()) {
                System.out.println("get");
                Car car = new Car();
                car.setCarId(rs.getString("carId"));
                car.setCarName(rs.getString("carName"));
                car.setColor(rs.getString("color"));
                car.setManufactor(rs.getString("manufactor"));
                car.setCarDate(rs.getString("carDate"));
                car.setCarPrice(rs.getString("carPrice"));
                carList.add(car);
            }
        } catch (Exception ex) {
            System.out.println("search by" + ex);
        } finally {
            closeDB();
        }
        return carList;
    }

    public Car searchById(String id) {
        Car mess = new Car();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select * from car where carId='" + id + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                mess.setCarId(rs.getString(1));
                mess.setCarName(rs.getString(2));
                mess.setColor(rs.getString(3));
                mess.setManufactor(rs.getString(4));
                mess.setCarDate(rs.getString(5));
                mess.setCarPrice(rs.getString(6));
            }
        } catch (Exception ex) {
            System.out.println("search by id" + ex);
        } finally {
            closeDB();
        }
        return mess;
    }

    public boolean deleteById(String id) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition1 = "delete from car where carId=?";
            ptst = conn.prepareStatement(condition1);
            ptst.setString(1, id);
            System.out.println(ptst);
//			if (searchCusIfExistsCarId(id)) {
//				String condition2 = "update customer set carDate=null,carId=null where carId=?";
//				ptst = conn.prepareStatement(condition2);
//				ptst.setString(1, id);
//				System.out.println(ptst);
//			}
            if (ptst.executeUpdate() >= 1)
                flag = true;
        } catch (Exception ex) {
            flag = false;
        } finally {
            closeDB();
        }
        return flag;
    }

    public boolean searchCusIfExistsCarId(String query) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from customer where carId='" + query + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs == null) {
                flag = false;
            }
            if (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeDB();
        }
        return flag;
    }

    public boolean insertMessage(Car mess) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "insert into car values(?,?,?,?,?,?)";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, mess.getCarId());
            ptst.setString(2, mess.getCarName());
            ptst.setString(3, mess.getColor());
            ptst.setString(4, mess.getManufactor());
            ptst.setString(5, mess.getCarDate());
            ptst.setString(6, mess.getCarPrice());
            if (ptst.executeUpdate() >= 1)
                flag = true;
        } catch (Exception ex) {
            flag = false;
        } finally {
            closeDB();
        }
        return flag;
    }

    public void closeDB() {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }

    public Car searchByCusId(String id) {
        Car mess = new Car();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select * from car where carId=(select carId from customer where id=" + id + ")";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                mess.setCarId(rs.getString(1));
                mess.setCarName(rs.getString(2));
                mess.setColor(rs.getString(3));
                mess.setManufactor(rs.getString(4));
                mess.setCarDate(rs.getString(5));
                mess.setCarPrice(rs.getString(6));
            }
        } catch (Exception ex) {
            System.out.println("search by id" + ex);
        } finally {
            closeDB();
        }
        return mess;
    }

    public boolean isExistByCid(String id) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select * from car where carId=(select carId from customer where id=" + id + ")";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("search by id" + ex);
        } finally {
            closeDB();
        }
        return flag;
    }
}
