package com.ncarsalesys.dao;

import com.ncarsalesys.dbUtil.DBUtil;
import com.ncarsalesys.javabean.Salesman;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalesmanDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement ptst = null;
    boolean flag = false;
    List<Salesman> salesmanList = null;
    int line;

    public List<Salesman> getSalesman() {
        return salesmanList;
    }

    public int getLine() {
        queryAllResult();
        return line;
    }

    public List<Salesman> queryAllResult() {
        try {
            salesmanList = new ArrayList<Salesman>();
            DBUtil db = new DBUtil();
            conn = db.getCon();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from salesman");
            rs.last();
            line = rs.getRow();
            rs.beforeFirst();
            while (rs.next()) {
                Salesman sa = new Salesman();
                sa.setId(rs.getString("id"));
                sa.setName(rs.getString("Name"));
                sa.setSex(rs.getString("sex"));
                sa.setAge(rs.getString("age"));
                sa.setNativePlace(rs.getString("nativePlace"));
                sa.setEducation(rs.getString("education"));
                salesmanList.add(sa);
            }
        } catch (Exception e) {
            System.out.println("tttt:" + e);
        } finally {
            closeDB();
        }
        return salesmanList;
    }

    public List<Salesman> searchByName(String name) {
        List<Salesman> salesmanList = new ArrayList<Salesman>();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from salesman where name like '%" + name + "%'";
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
            System.out.println("searchByCarName" + name);
            while (rs.next()) {
                Salesman sa = new Salesman();
                sa.setId(rs.getString("id"));
                sa.setName(rs.getString("Name"));
                sa.setSex(rs.getString("sex"));
                sa.setAge(rs.getString("age"));
                sa.setNativePlace(rs.getString("nativePlace"));
                sa.setEducation(rs.getString("education"));
                salesmanList.add(sa);
            }
        } catch (Exception ex) {
            System.out.println("search by" + ex);
        } finally {
            closeDB();
        }
        return salesmanList;
    }

    public boolean updateMessage(Salesman mess) {

        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "update salesman set id=?,name=?,sex=?,age=?,nativePlace=?,education=? where id=?";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, mess.getId());
            ptst.setString(2, mess.getName());
            ptst.setString(3, mess.getSex());
            ptst.setString(4, mess.getAge());
            ptst.setString(5, mess.getNativePlace());
            ptst.setString(6, mess.getEducation());
            ptst.setString(7, mess.getId());
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

    public Salesman getSalesmanById(String id) {
        Salesman mess = new Salesman();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select * from salesman where id='" + id + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                mess.setId(rs.getString(1));
                mess.setName(rs.getString(2));
                mess.setSex(rs.getString(3));
                mess.setAge(rs.getString(4));
                mess.setNativePlace(rs.getString(5));
                mess.setEducation(rs.getString(6));
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
            String condition = "delete from salesman where id=?";
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

    public boolean insertMessage(Salesman mess) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "insert into salesman values(?,?,?,?,?,?)";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, mess.getId());
            ptst.setString(2, mess.getName());
            ptst.setString(3, mess.getSex());
            ptst.setString(4, mess.getAge());
            ptst.setString(5, mess.getNativePlace());
            ptst.setString(6, mess.getEducation());
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
            String sql = "select * from salesman where id='" + id + "'";
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

    public Salesman searchByCusId(String id) {
        Salesman mess = new Salesman();
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "select * from salesman where Id= (select sid from customer where id=" + id + ")";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(condition);
            if (rs.next()) {
                mess.setId(rs.getString(1));
                mess.setName(rs.getString(2));
                mess.setSex(rs.getString(3));
                mess.setAge(rs.getString(4));
                mess.setNativePlace(rs.getString(5));
                mess.setEducation(rs.getString(6));
            }
        } catch (Exception ex) {
            System.out.println("search by id" + ex);
        } finally {
            closeDB();
        }
        return mess;
    }
}
