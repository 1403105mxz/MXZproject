<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/25
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>输入安全问题答案</title>
</head>
<body>
${tips3}
<form name = "answer" action ="Findanswer.action" method="post">
    安全问题： ${fpUser.question}
    <br/>
    <input type = "text" name ="fpAnswer">
    <s:hidden name="fpUser.answer" value="%{fpUser.answer}"></s:hidden>
    <s:hidden name="fpUser.username" value="%{fpUser.username}"></s:hidden>
    <s:hidden name="fpUser.password" value="%{fpUser.password}"></s:hidden>
    <s:hidden name="fpUser.name" value="%{fpUser.name}"></s:hidden>
    <s:hidden name="fpUser.id" value="%{fpUser.id}"></s:hidden>
    <s:hidden name="fpUser.question" value="%{fpUser.question}"></s:hidden>
    <input type = "submit" name = "mySubmit" value = "确定" >
</form>
</body>
</html>
