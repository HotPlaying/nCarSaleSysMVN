package com.ncarsalesys.dao;

import com.ncarsalesys.dbUtil.DBUtil;
import com.ncarsalesys.javabean.Customer;
import com.ncarsalesys.javabean.Messtext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement ptst = null;
    boolean flag = false;
    List<Customer> customerList = null;
    int line;

    public List<Customer> getCustomer() {
        return customerList;
    }

    public int getLine() {
        queryAllResult();
        return line;
    }

    public List<Customer> queryAllResult() {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from customer");
            customerList = new ArrayList<Customer>();
            rs.last();
            line = rs.getRow();
            rs.beforeFirst();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setId(rs.getString("id"));
                cus.setName(rs.getString("Name"));
                cus.setCusPhone(rs.getString("cusPhone"));
                cus.setCusAddress(rs.getString("cusAddress"));
                cus.setCarId(rs.getString("carId"));
                cus.setSaleDate(rs.getString("saleDate"));
                cus.setSid(rs.getString("sid"));
                customerList.add(cus);
            }
        } catch (Exception e) {
            System.out.println("tttt:" + e);
        } finally {
            closeDB();
        }
        return customerList;
    }

    public List<Customer> searchByName(String name) {
        List<Customer> customerList = new ArrayList<Customer>();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from customer where name like '%" + name + "%'";
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
            System.out.println("searchByCarName" + name);
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setId(rs.getString("id"));
                cus.setName(rs.getString("Name"));
                cus.setCusPhone(rs.getString("cusPhone"));
                cus.setCusAddress(rs.getString("cusAddress"));
                cus.setCarId(rs.getString("carId"));
                cus.setSaleDate(rs.getString("saleDate"));
                cus.setSid(rs.getString("sid"));
                customerList.add(cus);
            }
        } catch (Exception ex) {
            System.out.println("search by" + ex);
        } finally {
            closeDB();
        }
        return customerList;
    }

    public List<Customer> searchBySid(String sid) {
        List<Customer> customerList = new ArrayList<Customer>();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from customer where sid like '%" + sid + "%'";
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
            System.out.println("searchBySid" + sid);
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setId(rs.getString("id"));
                cus.setName(rs.getString("Name"));
                cus.setCusPhone(rs.getString("cusPhone"));
                cus.setCusAddress(rs.getString("cusAddress"));
                cus.setCarId(rs.getString("carId"));
                cus.setSaleDate(rs.getString("saleDate"));
                cus.setSid(rs.getString("sid"));
                customerList.add(cus);
            }
        } catch (Exception ex) {
            System.out.println("search by" + ex);
        } finally {
            closeDB();
        }
        return customerList;
    }

    public boolean updateMessage(Customer mess) {

        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "update customer set id=?,name=?,cusPhone=?,cusAddress=?,"
                    + "carId=?,saleDate=?,sid=? where id=?";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, mess.getId());
            ptst.setString(2, mess.getName());
            ptst.setString(3, mess.getCusPhone());
            ptst.setString(4, mess.getCusAddress());
            ptst.setString(5, mess.getCarId());
            ptst.setString(6, mess.getSaleDate());
            ptst.setString(7, mess.getSid());
            ptst.setString(8, mess.getId());
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

    public Customer searchById(String id) {
        Customer mess = new Customer();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select * from customer where id='" + id + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                mess.setId(rs.getString(1));
                mess.setName(rs.getString(2));
                mess.setCusPhone(rs.getString(3));
                mess.setCusAddress(rs.getString(4));
                mess.setCarId(rs.getString(5));
                mess.setSaleDate(rs.getString(6));
                mess.setSid(rs.getString(7));
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
            String condition = "delete from customer where id=?";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, id);
            if (ptst.executeUpdate() >= 1)
                flag = true;
        } catch (Exception ex) {
            flag = false;
        } finally {
            closeDB();
        }
        return flag;
    }

    public int searchById2(Customer query) {
        int mess = 0;
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from customer where id='" + query.getId() + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs == null) {
                mess = 0;
            }
            if (rs.next()) {
                query.setId(rs.getString("id"));
                mess = 1;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeDB();
        }
        return mess;
    }

    public String getSidByCusId(String id) {
        String sid = null;
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select sid from customer where id=" + id;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                sid = rs.getString(1);
            }
        } catch (Exception ex) {
            System.out.println("search by id" + ex);
        } finally {
            closeDB();
        }
        return sid;
    }

    public Messtext getComment(String cid) {
        Messtext mess = new Messtext();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select * from messtext where cid=" + cid;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                mess.setCid(rs.getString(1));
                mess.setSid(rs.getString(2));
                mess.setCmt(rs.getString(3));
                mess.setLem(rs.getString(4));
            }
        } catch (Exception ex) {
            System.out.println("search by id" + ex);
        } finally {
            closeDB();
        }
        return mess;
    }

    public boolean insertMessage(Customer mess) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "insert into customer values(?,?,?,?,?,?,?)";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, mess.getId());
            ptst.setString(2, mess.getName());
            ptst.setString(3, mess.getCusPhone());
            ptst.setString(4, mess.getCusAddress());
            ptst.setString(5, mess.getCarId());
            ptst.setString(6, mess.getSaleDate());
            ptst.setString(7, mess.getSid());
            System.out.println(ptst);
            if (ptst.executeUpdate() >= 1)
                flag = true;
        } catch (Exception ex) {
            flag = false;
        } finally {
            closeDB();
        }
        return flag;
    }

    public boolean insertMesstext(Messtext mess) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "insert into messtext values(?,?,?,?)";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, mess.getCid());
            ptst.setString(2, mess.getSid());
            ptst.setString(3, mess.getCmt());
            ptst.setString(4, mess.getLem());
            System.out.println(ptst);
            if (ptst.executeUpdate() >= 1)
                flag = true;
        } catch (Exception ex) {
            flag = false;
        } finally {
            closeDB();
        }
        return flag;
    }

    public boolean IfIdExists(String id) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from customer where id='" + id + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            System.out.println(stmt);
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

    public boolean IfMesstextExists(String id) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from messtext where cid='" + id + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
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
}
