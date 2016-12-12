<!DOCTYPE html>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <script>
        function onBlur(id) {
            var input = document.getElementById(id);
            var idError = document.getElementById(id+"Error");
            document.getElementById("usernameRepeat").style.display = "none";
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
            var tip = "${tips2}";
            if(tip == "两次输入的密码不一致") {
                document.getElementById("confirmPasswordError").style.display = "inline";
            }
            if(tip == "用户名已存在") {
                document.getElementById("usernameRepeat").style.display = "inline";
            }
        }
    </script>
</head>
<body class="signIn" onload="check()">
<div class="container bs-docs-container">
    <h1 id="overview" class="page-header">注册</h1>
        <form name="login" class="form-horizontal" role="form" action ="Register.action" method="post">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">用户名<sup>*</sup></label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name ="signinUser.username" id="username" maxlength="20" minlength="6" required onblur="onBlur('username')" onfocus="onFocus('username')" placeholder="6-20个字符" value=${signinUser.username}>
                </div>
                <div class="alert alert-danger col-sm-5 danger2" id="usernameError">
                    用户名长度不得小于6个字符
                </div>
                <div class="alert alert-danger col-sm-5 danger2" id="usernameRepeat">
                    用户名已存在
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码<sup>*</sup></label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" name="signinUser.password" id="password" maxlength="20" minlength="6" required onblur="onBlur('password')" onfocus="onFocus('password')" placeholder="6-20个字符">
                </div>
                <div class="alert alert-danger col-sm-5 danger2" id="passwordError">
                    密码长度不得小于6个字符
                </div>
            </div>
            <div class="form-group">
                <label for="confirmPassword" class="col-sm-2 control-label">确认密码<sup>*</sup></label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" name="signinPassword" id="confirmPassword" maxlength="20" minlength="6" required onblur="onBlur('confirmPassword')" onfocus="onFocus('confirmPassword')">
                </div>
                <div class="alert alert-danger col-sm-5 danger2" id="confirmPasswordError">
                    两次输入的密码不一致
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">姓名<sup>*</sup></label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="signinUser.name" id="name" maxlength="20" minlength="2" required onblur="onBlur('name')" onfocus="onFocus('name')" placeholder="2-20个字符" value=${signinUser.name}>
                </div>
                <div class="alert alert-danger col-sm-5 danger2" id="nameError">
                    姓名长度不得小于2个字符
                </div>
            </div>
            <div class="form-group">
                <label for="question" class="col-sm-2 control-label">安全问题</label>
                <div class="col-sm-5">
                    <select class="form-control" name="signinUser.question" id="question">
                        <option value="你的偶像是？" selected>你的偶像是？</option>
                        <option value="你母亲的名字？" selected>你母亲的名字？</option>
                        <option value="你父亲的名字？" selected>你父亲的名字？</option>
                        <option value="你的小学名称是什么？" selected>你的小学名称是什么？</option>
                        <option value="你的第一个宠物叫什么？" selected>你的第一个宠物叫什么？</option>
                        <option value="你的生日？" selected>你的生日？</option>
                        <option value="你的身份证后六位？" selected>你的身份证后六位？</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="answer" class="col-sm-2 control-label">安全问题答案<sup>*</sup></label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="signinUser.answer" id="answer" required value=${signinUser.answer}></td>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" name="mySubmit">注册</button>&emsp;
            <button name="back" type="button" class="btn btn-danger" onclick="location.href='index.jsp'">返回</button>
        </form>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
