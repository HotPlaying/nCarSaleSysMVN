<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>汽车销售信息管理页面</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<div class="exL"><a href="..\ExitLogin">注销</a></div>
<table width="600" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td height="300">
      <table width="480" border="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
        <tr bgcolor="#6f92c8">
          <td width="25%" height="85" valign="bottom"></td>
          <td width="50%" align="center"><h1>你好，管理员</h1></td>
          <td align="center" valign="top"></td>
        </tr>
        <tr>
          <td height="50" colspan="3">
            <div class="mp_a">选择操作</div>
          </td>
        </tr>
        <tr>
          <td height="50" colspan="3">
            <div class="mp_a"><a href="..\carMessage\carQueryAll.jsp">查看所有汽车信息</a></div>
          </td>
        </tr>
        <tr>
          <td height="50" colspan="3">
            <div class="mp_a"><a href="..\cusMessage\customerQueryAll.jsp">查看所有顾客信息</a></div>
          </td>
        </tr>
        <tr>
          <td height="50" colspan="3">
            <div class="mp_a"><a href="..\saMessage\salesmanQueryAll.jsp">查看所有员工信息</a></div>
          </td>
        </tr>
        <tr>
          <td height="50" colspan="3">
            <div class="mp_a"><a href="userList.jsp">查看用户列表</a></div>
          </td>
        </tr>
        <tr>
          <td height="50" colspan="3">
            <div class="mp_a"><a href="adminPswReset.jsp">修改管理员密码</a></div>
          </td>
        </tr>
        <tr>
          <td height="50" colspan="3">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br>
</body>
</html>