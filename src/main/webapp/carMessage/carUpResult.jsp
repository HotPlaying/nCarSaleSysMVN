<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>汽车信息更新结果</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<a href="carQueryAll.jsp">返回汽车信息管理页面</a>
<div class="center"><h3>${result}&nbsp;&nbsp;
  <c:if test="${ifReAdd == 1}"><a href="addCar.jsp"></a><br></c:if>
</h3></div>
</body>
</html>