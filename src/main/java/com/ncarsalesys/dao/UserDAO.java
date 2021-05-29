package com.ncarsalesys.dao;

import com.ncarsalesys.dbUtil.DBUtil;
import com.ncarsalesys.javabean.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement ptst = null;
    boolean flag = false;

    List<User> userList = null;
    int line;

    public List<User> getUser() {
        return userList;
    }

    public int getLine() {
        queryAllResult();
        return line;
    }

    public List<User> queryAllResult() {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from userlist");
            userList = new ArrayList<User>();
            rs.last();
            line = rs.getRow();
            rs.beforeFirst();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getString("id"));
                user.setPassword(rs.getString("password"));
                user.setUsertype(rs.getString("usertype"));
                userList.add(user);
            }
        } catch (Exception e) {
            System.out.println("tttt:" + e);
        } finally {
            closeDB();
        }
        return userList;
    }

    // 查找id是否存在于数据库，并将数据库值赋值此用户对象
    public boolean IfIdExists(User query) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from userlist where id='" + query.getId() + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                query.setPassword(rs.getString("password"));
                query.setUsertype(rs.getString("usertype"));
                flag = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeDB();
        }
        return flag;
    }

    public boolean insertMessage(String id, String userType) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "insert into userlist values(?,'123',?)";
            ptst = conn.prepareStatement(condition);
            ptst.setString(1, id);
            ptst.setString(2, userType);
            System.out.println(ptst);
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

    public boolean deleteById(String id) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "delete from userlist where id=" + id;
            ptst = conn.prepareStatement(condition);
            System.out.println(ptst);
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

    public boolean IfIdExists(String id) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from userlist where id='" + id + "'";
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

    public boolean IsAdminPswRight(String password) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String sql = "select * from userlist where usertype='2'and password='" + password + "'";
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

    public boolean adminPswReset(String password) {
        try {
            DBUtil db = new DBUtil();
            conn = db.getCon();
            String condition = "update userlist set password=" + password + " where usertype='2'";
            ptst = conn.prepareStatement(condition);
            System.out.println(ptst);
            if (ptst.executeUpdate() >= 1) {
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
