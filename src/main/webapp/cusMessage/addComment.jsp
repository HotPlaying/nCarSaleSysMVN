<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>给销售员评论及留言</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<a href="../userInterface/customerDetails.jsp">返回主页</a>
<div>
  <form action="../CustomerService?type=comment1&&id=${userId}" method="post">
    <h3>给销售员评论及留言</h3>
    <p>评论内容：</p>
    <textarea name="cmt" cols="40" rows="5" id="cmt"></textarea>
    <p>留言内容：</p>
    <textarea name="lem" cols="40" rows="5" id="lem"></textarea>
    <br>
    <input type="reset">
    <input type="submit" value="提交">
  </form>
</div>
</body>
</html>