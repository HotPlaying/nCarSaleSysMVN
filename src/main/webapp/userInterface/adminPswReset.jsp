<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>修改管理员密码</title>
  <link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body>
<a href="adminDetails.jsp">返回主页</a>
<div align="center">
  <form action="../Administrate?type=passwordReset" method="post" onsubmit="return checkall();">
    <table width="250" border="0">
      <tbody>
      <tr>
        <td colspan="2" align="center"><p class="subTitle">修改管理员密码</p></td>
      </tr>
      <tr>
        <td width="40%">原密码</td>
        <td><input name="lastPsw" type="password" id="lastPsw"></td>
      </tr>
      <tr>
        <td>新密码</td>
        <td><input name="newPsw" type="password" id="newPsw"></td>
      </tr>
      <tr>
        <td>确认密码</td>
        <td><input name="confirmPsw" type="password" id="confirmPsw"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="right"><input type="submit" value="提交"></td>
      </tr>
      </tbody>
    </table>
  </form>
</div>
</body>
</html>
<script language="javascript">
    function checkall() {
        var flag = true;
        var lastPsw = document.getElementById("lastPsw").value;
        var newPsw = document.getElementById("newPsw").value;
        var confirmPsw = document.getElementById("confirmPsw").value;
        if (lastPsw == "") {
            alert("请输入原密码！");
            flag = false;
            return false;
        } else if (newPsw == "") {
            alert("请输入新密码！");
            flag = false;
            return false;
        } else if (confirmPsw == "") {
            alert("请确认密码！");
            flag = false;
            return false;
        } else if (confirmPsw != newPsw) {
            alert("确认密码与新密码不一致，清重新输入");
            flag = false;
            return false;
        }

        if (flag) {
            //form.submit();
            return true;
        }
    }
</script>