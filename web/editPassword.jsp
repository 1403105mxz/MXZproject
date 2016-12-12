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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <style>
        i {
            font-style: normal;
            color: red;
            font-size: 13px;
            display: none;
        }
        table {
            margin: 20em auto;
            table-layout: fixed;
            width: 417px;
        }
        *.第一列 {
            width: 5em;
        }
        *.第二列 {
            width: 173px;
        }
    </style>
    <script>
        function onBlur(id) {
            var input = document.getElementById(id);
            var idError = document.getElementById(id+"Error");
            if(id == "confirmPassword") {
                var password = document.getElementById("password").value;
                if(input.value != password) {
                    idError.style.display="inline";
                }
            }
            else {
                var minLength = id == "name" ? 2 : 6;
                if (input.value.length < minLength) {
                    idError.style.display = "inline";
                }
            }
        }
        function onFocus(id) {
            var idError = document.getElementById(id+"Error");
            idError.style.display = "none";
        }
        function check() {
            if("${tips3}" != "") {
                document.getElementById("confirmPasswordError").style.display = "inline";
            }
        }
    </script>
</head>
<body onload="check()" class="signIn">
<div class="container bs-docs-container">
    <h1 id="overview" class="page-header">找回密码</h1>
<form name = "answer" class="form-horizontal" role="form" action ="EditPassword.action" method="post">
    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">新的密码</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" name="fpUser.password" id="password" maxlength="20" minlength="6" required onblur="onBlur('password')" onfocus="onFocus('password')" placeholder="6-20个字符"/>
        </div>
        <div class="alert alert-danger col-sm-5 danger2" id="passwordError">
            密码长度不得小于6个字符
        </div>
    </div>
    <div class="form-group">
        <label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" name="fpUsername" id="confirmPassword" maxlength="20" minlength="6" required onblur="onBlur('confirmPassword')" onfocus="onFocus('confirmPassword')"/>
        </div>
        <div class="alert alert-danger col-sm-5 danger2" id="confirmPasswordError">
            两次输入的密码不一致
        </div>
    </div>
    <input type="hidden" name="fpUser.username" value="${fpUser.username}"/>
    <button type="submit" class="btn btn-primary" name="mySubmit">确定</button>&emsp;
    <button name="back" type="button" class="btn btn-danger" onclick="location.href='index.jsp'">返回</button>
</form>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
