<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/25
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>修改密码</title>
</head>
<body>
${tips3}
<form name = "answer" action ="Editpassword.action" method="post">
    <br/>
    新的密码<input type = "password" name ="fpUser.password">
    确认密码<input type = "password" name ="fpUsername">
    <s:hidden name="fpUser.answer" value="%{fpUser.answer}"></s:hidden>
    <s:hidden name="fpUser.username" value="%{fpUser.username}"></s:hidden>
    <s:hidden name="fpUser.name" value="%{fpUser.name}"></s:hidden>
    <s:hidden name="fpUser.id" value="%{fpUser.id}"></s:hidden>
    <s:hidden name="fpUser.question" value="%{fpUser.question}"></s:hidden>
    <input type = "submit" name = "mySubmit" value = "确定" >
</form>
</body>
</html>
