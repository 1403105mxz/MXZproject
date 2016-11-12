<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/25
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>输入安全问题答案</title>
    <style>
        table {
            margin: 20em auto;
            table-layout: fixed;
            width: 332px;
        }
        *.第一列 {
            width: 5em;
        }
        *.第二列 {
            width: 173px;
        }
        i {
            font-style: normal;
            color: red;
            font-size: 13px;
            display: none;
        }
    </style>
    <script>
        function check() {
            if("${tips3}" != "") {
                document.getElementById("fpAnswerError").style.display = "inline";
            }
        }
    </script>
</head>
<body onload="check()">
<form name = "answer" action ="Findanswer.action" method="post">
    <table>
        <tr>
            <td class="第一列">安全问题：</td>
            <td class="第二列">${fpUser.question}</td>
        </tr>
        <tr>
            <td><label for="fpAnswer">答案：</label></td>
            <td><input type="text" name="fpAnswer" id="fpAnswer"/></td>
            <td><i id="fpAnswerError">回答错误！</i></td>
        </tr>
        <tr>
            <td><input type = "submit" name = "mySubmit" value = "确定" ></td>
            <td><input name="back" type="button" value="返回" onclick="location.href='index.jsp'"></td>
        </tr>
    </table>
    <br/>
    <input type="hidden" name="fpUser.answer" value="${fpUser.answer}"/>
    <input type="hidden" name="fpUser.question" value="${fpUser.question}">
    <input type="hidden" name="fpUser.username" value="${fpUser.username}"/>
</form>
</body>
</html>
