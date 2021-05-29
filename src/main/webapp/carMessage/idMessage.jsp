<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>汽车信息</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<a href="../userInterface/customerDetails.jsp">返回主页</a>
<c:choose>
  <c:when test="${carExist == 1}">
    <p class="subTitle">我的汽车信息</p>
    <table width="400" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
            <tbody>
            <tr>
              <td align="center"><font size="5">汽车编号：</font></td>
              <td><font size="5">${car.carId} </font></td>
            </tr>
            <tr>
              <td align="center"><font size="5">汽车型号：</font></td>
              <td><font size="5">${car.carName} </font></td>
            </tr>
            <tr>
              <td align="center"><font size="5">车身颜色：</font></td>
              <td><font size="5">${car.color} </font></td>
            </tr>
            <tr>
              <td align="center"><font size="5">出厂地址：</font></td>
              <td><font size="5">${car.manufactor} </font></td>
            </tr>
            <tr>
              <td align="center"><font size="5">出厂日期：</font></td>
              <td><font size="5">${car.carDate} </font></td>
            </tr>
            <tr>
              <td align="center"><font size="5">出售价格：</font></td>
              <td><font size="5">${car.carPrice} </font></td>
            </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </table>
  </c:when>
  <c:otherwise>
    <div class="center"><h3>你没有汽车</h3></div>
  </c:otherwise>
</c:choose>
<p align="center"><font size="+2">
</font></p>
</body>
</html>