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
  <title>销售员查询结果</title>
</head>
<body>
<a href="salesmanQueryAll.jsp">返回销售员信息管理页面 </a> <br>
<h3 align="center">查询结果</h3>
<table width="70%" border="5" align="center" bordercolor="#C9BAFF" bgcolor="#FFFFFF">
  <tbody>
  <tr>
    <td>员工账号</td>
    <td>员工姓名</td>
    <td>性别</td>
    <td>年龄</td>
    <td>籍贯</td>
    <td>学历</td>
    <td>操作</td>
  </tr>
  <c:forEach var="salesman" items="${sessionScope.query}">
    <tr>
      <td>${salesman.id}</td>
      <td>${salesman.name}
      <td>${salesman.sex}</td>
      <td>${salesman.age}</td>
      <td>${salesman.nativePlace}</td>
      <td>${salesman.education}</td>
      <td><a href="${pageContext.request.contextPath}/SalesmanService?id=${salesman.id}&&type=delete">删除</a> <a
          href="${pageContext.request.contextPath}/SalesmanService?id=${salesman.id}&&type=update1">修改</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>