<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>个人信息</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<c:if test="${userType == 1}">
  <a href="../userInterface/salesmanDetails.jsp">返回主页</a>
</c:if>
<c:if test="${userType == 0}">
  <a href="../userInterface/customerDetails.jsp">返回主页</a>
</c:if>
<p align="center"><font face="华文琥珀" size="+4" color="#102143">员工信息</font></p>
<br>
<table width="400" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
  <tr>
    <td>
      <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
        <tbody>
        <tr>
          <td align="center"><font size="5">账号：</font></td>
          <td><font size="5">${Salesman.id} </font>
            <Input type="hidden" name="id" value='${Salesman.id}'></td>
        </tr>
        <tr>
          <td align="center"><font size="5">姓名：</font></td>
          <td><font size="5">${Salesman.name} </font>
            <Input type="hidden" name="name" value='${Salesman.name}'></td>
        </tr>
        <tr>
          <td align="center"><font size="5">性别：</font></td>
          <td><font size="5">${Salesman.sex} </font>
            <Input type="hidden" name="sex" value='${Salesman.sex}'></td>
        </tr>
        <tr>
          <td align="center"><font size="5">年龄：</font></td>
          <td><font size="5">${Salesman.age} </font>
            <Input type="hidden" name="age" value='${Salesman.age}'></td>
        </tr>
        <tr>
          <td align="center"><font size="5">籍贯：</font></td>
          <td><font size="5">${Salesman.nativePlace} </font>
            <Input type="hidden" name="nativePlace" value='${Salesman.nativePlace}'></td>
        </tr>
        <tr>
          <td align="center"><font size="5">学历：</font></td>
          <td><font size="5">${Salesman.education} </font>
            <Input type="hidden" name="education" value='${Salesman.education}'></td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>
</body>
</html>