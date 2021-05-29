<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>添加客户信息</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<c:if test="${userType == 2}"> <a href="customerQueryAll.jsp">返回客户信息管理页面 </a> </c:if>
<c:if test="${userType == 1}"> <a href="customerSearchRS.jsp">返回客户信息页面 </a> </c:if>
<form action="../CustomerService" method="post" onsubmit="return checkall();">
  <div style="margin-top:50px;">
    <table width="350" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
            <tbody>
            <tr>
              <td align="center"><font size="4">添加客户 </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">客户账号：
                <input type="text" size="15" name="id" id="id">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">客户姓名：
                <input type="text" size="15" name="name" id="name">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">联系电话：
                <input type="text" size="15" name="cusPhone" id="cusPhone">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">联系地址：
                <input type="text" size="15" name="cusAddress" id="cusAddress">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">汽车编号：
                <input type="text" size="15" name="carId" id="carId">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">销售日期：
                <input type="text" size="15" name="saleDate" id="saleDate">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">销售员编号：
                <c:if test="${userType == 2}">
                  <input type="text" size="15" name="sid" id="sid"></c:if>
                <c:if test="${userType == 1}">
                  <input type="text" size="15" name="sid" id="sid" value="${userId}" readonly="readonly">
                </c:if>

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
        var cusPhone = document.getElementById("cusPhone").value;
        var cusAddress = document.getElementById("cusAddress").value;
        var carId = document.getElementById("carId").value;
        var saleDate = document.getElementById("saleDate").value;
        var sid = document.getElementById("sid").value;
        if (id == "") {
            alert("请输入客户账号！");
            flag = false;
            return false;
        } else if (name == "") {
            alert("请输入客户姓名！");
            flag = false;
            return false;
        } else if (cusPhone == "") {
            alert("请输入联系电话！");
            flag = false;
            return false;
        } else if (cusAddress == "") {
            alert("请输入联系地址！");
            flag = false;
            return false;
        } else if (carId == "") {
            alert("请输入汽车型号！");
            flag = false;
            return false;
        } else if (saleDate == "") {
            alert("请输入销售日期！");
            flag = false;
            return false;
        } else if (sid == "") {
            alert("请输入销售员编号！");
            flag = false;
            return false;
        }
        if (flag == true) {
            //form.submit();
            return true;
        }
    }
</script>