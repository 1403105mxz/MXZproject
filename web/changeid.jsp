<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/11/12
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改权限</title>
</head>
<body>
<form name = "myForm" action ="Changeid.action" method="post">
    输入你的密码：<input name = "high" type = "text">
    新的权限等级：<input name = "newpower" type = "text">
    <input name = "changep" type = "hidden" value="${changep}">
    <input type = "submit" name = "check" value = "修改"><br/>
    ${tips4}
</form>
</body>
</html>
