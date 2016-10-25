<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/25
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
${tips2}
<form name = "login" action ="Signin.action" method="post">
    <tr>
    <td>用户名<input type = "text" name ="signinUser.username"></td>
    </tr>
    <br/>
    <tr>
    密码<input type = "password" name ="signinUser.password">
    </tr>
    <br/>
    确认密码<input type = "password" name ="signinPassword">
    <br/>
    姓名<input type = "text" name ="signinUser.name">
    <br/>
    安全问题<input type = "text" name ="signinUser.question">
    <br/>
    安全问题答案<input type = "text" name ="signinUser.answer">
    <br/>
    <input type = "submit" name = "mySubmit" value = "注册" >
</form>
</body>
</html>
