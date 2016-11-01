<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/24
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>登陆</title>
</head>
<body>
${tips}
<form name = "login" action ="Login.action" method="post">
    用户名<input type = "text" name ="username" value =${username}>
    <br/>
    密码<input type = "password" name ="password">
    <br/>
    <input type = "submit" name = "mySubmit" value = "登陆" >
</form>
<input type = "button" name = "find" value = "找回密码" onclick="location.href = 'findpassword.jsp'">
<INPUT name="back" type="button" value="返回" onclick="location.href='index.jsp'">
</body>
</html>
