<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:set target="${pageContext.request}" property="characterEncoding"
       value="UTF-8"/>
<jsp:useBean id="guestSalesman" class="com.ncarsalesys.dao.SalesmanDAO" scope="application"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="../styles.css">
  <title>员工信息</title>
</head>
<body>
<a href="../userInterface/adminDetails.jsp">返回主页</a>
<p class="subTitle">员工信息</p>
<h3 align="center">一共有${guestSalesman.line}条员工信息&nbsp;&nbsp;<a href="addSalesman.jsp">创建销售员信息</a></h3>
<c:choose>
  <c:when test="${line!=0 }">
    <table width="70%" border="5" align="center" bordercolor="#C9BAFF" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="1" align="center" cellpadding="2" cellspacing="2">
            <tbody>
            <tr>
              <td>员工账号</td>
              <td>员工姓名</td>
              <td>性别</td>
              <td>年龄</td>
              <td>籍贯</td>
              <td>学历</td>
              <td>操作</td>
            </tr>
            <c:forEach var="salesman" items="${guestSalesman.salesman}">
              <tr>
                <td>${salesman.id}</td>
                <td>${salesman.name}
                <td>${salesman.sex}</td>
                <td>${salesman.age}</td>
                <td>${salesman.nativePlace}</td>
                <td>${salesman.education}</td>
                <td><a href="../SalesmanService?id=${salesman.id}&&type=delete">删除</a> <a
                    href="../SalesmanService?id=${salesman.id}&&type=update1">修改</a></td>
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
  <FORM action="../SalesmanService" Method="post">
    销售员信息记录查询(根据名字模糊查询记录):<br>
    输入名字: <Input type=text name="name" id="name">
    <Input type=submit
           name="g" value="提交"> <Input type=hidden name="type"
                                       value="search" id="submitButton">
  </Form>
</div>
</body>
</html>