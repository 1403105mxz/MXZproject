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
    <link rel="stylesheet" href="css/invoice.css">
    <script src="/js/main.js"></script>
</head>
<body onload="checkDate('${invoice.date}'), checkTip('${tip}')">
<div class="container bs-docs-container">
    <h1 id="overview" class="page-header">新增发票</h1>
    <div class="alert alert-danger danger1" id="codeIdRepeat" role="alert">
        编号代码重复！
    </div>
    <form action="AddInvoice.action" method="post">
        <div style="height: 720px; width: 977px; position: absolute;">
            <input type="text" name="invoice.code" id="invoiceCode" class="invoiceCode" pattern="([0-9]{10})|([0-9]{12})" title="10或12位数字" maxlength="12" placeholder="类别代码" required value="${invoice.code}">
            <div class="invoiceTableHead">增值税普通发票<br/>════════════<br/>发票联</div>
            <div class="invoiceIdArea">
                <span style="font-family: Times New Roman">№</span><input type="text" name="invoice.id" id="invoiceId" class="invoiceId" pattern="[0-9]{8}" title="8位数字" maxlength="8" placeholder="8位数字" required value="${invoice.id}"/>
            </div>
            <div class="invoiceCheckCodeArea">
                校验码：<input type="text" name="invoice.checkCode" id="checkCode" class="invoiceCheckCode" maxlength="45" required value="${invoice.checkCode}">
            </div>
            <div class="invoiceDateArea">
                开票日期：<input type="date" name="invoice.date" id="date" class="invoiceDate" pattern="^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$"
                            placeholder="以YYYY-MM-DD格式输入"  value="${invoice.date}" required>
            </div>
            <table border="1" class="invoiceTable" cellpadding="10">
                <tr>
                    <td class="allInvoice" style="width: 2em; border-style: solid;" rowspan="4" colspan="2">购<div style="height: 12px"></div>贷<div style="height: 12px"></div>单<div style="height: 12px"></div>位</td>
                    <td class="allInvoice" style="width: 8em; border-top-style: solid;" colspan="8">名&emsp;&emsp;&emsp;&emsp;称:</td>
                    <td class="allInvoice" style="width: 400px; border-top-style: solid;" colspan="25"><input type="text" name="invoice.payer.name" id="payerName" style="width: 384px" class="invoiceA" placeholder="请输入名称" value="${invoice.payer.name}"></td>
                    <td class="allInvoice" style="width: 2em; border-style: solid;" rowspan="4" colspan="2">密<div style="height: 20px"></div>码<div style="height: 20px"></div>区</td>
                    <td class="allInvoice" style="width: 384px; border-style: solid;" rowspan="4" colspan="24"></td>
                </tr>
                <tr>
                    <td colspan="8">纳税人识别号:</td>
                    <td colspan="25"><input type="text" name="invoice.payer.id" id="payerId" style="width: 384px" class="invoiceA" maxlength="45" placeholder="请输入识别号" value="${invoice.payer.id}" required></td>
                </tr>
                <tr>
                    <td colspan="8">地&ensp;址、电&ensp;话</span>:</td>
                    <td colspan="25"><input type="text" name="invoice.payer.address" style="width: 188px" class="invoiceA" maxlength="100" placeholder="请输入地址" value="${invoice.payer.address}">&ensp;<input type="text" name="invoice.payer.phoneNumber" style="width: 188px" class="invoiceA" maxlength="45" pattern="([0-9]|-)*" title='只能输入数字和"-"' placeholder="请输入电话" value="${invoice.payer.phoneNumber}"></td>
                </tr>
                <tr>
                    <td style="border-bottom-style: solid;" colspan="8">开户行及账号:</td>
                    <td style="border-bottom-style: solid;" colspan="25"><input type="text" name="invoice.payer.bank" id="payerBank" style="width: 188px" class="invoiceA" maxlength="100" placeholder="请输入开户行" required value="${invoice.payer.bank}">&ensp;<input type="text" name="invoice.payer.bankId" id="payerBankId" style="width: 188px" class="invoiceA" placeholder="请输入账号" value="${invoice.payer.bankId}" required></td>
                </tr>
                <tr>
                    <td class="invoiceA" style="border-left-style: solid;" colspan="15">货物或应税劳务名称</td>
                    <td class="invoiceA" colspan="8">规格型号</td>
                    <td class="invoiceA" colspan="4">单位</td>
                    <td class="invoiceA" colspan="6">数&emsp;量</td>
                    <td class="invoiceA" colspan="6">单&emsp;价</td>
                    <td class="invoiceA" colspan="9">金&emsp;额</td>
                    <td class="invoiceA" colspan="4">税率</td>
                    <td class="invoiceA" colspan="9">税&emsp;额</td>
                </tr>
                <tr>
                    <td class="invoiceC" style="border-left-style: solid;" colspan="15"><input type="text" name="invoice.items.name" id="itemsName" style="width: 14em;" maxlength="45" value="${invoice.items.name}" required></td>
                    <td class="invoiceC" colspan="8"><input type="text" name="invoice.items.model" id="itemsModel" style="width: 7em;" maxlength="45" value="${invoice.items.model}"></td>
                    <td class="invoiceC" colspan="4"><input type="text" name="invoice.items.unit" id="itemsUnit" style="width: 3em;" maxlength="45" value="${invoice.items.unit}" required></td>
                    <td class="invoiceC" colspan="6"><input type="number" name="invoice.items.amount" id="itemsAmount" style="width: 5em;" min="1" value="${invoice.items.amount}" required></td>
                    <td class="invoiceC" colspan="6"><input type="text" name="invoice.items.price" id="itemsPrice" style="width: 5em;" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" value="${invoice.items.price}" required></td>
                    <td class="invoiceC" colspan="9"></td>
                    <td class="invoiceC" colspan="4"><input type="text" name="invoice.items.taxRate" id="itemsTaxRate" style="width: 2em;" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" value="${invoice.items.taxRate}" required>%</td>
                    <td class="invoiceC" colspan="9"></td>
                </tr>
                <tr>
                    <td class="invoiceA" style="border-left-style: solid;" colspan="15">合计</td>
                    <td class="invoiceA" colspan="8"></td>
                    <td class="invoiceA" colspan="4"></td>
                    <td class="invoiceA" colspan="6"></td>
                    <td class="invoiceA" colspan="6"></td>
                    <td class="invoiceA" colspan="9"></td>
                    <td class="invoiceA" colspan="4"></td>
                    <td class="invoiceA" colspan="9"></td>
                </tr>
                <tr>
                    <td class="invoiceB" style="border-style: solid" colspan="15">税价合计（大写）</td>
                    <td class="invoiceB" style="border-top-style: solid" colspan="27"></td>
                    <td class="invoiceB" colspan="6">（小写）</td>
                    <td class="invoiceB" style="border-right-style: solid;" colspan="13"></td>
                </tr>
                <tr>
                    <td style="border-style: solid;" rowspan="4" colspan="2">销<div style="height: 12px"></div>贷<div style="height: 12px"></div>单<div style="height: 12px"></div>位</td>
                    <td colspan="8">名&emsp;&emsp;&emsp;&emsp;称:</td>
                    <td colspan="25"><input type="text" name="invoice.payee.name" id="payeeName" style="width: 384px" class="invoiceA" placeholder="请输入名称" value="${invoice.payee.name}"></td>
                    <td style="border-style: solid;" rowspan="4" colspan="2">备<div style="height: 40px"></div>注</td>
                    <td style="border-right-style: solid;" colspan="24"><input type="text" class="invoiceC" name="invoice.remark" style="width: 370px"  maxlength="100" value="${invoice.remark}"></td>
                </tr>
                <tr>
                    <td colspan="8">纳税人识别号:</td>
                    <td colspan="25"><input type="text" name="invoice.payee.id" id="payeeId" style="width: 384px" class="invoiceA" maxlength="45" placeholder="请输入识别号" value="${invoice.payee.id}" required></td>
                    <td style="border-right-style: solid;" colspan="24"></td>
                </tr>
                <tr>
                    <td colspan="8">地&ensp;址、电&ensp;话</span>:</td>
                    <td colspan="25"><input type="text" name="invoice.payee.address" style="width: 188px" class="invoiceA" maxlength="100" placeholder="请输入地址" value="${invoice.payee.address}">&ensp;<input type="text" name="invoice.payee.phoneNumber" style="width: 188px" class="invoiceA" maxlength="45" pattern="([0-9]|-)*" title='只能输入数字和"-"' placeholder="请输入电话" value="${invoice.payee.phoneNumber}"></td>
                    <td style="border-right-style: solid;" colspan="24"></td>
                </tr>
                <tr>
                    <td style="border-bottom-style: solid;" colspan="8">开户行及账号:</td>
                    <td style="border-bottom-style: solid;" colspan="25"><input type="text" name="invoice.payee.bank" id="payeeBank" style="width: 188px" class="invoiceA" maxlength="100" placeholder="请输入开户行" required value="${invoice.payee.bank}">&ensp;<input type="text" name="invoice.payee.bankId" id="payeeBankId" style="width: 188px" class="invoiceA" placeholder="请输入账号" value="${invoice.payee.bankId}" required></td>
                    <td style="border-right-style: solid; border-bottom-style: solid" colspan="24"></td>
                </tr>
                <tr>
                    <td colspan="30"></td>
                    <td colspan="5">开票人：</td>
                    <td colspan="8"><input type="text" name="invoice.drawer" id="drawer" style="width: 112px;" required value="${invoice.drawer}"></td>
                    <td colspan="9">销贷单位：（章）</td>
                </tr>
            </table>
            <input type="submit" class="btn btn-default btn-primary" value="保存">
        </div>
    </form>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
