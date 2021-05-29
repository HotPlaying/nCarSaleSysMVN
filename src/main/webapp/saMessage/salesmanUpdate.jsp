<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>修改销售员信息</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
<a href="${pageContext.request.contextPath}/saMessage/salesmanQueryAll.jsp">返回销售员信息管理页面 </a>
<div style="margin-top: 50px;"><Font size=4>
  <form action="${pageContext.request.contextPath}/SalesmanService?type=update2" method=post
        onsubmit="return checkall();">
    <table width="450" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
            <tbody>
            <tr>
              <td align="center" colspan="2">销售员信息修改</td>
            </tr>
            <tr>
              <td align="center" width="35%"><font size="4">编号：</td>
              <td><input type="text" size="15" name="id" id="id" value="${salesman.id}" size="40">
</font></td>
  </tr>
  <tr>
    <td align="center"><font size="4">型号：</td>
    <td><input type="text" size="15" name="name" id="name" value="${salesman.name}" size="40">
      </font></td>
  </tr>
  <tr>
    <td align="center"><font size="4">性别：</td>
    <td><input type="text" size="15" name="sex" id="sex" value="${salesman.sex}" size="40">
      </font></td>
  </tr>
  <tr>
    <td align="center"><font size="4">年龄：</td>
    <td><input type="text" size="15" name="age" id="age" value="${salesman.age}" size="40">
      </font></td>
  </tr>
  <tr>
    <td align="center"><font size="4">生日：</td>
    <td><input type="text" size="15" name="nativePlace" id="nativePlace" value="${salesman.nativePlace}" size="40">
      </font></td>
  </tr>
  <tr>
    <td align="center"><font size="4">教育：</td>
    <td><input type="text" size="15" name="education" id="education" value="${salesman.education}" size="40">
      </font></td>
  </tr>
  <tr>
    <td align="center" colspan="2"><input type="submit" id="submitButton" value="提交修改" class="tj"
                                          style='font-size:16px'>
      <Input type=hidden name="type" value="add"></td>
  </tr>
  </tbody>
  </table></td>
  </tr>
  </table>
  </form>
  </Font> </div>
</body>
</html>
<script language="javascript">
    function checkall() {
        var flag = true;
        var id = document.getElementById("id").value;
        var name = document.getElementById("name").value;
        var sex = document.getElementById("sex").value;
        var age = document.getElementById("age").value;
        var nativePlace = document.getElementById("nativePlace").value;
        var education = document.getElementById("education").value;
        if (id == "") {
            alert("请输入编号！");
            flag = false;
            return false;
        } else if (name == "") {
            alert("请输入名字！");
            flag = false;
            return false;
        } else if (sex == "") {
            alert("请输入性别！");
            flag = false;
            return false;
        } else if (age == "") {
            alert("请输入年龄！");
            flag = false;
            return false;
        } else if (nativePlace == "") {
            alert("请输入籍贯！");
            flag = false;
            return false;
        } else if (education == "") {
            alert("请输入教育！");
            flag = false;
            return false;
        }
        if (flag == true) {
            //form.submit();
            return true;
        }
    }
</script>