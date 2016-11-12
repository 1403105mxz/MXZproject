<!DOCTYPE html>
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
    <style>
        i {
            font-style: normal;
            color: red;
            font-size: 13px;
            display: none;
        }
        table {
            margin: 20em 40%;
            table-layout: fixed;
            width: 500px;
        }
        *.第一列 {
            width: 9em;
        }
    </style>
    <script>
        function check() {
            if("${tips3}" != "") {
                document.getElementById("nameError").style.display = "inline";
            }
        }
    </script>
</head>
<body onload="check()">
<form name = "findpassword" action ="Findpassword.action" method="post">
    <table>
        <tr>
            <td class="第一列"><label for="fpUsername">请输入您的用户名：</label></td>
            <td><input type="text" name="fpUsername" id="fpUsername" autofocus value="${fpUsername}"></td>
            <td><i id="nameError">用户名不存在</i></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" name="mySubmit" value="确定"/>　　<input name="back" type="button" value="返回" onclick="location.href='index.jsp'"></td>
        </tr>
    </table>
</form>

</body>
</html>
