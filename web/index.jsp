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
    <title>传说中的主页</title>
  </head>
  <body>
  当前登录用户：
  用户名：<%=request.getSession().getAttribute("newusername")%>
  <br/>
  密码：<%=request.getSession().getAttribute("newpassword")%>
  <br/>
  姓名：<%=request.getSession().getAttribute("newname")%>
  <br/>
  权限等级：<%=request.getSession().getAttribute("newid")%>
  <br/>
  安全问题：<%=request.getSession().getAttribute("newquestion")%>
  <br/>
  安全问题答案：<%=request.getSession().getAttribute("newanswer")%>
  <br/>
  <INPUT name="login" type="button" value="登陆" onclick="location.href='login.jsp'">
  <INPUT name="create" type="button" value="注册" onclick="location.href='signin.jsp'">
  </body>
</html>
