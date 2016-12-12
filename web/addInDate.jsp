<%--
  Created by IntelliJ IDEA.
  User: 54333
  Date: 2016/12/11
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>新增收入</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/invoice.css">
    <script src="/js/main.js"></script>
</head>
<body onload="checkDate()">
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">新增收入</h1>
        <form class="form-horizontal" role="form" action="AddInDate.action" method="post">
            <div class="form-group">
                <label for="date" class="col-sm-2 control-label">日期</label>
                <div class="col-sm-2">
                    <input type="date" class="form-control" name="business.date" id="date" placeholder="以YYYY-MM-DD格式输入" required>
                </div>
            </div>
            <div class="form-group">
                <label for="money" class="col-sm-2 control-label">金额</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" name="business.money" id="money" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" required>
                </div>
            </div>
            <div class="form-group">
                <label for="remark" class="col-sm-2 control-label">备注</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" name="business.remark" id="remark" maxlength="45">
                </div>
            </div>
            <input type="submit" class="btn btn-primary" value="保存">
        </form>
    </div>
</body>
</html>
