<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 54333
  Date: 2016/11/13
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html lang="zh-CN">
<head>
    <title>税率计算</title>
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
    <h1 id="overview" class="page-header">税率计算</h1>
    <div class="row">
        <div class="form-group input-group-lg col-md-3">
            <label for="before"><big>税前工资</big></label>
            <input type="text" class="form-control " id="before" onchange="tax()"/>
        </div>
    </div>
    <div class="row">
        <div class="form-group input-group-lg col-md-3">
            <label for="after"><big>税后工资</big></label>
            <input type="text" class="form-control" id="after" readonly/>
        </div>
    </div>
<script src="/js/main.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
