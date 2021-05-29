<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
  <title>汽车销售信息管理系统登录页面</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body><br>
<form action="LoginServlet" method="post" name="Login">
  <table width="480" border="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
    <tr bgcolor="#6f92c8">
      <td>&nbsp;</td>
      <td width="22%" align="center" height="90"><h2>汽车销售信息<br>
        管理系统</h2></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="43">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="82" colspan="3" align="center" bgcolor="#FFFFFF">
        <input name="id" type="text" placeholder="输入用户账号"
               onfocus="if (this.value=='id')  this.value='';"
               size="30" maxlength="30"></td>
    </tr>
    <tr>
      <td height="95" colspan="3" align="center" bgcolor="#FFFFFF">
        <input name="password" type="password"
               placeholder="输入用户密码"
               onfocus="if (this.value=='password')  this.value='';"
               size="31" maxlength="31"></td>
    </tr>
    <tr>
      <td height="62" colspan="3" align="center" bgcolor="#FFFFFF">
        <input type="submit" name="submit" value="登录系统"
               onClick="return validateLogin()"></td>
    </tr>
  </table>
</form>
<br>
</body>
</html>
<script language="javascript">
    function validateLogin() {
        var sId = document.Login.id.value;
        var sPassword = document.Login.password.value;
        if ((sId == "") || (sId == "id")) {
            alert("请输入id!");
            return false;
        }
        if ((sPassword == "") || (sPassword == "password")) {
            alert("请输入密码!");
            return false;
        }
    }
</script>