<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>修改汽车信息</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>

<body>
<a href="${pageContext.request.contextPath}/carMessage/carQueryAll.jsp">返回汽车数据页面</a>
<div style="margin-top: 50px;"><Font size=4>
  <FORM action="${pageContext.request.contextPath}/CarService?type=update2" method=post onsubmit="return checkall();">
    <table width="350" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
            <tbody>
            <tr>
              <td align="center" colspan="2">汽车修改</td>
            </tr>
            <tr>
              <td>汽车编号：</td>
              <td><Input type="text" name="carId" id="carId" value='${car.carId}' size=20></td>
            </tr>
            <tr>
              <td>汽车型号：</td>
              <td><Input type="text" name="carName" id="carName" value='${car.carName}' size=20></td>
            </tr>
            <tr>
              <td>汽车颜色：</td>
              <td><Input type="text" name="color" id="color" value='${car.color}' size=20></td>
            </tr>
            <tr>
              <td>汽车产地：</td>
              <td><Input type="text" name="manufactor" id="manufactor" value='${car.manufactor}' size=20></td>
            </tr>
            <tr>
              <td>出厂日期：</td>
              <td><Input type="text" name="carDate" id="carDate" value='${car.carDate}' size=20></td>
            </tr>
            <tr>
              <td>汽车价格：</td>
              <td><Input type="text" name="carPrice" id="carPrice" value='${car.carPrice}' size=20></td>
            </tr>
            <tr>
              <td align="center" colspan="2">
                <Input type="hidden" name="carId_origin" id="carId_origin" value='${car.carId}'>
                <Input type="submit" name="b" id="submitButton" value="提交修改" class="tj" style='font-size: 16px'></td>
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
        var carId = document.getElementById("carId").value;
        var carName = document.getElementById("carName").value;
        var color = document.getElementById("color").value;
        var manufactor = document.getElementById("manufactor").value;
        var carDate = document.getElementById("carDate").value;
        var carPrice = document.getElementById("carPrice").value;
        if (carId == "") {
            alert("请输入编号！");
            flag = false;
            return false;
        } else if (carName == "") {
            alert("请输入型号！");
            flag = false;
            return false;
        } else if (color == "") {
            alert("请输入颜色！");
            flag = false;
            return false;
        } else if (manufactor == "") {
            alert("请输入产地！");
            flag = false;
            return false;
        } else if (carDate == "") {
            alert("请输入出厂日期！");
            flag = false;
            return false;
        } else if (carPrice == "") {
            alert("请输入价格！");
            flag = false;
            return false;
        }
        if (flag == true) {
            //form.submit();
            return true;
        }
    }
</script>