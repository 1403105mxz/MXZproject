<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/10/26
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>没有此发票</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container bs-docs-container">
    <h1 id="overview" class="page-header">发票详情</h1>
    <div class="jumbotron alert-danger">
        <h2>发票编码为${code}-${id}的发票不存在。</h2>
    </div>
</div>
</body>
</html>
