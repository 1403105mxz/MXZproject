<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/10/25
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>添加发票</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <style>
        table {
            margin: 20em auto;
            table-layout: fixed;
            width: 403px;
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
            if("${tip}" == "repeat") {
                document.getElementById("codeidRepeat").style.display = "block";
            }
            var d = new Date();
            if("${date}" == "") {
                document.getElementById("date").value = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
            }
        }
        function onBlur(id) {
            var input = document.getElementById(id);
            var idError = document.getElementById(id+"Error");
            if(id == "invoiceCode") {
                if(input.value.length != 10 && input.value.length != 12) {
                    idError.style.display = "block";
                }
                else {
                    idError.style.display = "none";
                }
            }
            else if(id == "invoiceId"){
                if (input.value.length != 8) {
                    idError.style.display = "block";
                }
                else {
                    idError.style.display = "none";
                }
            }
        }
        function test() {
            alert(document.getElementById("test").value);
        }
    </script>
</head>
<body onload="check()">
<table border="1" cellpadding="10">
    <tr>
        <td style="width: 1em;" rowspan="4">购贷单位</td>
        <td style="width: 30em;">名称：</td>
        <td style="width: 1em;" rowspan="4">密码区</td>
        <td style="width: 20em;" rowspan="4"></td>
    </tr>
    <tr>
        <td style="width: 30em;">纳税人识别号：</td>
    </tr>
    <tr>
        <td style="width: 30em;">地址、电话：</td>
    </tr>
    <tr>
        <td style="width: 30em;">开户行级账号：</td>
    </tr>
</table>
<%--
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">添加发票</h1>
        <form class="form-horizontal" action="addInvoice.action" method="POST">
            <div class="form-group">
                <label for="invoiceCode" class="col-sm-2 control-label">类别代码</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="code" id="invoiceCode" pattern="([0-9]{10})|([0-9]{12})" title="10或12位数字" maxlength="12" placeholder="10或12位数字" onblur="onBlur('invoiceCode')" required value="${code}">
                </div>
                <div class="inputError alert alert-danger col-sm-4" role="alert" id="invoiceCodeError">
                    应为10或12位数字
                </div>
                <div class="inputError alert alert-danger col-sm-4" role="alert" id="codeidRepeat">
                    发票代码编号已存在
                </div>
            </div>
            <div class="form-group">
                <label for="invoiceId" class="col-sm-2 control-label">发票编号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="id" id="invoiceId" pattern="[0-9]{8}" title="8位数字" maxlength="8" placeholder="8位数字" onblur="onBlur('invoiceId')" required value="${id}"/>
                </div>
                <div class="inputError alert alert-danger col-sm-4" role="alert" id="invoiceIdError">
                    应为8位数字
                </div>
            </div>
            <div class="form-group">
                <label for="date" class="col-sm-2 control-label">日期</label>
                <div class="col-sm-6">
                    <input type="date" class="form-control" name="date" id="date" pattern="^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$"
                           placeholder="以YYYY-MM-DD格式输入" value="${date}">
                </div>
            </div>
            <div class="form-group">
                <label for="payer" class="col-sm-2 control-label">付款方</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="payer" id="payer" maxlength="45" required value="${payer}">
                </div>
            </div>
            <div class="form-group">
                <label for="items" class="col-sm-2 control-label">付款项</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="items" id="items" maxlength="45" required value="${items}">
                </div>
            </div>
            <div class="form-group">
                <label for="number" class="col-sm-2 control-label">数量</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control" name="number" id="number" min="1" required value="${number}">
                </div>
            </div>
            <div class="form-group">
                <label for="price" class="col-sm-2 control-label">单价(人民币)</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="price" id="price" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" required value="${price}">
                </div>
            </div>
            <div class="form-group">
                <label for="remark" class="col-sm-2 control-label">备注</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="remark" id="remark" maxlength="45" value="${remark}">
                </div>
            </div>
            <div class="form-group">
                <label for="payee" class="col-sm-2 control-label">收款方</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="payee" id="payee" maxlength="45" required value="${payee}">
                </div>
            </div>
            <div class="form-group">
                <label for="drawer" class="col-sm-2 control-label">开票人</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="drawer" id="drawer" maxlength="45" required value="${drawer}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">添加</button>
                </div>
            </div>
        </form>
    </div>
--%>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
