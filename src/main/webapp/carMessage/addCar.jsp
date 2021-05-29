<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>填写添加的汽车信息</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<a href="carQueryAll.jsp">返回汽车信息管理页面 </a>
<form action="../CarService" method="post" onsubmit="return checkall();">
  <div style="margin-top:50px;">
    <table width="350" border="5" align="center" bordercolor="#C9BAFF" height="200" bgcolor="#FFFFFF">
      <tr>
        <td>
          <table width="100%" border="0" align="center" cellspacing="1" cellpadding="5" bgcolor="#FFFFFF">
            <tbody>
            <tr>
              <td align="center"><font size="4">添加车辆 </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">汽车编号：
                <input type="text" size="15" name="carId" id="carId">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">汽车型号：
                <input type="text" size="15" name="carName" id="carName">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">汽车颜色：
                <input type="text" size="15" name="color" id="color">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">汽车产地：
                <input type="text" size="15" name="manufactor" id="manufactor">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">生产日期：
                <input type="text" size="15" name="carDate" id="carDate">
              </font></td>
            </tr>
            <tr>
              <td align="center"><font size="4">汽车价格：
                <input type="text" size="15" name="carPrice" id="carPrice">
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
