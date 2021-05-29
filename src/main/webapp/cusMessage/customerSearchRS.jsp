<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:set target="${pageContext.request}" property="characterEncoding"
       value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
  <title><c:if test="${userType == 2}">客户查询结果</c:if>
    <c:if test="${userType == 1}">客户信息管理</c:if></title>
</head>
<body>
<c:if test="${userType == 2}"> <a href="customerQueryAll.jsp">返回客户信息管理页面 </a> </c:if>
<c:if test="${userType == 1}"> <a href="../userInterface/salesmanDetails.jsp">返回主页 </a> </c:if>
<br>
<p class="subTitle">
  <c:if test="${userType == 2}">客户查询结果</c:if>
  <c:if test="${userType == 1}">客户信息管理</c:if>
</p>
<table width="70%" border="5" align="center" bordercolor="#C9BAFF" bgcolor="#FFFFFF">
  <tbody>
  <tr>
    <td>Id</td>
    <td>客户名</td>
    <td>联系电话</td>
    <td>住址</td>
    <td>车辆编号</td>
    <td>销售日期</td>
    <c:if test="${rs == 1}">
      <td>销售员id</td>
    </c:if>
    <td>操作</td>
  </tr>
  <c:forEach var="customer" items="${sessionScope.query}">
    <tr>
      <td>${customer.id}</td>
      <td>${customer.name}</td>
      <td>${customer.cusPhone}</td>
      <td>${customer.cusAddress}</td>
      <td>${customer.carId}</td>
      <td>${customer.saleDate}</td>
      <c:if test="${rs==1}">
        <td>${customer.sid}</td>
      </c:if>
      <td><a href="${pageContext.request.contextPath}/CustomerService?id=${customer.id}&&type=delete">删除</a>
        <a href="${pageContext.request.contextPath}/CustomerService?id=${customer.id}&&type=update1">修改</a></td>

    </tr>
  </c:forEach>
  </tbody>
</table>
<p class="LinkAlign">
  <c:if test="${userType == 1}"> <a href="addCustomer.jsp">添加客户信息 </a></c:if>
</p>
</body>
</html>