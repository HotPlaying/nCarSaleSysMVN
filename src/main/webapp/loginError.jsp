<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">
  <title>汽车销售信息管理系统登录页面</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body><br>
<form action="LoginServlet" method="post" name="Login">
  <table width="480" border="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
    <tr bgcolor="#6f92c8">
      <td>&nbsp;</td>
      <td height="90" width="22%" align="center" valign="middle"><h2>汽车销售信息<br>
        管理系统</h2></td>
      <td>&nbsp;</td>
    </tr>
    <tr height="43">
      <td>&nbsp;</td>
      <td bgcolor="#FFF000" align="center">${errorReport}</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="82" colspan="3" align="center" bgcolor="#FFFFFF"><input type="text" placeholder="输入用户账号" size="30"
                                                                          name="id"
                                                                          onfocus="if (this.value=='id')  this.value='';">
      </td>
    </tr>
    <tr>
      <td height="95" colspan="3" align="center" bgcolor="#FFFFFF"><input type="password" name="password"
                                                                          placeholder="输入用户密码" size="31"
                                                                          onfocus="if (this.value=='password')  this.value='';">
      </td>
    </tr>
    <tr>
      <td height="62" colspan="3" align="center" bgcolor="#FFFFFF"><input type="submit" name="submit" value="登录系统"
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