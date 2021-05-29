<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>用户信息列表</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<jsp:useBean id="guestUser" class="com.ncarsalesys.dao.UserDAO" scope="application"/>
<a href="adminDetails.jsp">返回主页</a>
<p class="subTitle">用户信息列表</p>
<h3 align="center">一共有 ${guestUser.line}条用户信息</h3>
<c:choose>
  <c:when test="${line!=0 }">
    <table width="700" border="5" align="center" bordercolor="#C9BAFF" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="1" align="center" cellpadding="2" cellspacing="2">
            <tbody>
            <tr>
              <td>用户id</td>
              <!--<td>用户名</td>-->
              <td>用户密码</td>
              <td>用户类型</td>
              <!--<td>可选操作</td>-->
            </tr>
            <c:forEach var="user" items="${guestUser.user}">
              <tr>
                <td>${user.id}</td>
                <!--<td></td>-->
                <td>${user.password}</td>
                <td>${user.usertype}</td>
                <!--<td><a href="../UserService?id=${user.id}&&type=delete">删除</a> <a href="../UserService?id=${user.id}&&type=update1">修改</a></td>-->
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </td>
      </tr>
    </table>
  </c:when>
  <c:otherwise> <br>
    没有查询到任何记录!!!! </c:otherwise>
</c:choose>
</body>
</html>