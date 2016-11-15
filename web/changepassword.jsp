<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/25
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>修改密码</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
            if("${tip}" == "原密码错误！") {
                document.getElementById("oldPasswordError").style.display = "inline";
            }
            else if("${tip}" == "两次输入的密码不一致") {
                document.getElementById("confirmPasswordError").style.display = "inline";
            }
        }
    </script>
</head>
<body onload="check()">
<form name = "answer" action ="Changepassword.action" method="post">
    <table>
        <tr>
            <td class="第一列"><label for="oldPassword">原密码：</label></td>
            <td class="第二列"><input type="password" name="Oldpassword" id="oldPassword" maxlength="20" required autofocus/></td>
            <td><i id="oldPasswordError">密码错误</i></td>
        </tr>
        <tr>
            <td class="第一列"><label for="password">新的密码：</label></td>
            <td class="第二列"><input type="password" name="Editpassword" id="password" maxlength="20" minlength="6" required onblur="onBlur('password')" onfocus="onFocus('password')" placeholder="6-20个字符"/></td>
            <td><i id="passwordError">密码长度不得小于6个字符</i></td>
        </tr>
        <tr>
            <td><label for="confirmPassword">确认密码：</label></td>
            <td><input type="password" name="Editpassword2" id="confirmPassword" maxlength="20" minlength="6" required onblur="onBlur('confirmPassword')" onfocus="onFocus('confirmPassword')"/></td>
            <td><i id="confirmPasswordError">两次输入的密码不一致</i></td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="submit" name="mySubmit" value="确定"/>
                <input name="back" type="button" value="返回" onclick="location.href='index.jsp'"/>
            </td>
        </tr>
    </table>
    <input type="hidden" name="fpUser.username" value="${fpUser.username}"/>
</form>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
