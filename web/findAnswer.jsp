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
                document.getElementById("fpAnswerError").style.display = "inline";
            }
        }
    </script>
</head>
<body onload="check()" class="signIn">
<div class="container bs-docs-container">
    <h1 id="overview" class="page-header">找回密码</h1>
    <form class="form-horizontal" role="form" action ="FindAnswer.action" method="post">
        <div class="form-group">
            <label for="question" class="col-sm-2 control-label">安全问题：</label>
            <div class="col-sm-5">
                <input id="question" class="form-control" value="${fpUser.question}" readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">答案：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="fpAnswer" id="fpAnswer"/>
            </div>
            <div class="alert alert-danger danger2 col-sm-5" id="fpAnswerError">
                回答错误！
            </div>
        </div>
        <button type="submit" class="btn btn-primary" name="mySubmit">确定</button>&emsp;
        <button name="back" type="button" class="btn btn-danger" onclick="location.href='index.jsp'">返回</button>
        <br/>
        <input type="hidden" name="fpUser.answer" value="${fpUser.answer}"/>
        <input type="hidden" name="fpUser.question" value="${fpUser.question}">
        <input type="hidden" name="fpUser.username" value="${fpUser.username}"/>
    </form>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
