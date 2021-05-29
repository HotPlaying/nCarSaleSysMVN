<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>客户汽车信息管理页面</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<div class="exL"><a href="..\ExitLogin">注销</a></div>
<table width="480" border="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
  <tr bgcolor="#6f92c8">
    <td width="25%" height="85" valign="bottom"></td>
    <td width="50%" align="center"><h1>你好，客户${userId}号</h1></td>
    <td align="center" valign="top"></td>
  </tr>
  <tr>
    <td height="50" colspan="3">
      <div class="mp_a">选择操作</div>
    </td>
  </tr>
  <tr>
    <td height="50" colspan="3">
      <div class="mp_a"><a href="../CustomerService?type=search2&&id=${userId}">查看我的个人信息</a></div>
    </td>
  </tr>
  <tr>
    <td height="50" colspan="3">
      <div class="mp_a"><a href="../CarService?type=search1&&id=${userId}">查看我的汽车信息</a></div>
    </td>
  </tr>
  <tr>
    <td height="50" colspan="3">
      <div class="mp_a"><a href="../CustomerService?type=comment&&id=${userId}">查看或给销售人员留言及评论</a></div>
    </td>
  </tr>
  <tr>
    <td height="50" colspan="3">&nbsp;</td>
  </tr>
</table>
<br>
</body>
</html>