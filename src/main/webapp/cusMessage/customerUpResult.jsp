<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>客户信息更新结果</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<c:if test="${userType == 2}"> <a href="customerQueryAll.jsp">返回客户信息管理页面 </a> </c:if>
<c:if test="${userType == 1}"><br><a href="..\CustomerService?type=search1&&id=${userId}">返回客户信息页面 </a> </c:if>
<c:if test="${userType == 0}"><a href="../userInterface/customerDetails.jsp">返回主页 </a></c:if>
<div class="center"><h3>${result}&nbsp;&nbsp;
  <c:if test="${ifReAdd == '1'}"><a href="addCustomer.jsp"></a><br></c:if></h3></div>
</body>
</html>