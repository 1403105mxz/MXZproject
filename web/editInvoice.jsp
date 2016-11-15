<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/11/12
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>编辑发票</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">编辑发票</h1>
        <form class="form-horizontal" action="editInvoice" method="POST">
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">类别代码</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="code" value="${invoice.code}" disabled>
                    <input type="hidden" name="code" value="${invoice.code}">
                </div>
            </div>
            <div class="form-group">
                <label for="id" class="col-sm-2 control-label">发票编号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="id" value="${invoice.id}" disabled>
                    <input type="hidden" name="id" value="${invoice.id}">
                </div>
            </div>
            <div class="form-group">
                <label for="id" class="col-sm-2 control-label">日期</label>
                <div class="col-sm-6">
                    <input type="date" class="form-control" name="date" id="date" pattern="^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$"
                           placeholder="以YYYY-MM-DD格式输入" value="${invoice.date}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">付款方</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="payer" id="payer" maxlength="45" required value="${invoice.payer}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">付款项</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="items" id="items" maxlength="45" required value="${invoice.items}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">数量</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control" name="number" id="number" min="1" required value="${invoice.number}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">单价(人民币)</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="price" id="price" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" required value="${invoice.price}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">备注</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="remark" id="remark" maxlength="45" value="${invoice.remark}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">收款方</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="payee" id="payee" maxlength="45" required value="${invoice.payee}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">开票人</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="drawer" id="drawer" maxlength="45" required value="${invoice.drawer}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">保存</button>
                </div>
            </div>
        </form>
    </div>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>
