<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>客户个人信息</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<a href="../userInterface/customerDetails.jsp">返回主页</a>
<p class="subTitle">客户个人信息</p>
<br>
<table width="400" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
  <tr>
    <td>
      <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
        <tbody>
        <tr>
          <td align="center"><font size="5">账号：</font></td>
          <td><font size="5">${customer.id} </font></td>
        </tr>
        <tr>
          <td align="center"><font size="5">姓名：</font></td>
          <td><font size="5">${customer.name} </font></td>
        </tr>
        <tr>
          <td align="center"><font size="5">电话：</font></td>
          <td><font size="5">${customer.cusPhone} </font></td>
        </tr>
        <tr>
          <td align="center"><font size="5">地址：</font></td>
          <td><font size="5">${customer.cusAddress} </font></td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>
</body>
</html>