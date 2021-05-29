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
  <title>汽车查询结果</title>
</head>
<body>
<a href="carQueryAll.jsp">返回汽车信息管理页面 </a> <br>
<h3 align="center">查询结果</h3>
<table width="70%" border="5" align="center" bordercolor="#C9BAFF" bgcolor="#FFFFFF">
  <tbody>
  <tr>
    <td>编号</td>
    <td>型号</td>
    <td>颜色</td>
    <td>厂家</td>
    <td>日期</td>
    <td>价格</td>
    <td>可选操作</td>
  </tr>
  <c:forEach var="car" items="${sessionScope.queryByName}">
    <tr>
      <td>${car.carId}</td>
      <td>${car.carName}</td>
      <td>${car.color}</td>
      <td>${car.manufactor}</td>
      <td>${car.carDate}</td>
      <td>${car.carPrice}</td>
      <td><a href="${pageContext.request.contextPath}/CarService?carId=${car.carId}&&type=delete">删除</a> <a
          href="${pageContext.request.contextPath}/CarService?carId=${car.carId}&&type=update1">修改</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>