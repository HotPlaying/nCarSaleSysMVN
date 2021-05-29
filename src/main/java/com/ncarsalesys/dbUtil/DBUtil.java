package com.ncarsalesys.dbUtil;

import org.junit.jupiter.api.Test;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {
    private static final String DBURL = "jdbc:mysql://localhost:3306/ncarsalesys";
    private static final String DBUSER = "root";
    private static final String DBPASSWORD = "";
    private static final String DBDRIVER = "com.mysql.jdbc.Driver";

    public Connection getCon() throws Exception {
        Class.forName(DBDRIVER);
        Connection conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
        System.out.println("数据库连接成功");
        return conn;
    }

    public void closeCon(Connection conn){
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        DBUtil dbUtil = new DBUtil();
        Connection conn = null;
        try {
            conn = dbUtil.getCon();
            //System.out.println("数据库连接成功");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeCon(conn);
        }
    }

    @Test
    public void getConnection() throws Exception{
        //1. 准备连接数据库的 4 个字符串.
        //1). 创建 Properties 对象
        Properties properties = new Properties();

        //2). 获取 jdbc.properties 对应的输入流
        InputStream in =
                this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");

        //3). 加载 2） 对应的输入流
        properties.load(in);

        //4). 具体决定 user, password 等4 个字符串.
        String user = properties.getProperty("user");
        String password = properties.getProperty("password");
        String jdbcUrl = properties.getProperty("jdbcUrl");
        String driver = properties.getProperty("driver");

        //2. 加载数据库驱动程序(对应的 Driver 实现类中有注册驱动的静态代码块)
        Class.forName(driver);

        //3. 通过 DriverManager 的 getConnection() 方法获取数据库连接
        Connection connection = DriverManager.getConnection(jdbcUrl, user, password);

        System.out.println(connection);
    }
}
