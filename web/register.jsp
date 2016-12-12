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
    <style>
        td {
            text-align: center;
        }
        i {
            font-style: normal;
            color: red;
            font-size: 13px;
            display: none;
        }
        kbd {
            font-style: normal;
            color: #636363;
        }
        sup {
            color: red;
        }
        *.提示 {
            width: 13em;
        }
        *.第一列 {
            width: 7em;
        }
        *.输入框 {
            margin-left: 28px;
            width: 218px;
        }
        table {
            margin: 20em auto;
            table-layout: fixed;
            width: 584px;
        }
    </style>
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
        function onSubmit() {
            var question = document.getElementsByName("signinUser.question");
            var question1 = document.getElementById("question1");
            var question2 = document.getElementById("question2");
            if(question[0].checked) {
                question[0].value = question1.value;
            }
            else {
                question[1].value = question2.value;
            }
        }
        function check() {
            var tip = "${tips2}";
            if(tip == "两次输入的密码不一致") {
                document.getElementById("confirmPasswordError").style.display = "inline";
            }
            if(tip == "用户名已存在。") {
                document.getElementById("usernameRepeat").style.display = "inline";
            }
        }
    </script>
</head>
<body onload="check()">
<form name="login" action ="Register.action" method="post" onsubmit="onSubmit()">
    <table>
        <tr>
            <td class="第一列"><label for="username">用户名<sup>*</sup></label></td>
            <td><input class="输入框" type="text" name ="signinUser.username" id="username" maxlength="20" minlength="6" required onblur="onBlur('username')" onfocus="onFocus('username')" placeholder="6-20个字符" value=${signinUser.username} ></td>
            <td class="提示">
                <i id="usernameError">用户名长度不得小于6个字符</i>
                <i id="usernameRepeat">用户名已存在</i>
            </td>
        </tr>
        <tr>
            <td><label for="password">密码<sup>*</sup></label></td>
            <td><input class="输入框" type="password" name="signinUser.password" id="password" maxlength="20" minlength="6" required onblur="onBlur('password')" onfocus="onFocus('password')" placeholder="6-20个字符"></td>
            <td class="提示"><i id="passwordError">密码长度不得小于6个字符</i></td>
        </tr>
        <tr>
            <td><label for="confirmPassword">确认密码<sup>*</sup></label></td>
            <td><input class="输入框" type="password" name="signinPassword" id="confirmPassword" maxlength="20" minlength="6" required onblur="onBlur('confirmPassword')" onfocus="onFocus('confirmPassword')"></td>
            <td class="提示"><i id="confirmPasswordError">两次输入的密码不一致</i></td>
        </tr>
        <tr>
            <td><label for="name">姓名<sup>*</sup></label></td>
            <td><input class="输入框" type="text" name="signinUser.name" id="name" maxlength="20" minlength="2" required onblur="onBlur('name')" onfocus="onFocus('name')" placeholder="2-20个字符" value=${signinUser.name} ></td>
            <td class="提示"><i id="nameError">姓名长度不得小于2个字符</i></td>
        </tr>
        <tr>
            <td><label>安全问题</label></td>
            <td style="text-align: left">
                <input type="radio" name="signinUser.question" checked>
                    <select id="question1">
                        <option value="你的偶像是？">你的偶像是？</option>
                    </select>
                </input><br/>
                <input type="radio" name="signinUser.question">
                    <input type="text" id="question2"/>
                </input>
            </td>
        </tr>
        <tr>
            <td><label for="answer">安全问题答案<sup>*</sup></label></td>
            <td><input class="输入框" type="text" name="signinUser.answer" id="answer" required value=${signinUser.answer}></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="mySubmit" value="注册" >　　
                <input name="back" type="button" value="返回" onclick="location.href='index.jsp'">
            </td>
        </tr>
    </table>

</form>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
