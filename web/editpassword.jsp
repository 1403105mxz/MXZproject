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
<body onload="check()">
<form name = "answer" action ="Editpassword.action" method="post">
    <table>
        <tr>
            <td class="第一列"><label for="password">新的密码：</label></td>
            <td class="第二列"><input type="password" name="fpUser.password" id="password" maxlength="20" minlength="6" required onblur="onBlur('password')" onfocus="onFocus('password')" placeholder="6-20个字符"/></td>
            <td><i id="passwordError">密码长度不得小于6个字符</i></td>
        </tr>
        <tr>
            <td><label for="confirmPassword">确认密码：</label></td>
            <td><input type="password" name="fpUsername" id="confirmPassword" maxlength="20" minlength="6" required onblur="onBlur('confirmPassword')" onfocus="onFocus('confirmPassword')"/></td>
            <td><i id="confirmPasswordError">两次输入的密码不一致</i></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="mySubmit" value="确定"/>
                <input name="back" type="button" value="返回" onclick="location.href='index.jsp'"/>
            </td>
        </tr>
    </table>
    <input type="hidden" name="fpUser.username" value="${fpUser.username}"/>
</form>
</body>
</html>
