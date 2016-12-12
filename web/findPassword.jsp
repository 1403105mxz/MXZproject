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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <script>
        function check() {
            if("${tips3}" != "") {
                document.getElementById("nameError").style.display = "inline";
            }
        }
    </script>
</head>
<body onload="check()" class="signIn">
<div class="container bs-docs-container">
    <h1 id="overview" class="page-header">找回密码</h1>
    <form action ="FindPassword.action" class="form-horizontal" role="form" method="post">
        <div class="form-group">
            <label for="fpUsername" class="col-sm-2 control-label">请输入您的用户名：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="fpUsername" id="fpUsername" autofocus value="${fpUsername}">
            </div>
            <div class="alert alert-danger col-sm-5 danger2" id="nameError">
                用户名不存在
            </div>
        </div>
        <button type="submit" class="btn btn-primary" name="mySubmit">确定</button>&emsp;
        <button name="back" type="button" class="btn btn-danger" onclick="location.href='index.jsp'">返回</button>
    </table>
</form>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
