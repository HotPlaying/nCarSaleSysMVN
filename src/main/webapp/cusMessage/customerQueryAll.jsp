<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set target="${pageContext.request}" property="characterEncoding" value="UTF-8"/>
<jsp:useBean id="guestCustomer" class="com.ncarsalesys.dao.CustomerDAO" scope="application"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>客户信息</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<a href="../userInterface/adminDetails.jsp">返回主页</a>
<p class="subTitle">客户信息</p>
<h3 align="center">一共有 ${guestCustomer.line}条客户信息&nbsp;&nbsp;<a href="addCustomer.jsp">创建客户信息</a></h3>
<c:choose>
  <c:when test="${line!=0 }">
    <table width="700" border="5" align="center" bordercolor="#C9BAFF" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="1" align="center" cellpadding="2" cellspacing="2">
            <tbody>
            <tr>
              <td>id</td>
              <td>客户名</td>
              <td>联系电话</td>
              <td>住址</td>
              <td>车辆编号</td>
              <td>销售日期</td>
              <td>销售员id</td>
              <td>可选操作</td>
            </tr>
            <c:forEach var="customer" items="${guestCustomer.customer}">
              <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.cusPhone}</td>
                <td>${customer.cusAddress}</td>
                <td>${customer.carId}</td>
                <td>${customer.saleDate}</td>
                <td>${customer.sid}</td>
                <td><a href="../CustomerService?id=${customer.id}&&type=delete">删除</a>
                  <a href="../CustomerService?id=${customer.id}&&type=update1">修改</a></td>
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
<div id="ser">
  <FORM action="../CustomerService" Method="post">
    客户信息记录查询(根据名字模糊查询记录):<br>
    输入名字:
    <Input type=text name="name" id="name">
    <Input type=submit name="g" value="提交">
    <Input type=hidden name="type" value="search" id="submitButton">
  </Form>
</div>
</body>
</html>
