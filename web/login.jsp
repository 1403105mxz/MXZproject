<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/24
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>登录</title>
    <style>
        td {
            height: 1em;
        }
        i {
            font-style: normal;
            color: red;
            font-size: 13px;
            display: none;
        }
        table {
            margin-top: 20em;
            margin-left: 42%;
            table-layout: fixed;
        }
        *.第一列 {
            width: 4em;
        }
    </style>
    <script>
        function check() {
            if("${tips}" != "") {
                document.getElementById("error").style.display = "inline";
            }
        }
        function hide() {
            document.getElementById("error").style.display = "none";
        }
    </script>
</head>
<body onload="check()">
<form name = "login" action ="Login.action" method="post">
    <table>
        <tr>
            <td class="第一列"><label for="username">用户名</label></td>
            <td><input type="text" name="username" id="username" onblur="hide()" value="${username}"></td>
        </tr>
        <tr>
            <td><label for="password">密码</label></td>
            <td><input type="password" name="password" id="password" onfocus="hide()"></td>
        </tr>
        <tr>
            <td colspan="2"><i id="error">用户名或密码错误！</i></td>
        </tr>
        <tr>
            <td><input type = "submit" name = "mySubmit" value = "登录" ></td>
            <td><input type = "button" name = "find" value = "找回密码" onclick="location.href = 'findpassword.jsp'"></td>
        </tr>
        <tr>
            <td><input name="back" type="button" value="返回" onclick="location.href='index.jsp'"></td>
        </tr>
    </table>
</form>
</body>
</html>
