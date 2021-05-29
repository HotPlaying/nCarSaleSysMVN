<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:set target="${pageContext.request}" property="characterEncoding"
       value="UTF-8"/>
<jsp:useBean id="guestCar" class="com.ncarsalesys.dao.CarDAO" scope="application"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="../styles.css">
  <title>汽车信息（管理员）</title>
</head>
<body>
<c:if test="${userType == 2}"><a href="../userInterface/adminDetails.jsp">返回主页</a></c:if>
<c:if test="${userType == 1}"><a href="../userInterface/salesmanDetails.jsp">返回主页</a></c:if>
<p class="subTitle">汽车信息</p>
<h3 align="center">一共有${guestCar.line}条汽车信息&nbsp;&nbsp;<a href="addCar.jsp">创建车辆信息</a></h3>
<c:choose>
  <c:when test="${line!=0 }">
    <table width="70%" border="5" align="center" bordercolor="#C9BAFF" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="1" align="center" cellpadding="2" cellspacing="2">
            <tbody>
            <tr>
              <td>编号</td>
              <td>型号</td>
              <td>颜色</td>
              <td>厂家</td>
              <td>日期</td>
              <td>价格</td>
              <td>操作</td>
            </tr>
            <c:forEach var="car" items="${guestCar.car}">
              <tr>
                <td>${car.carId}</td>
                <td>${car.carName}</td>
                <td>${car.color}</td>
                <td>${car.manufactor}</td>
                <td>${car.carDate}</td>
                <td>${car.carPrice}</td>
                <td><a href="../CarService?carId=${car.carId}&&type=delete">删除</a>
                  <a href="../CarService?carId=${car.carId}&&type=update1">修改</a></td>
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
  <FORM action="../CarService" Method="post">
    汽车信息记录查询(根据型号模糊查询记录):<br>
    输入型号:
    <Input type=text name="carName" id="carName">
    <Input type=submit
           name="g" value="提交">
    <Input type=hidden name="type"
           value="search" id="submitButton">
  </Form>
</div>
</body>
</html>