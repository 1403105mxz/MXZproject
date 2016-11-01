<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/25
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
</head>
<body>
${tips3}
<form name = "findpassword" action ="Findpassword.action" method="post">
    请输入用户名<input type = "text" name ="fpUsername">
    <br/>
    <input type = "submit" name = "mySubmit" value = "确定" >
</form>
</body>
</html>
