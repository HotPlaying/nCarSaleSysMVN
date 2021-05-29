<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>添加销售员信息</title>
  <link rel="stylesheet" type="text/css" href="..\styles.css">
</head>

<body>
<a href="salesmanQueryAll.jsp">返回销售员信息管理页面 </a>
<form action="../SalesmanService?type=add" method="post" onsubmit="return checkall();">
  <div style="margin-top:50px;">
    <table width="350" border="5" align="center" bordersex="#C9BAFF" height="200" bgsex="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgsex="#FFFFFF">
            <tbody>
            <tr>
              <td align="center"><font size="4">添加销售员 </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">编号：
                <input type="text" size="15" name="id" id="id">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">姓名：
                <input type="text" size="15" name="name" id="name">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">性别：
                <input type="text" size="15" name="sex" id="sex">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">年龄：
                <input type="text" size="15" name="age" id="age">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">生日：
                <input type="text" size="15" name="nativePlace" id="nativePlace">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">教育：
                <input type="text" size="15" name="education" id="education">
              </font></td>
            </tr>
            <tr>
              <td align="center"><input type="submit" id="submitButton" value="添&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp加"
                                        class="tj" style='font-size:16px'>
                <Input type=hidden name="type" value="add"></td>
            </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </table>
  </div>
</form>
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