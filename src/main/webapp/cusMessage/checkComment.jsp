<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="../styles.css">
  <title>查看给销售员的评论及留言</title>
</head>
<body>
<a href="../userInterface/customerDetails.jsp">返回主页</a>
<div align="center">
  <p class="subTitle">给销售员的评论及留言</p>
  <table width="300" border="1" bgcolor="#FFFFFF">
    <tbody>
    <tr>
      <td height="20">评论内容：</td>
    </tr>
    <tr>
      <td height="60">${messtext.cmt}</td>
    </tr>
    <tr>
      <td height="20">留言内容：</td>
    </tr>
    <tr>
      <td height="60">${messtext.lem}</td>
    </tr>
    </tbody>
  </table>
</div>
</body>
</html>
