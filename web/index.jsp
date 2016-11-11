<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/24
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>主页</title>
  </head>
  <body>
  用户名：<%=request.getSession().getAttribute("newusername")%>
    <INPUT name="login" type="button" value="登录" onclick="location.href='login.jsp'">
    <INPUT name="create" type="button" value="注册" onclick="location.href='signin.jsp'">
    <INPUT name="logout" type="button" value="退出登录" onclick="location.href='Logout.action'">
  </body>
</html>
