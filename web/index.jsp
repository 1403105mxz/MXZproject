<%--
  Created by IntelliJ IDEA.
  User: 54333
  Date: 2016/11/13
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
  <title>Title</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/main.css">
  <script>
    function check() {
      if("${tips}" != "") {
        document.getElementById("error").style.display = "inline";
      }
    }
  </script>
</head>
<body class="signIn" onload="check()">
<div class="container col-md-offset-2 col-md-8 m">
  <div class="container col-md-offset-4 col-md-4 signIn">
    <img src="img/财务管理系统.png" style="width: 100%"/>
    <form action="SignIn.action" method="post">
      <input type="text" name="username" class="form-control signIn" placeholder="用户名" value="${username}" required autofocus>
      <input type="password" name="password" class="form-control signIn" placeholder="密码" value="${password}" required>
      <div>
        <i id="error" class="warning">用户名或密码错误</i>
      </div>
      <div class="checkbox">
        <a href="findPassword.jsp">找回密码</a>
      </div>
      <div class="col-md-6">
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </div>
      <div class="col-md-6">
        <button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='register.jsp'">注册</button>
      </div>
    </form>
  </div>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
