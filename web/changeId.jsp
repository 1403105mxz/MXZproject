<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/11/12
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>修改权限</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<form name = "myForm" action ="ChangeId.action" method="post">
    输入你的密码：<input name = "high" type = "password">
    新的权限等级：<input name = "newpower" type = "text">
    <input name = "changep" type = "hidden" value="${changep}">
    <input type = "submit" name = "check" value = "修改"><br/>
    ${tips4}
</form>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
