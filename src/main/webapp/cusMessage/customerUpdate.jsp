<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>客户信息修改</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
<c:if test="${userType==2}"> <a href="${pageContext.request.contextPath}/cusMessage/customerQueryAll.jsp">返回客户信息管理页面 </a> </c:if>
<c:if test="${userType==1}"> <a href="${pageContext.request.contextPath}/cusMessage/customerSearchRS.jsp">返回上一个页面 </a> </c:if>
<div style="margin-top:50px;"><Font size=4>
  <form action="${pageContext.request.contextPath}/CustomerService?type=update2" method=post
        onsubmit="return checkall();">
    <table width="450" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
            <tbody>
            <tr>
              <td align="center" colspan="2">客户信息修改</td>
            </tr>
            <tr>
              <td width="35%">客户名：</td>
              <td><Input type="text" name="name" id="name"
                         value="${Customer.name}" size=20></td>
            </tr>
            <tr>
              <td>联系电话：</td>
              <td><Input type="text" name="cusPhone" id="cusPhone"
                         value="${Customer.cusPhone}" size=20></td>
            </tr>
            <tr>
              <td>住址：</td>
              <td><Input type="text" name="cusAddress" id="cusAddress"
                         value="${Customer.cusAddress}" size=20></td>
            </tr>
            <tr>
              <td>车辆编号：</td>
              <td><Input type="text" name="carId" id="carId"
                         value="${Customer.carId}" size=20></td>
            </tr>
            <tr>
              <td>销售日期：</td>
              <td><Input type="text" name="saleDate" id="saleDate"
                         value="${Customer.saleDate}" size=20></td>
            </tr>
            <tr>
              <td>销售员id：</td>
              <td><Input type="text" name="sid" id="sid"
                         value="${Customer.sid}" size=20></td>
            </tr>
            <tr>
              <td align="center" colspan="2"><Input type="hidden" name="id" value="${Customer.id}">
                <Input type="submit" name="b" id="submitButton" value="提交修改" class="tj" style="font-size:16px"></td>
            </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </table>
  </FORM>
</Font></div>
</body>
</html>
<script language="javascript">
    function checkall() {
        var flag = true;
        var name = document.getElementById("name").value;
        var cusPhone = document.getElementById("cusPhone").value;
        var cusAddress = document.getElementById("cusAddress").value;
        var carId = document.getElementById("carId").value;
        var saleDate = document.getElementById("saleDate").value;
        var sid = document.getElementById("sid").value;
        if (name == "") {
            alert("请输入客户名！");
            flag = false;
            return false;
        } else if (cusPhone == "") {
            alert("请输入联系电话！");
            flag = false;
            return false;
        } else if (cusAddress == "") {
            alert("请输入住址！");
            flag = false;
            return false;
        } else if (carId == "") {
            alert("请输入车辆信息！");
            flag = false;
            return false;
        } else if (saleDate == "") {
            alert("请输入销售日期！");
            flag = false;
            return false;
        } else if (sid == "") {
            alert("请输入销售员id！");
            flag = false;
            return false;
        }
        if (flag == true) {
            //form.submit();
            return true;
        }
    }
</script>