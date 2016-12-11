<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/10/25
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>发票详情</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/invoice.css">
    <script src="/js/main.js"></script>
    <style>
        table {
            margin: 20em auto;
            table-layout: fixed;
            width: 250px;
        }
    </style>
    <script>

    </script>
</head>
<body onload="checkDetailInvoice('${branchAccount}')">
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">发票详情</h1>
        <div class="invoice">
            <div class="invoiceCodeArea">${invoice.code}</div>
            <div class="invoiceTableHead">增值税普通发票<br/>════════════<br/>发票联</div>
            <div class="invoiceIdArea">
                <span style="font-family: Times New Roman">№</span>${invoice.id}
            </div>
            <div class="invoiceCheckCodeArea">
                校验码：${invoice.checkCode}
            </div>
            <div class="invoiceDateArea">
                开票日期：${invoice.date}
            </div>
            <table border="1" class="invoiceTable" cellpadding="10">
                <tr>
                    <td class="allInvoice" style="width: 2em; border-style: solid;" rowspan="4" colspan="2">购<div style="height: 12px"></div>贷<div style="height: 12px"></div>单<div style="height: 12px"></div>位</td>
                    <td class="allInvoice" style="width: 33em; border-top-style: solid;" colspan="33">名&emsp;&emsp;&emsp;&emsp;称：${invoice.payer.name}</td>
                    <td class="allInvoice" style="width: 2em; border-style: solid;" rowspan="4" colspan="2">密<div style="height: 20px"></div>码<div style="height: 20px"></div>区</td>
                    <td class="allInvoice" style="width: 384px; border-style: solid;" rowspan="4" colspan="24"></td>
                </tr>
                <tr>
                    <td colspan="33">纳税人识别号：${invoice.payer.id}</td>
                </tr>
                <tr>
                    <td colspan="33">地&ensp;址、电&ensp;话：${invoice.payer.address}&ensp;${invoice.payer.phoneNumber}</td>
                </tr>
                <tr>
                    <td style="border-bottom-style: solid;" colspan="33">开户行及账号：${invoice.payer.bank}&ensp;${invoice.payer.bankId}</td>
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
                    <td class="invoiceD" style="border-left-style: solid;" colspan="15">${invoice.items.name}</td>
                    <td class="invoiceD" colspan="8">${invoice.items.model}</td>
                    <td class="invoiceD" colspan="4">${invoice.items.unit}</td>
                    <td class="invoiceD" colspan="6">${invoice.items.amount}</td>
                    <td class="invoiceD" colspan="6">${invoice.items.price}</td>
                    <td class="invoiceD" colspan="9">${invoice.items.income}</td>
                    <td class="invoiceD" colspan="4">${invoice.items.taxRate}%</td>
                    <td class="invoiceD" colspan="9">${invoice.items.tax}</td>
                </tr>
                <tr>
                    <td class="invoiceA" style="border-left-style: solid;" colspan="15">合计</td>
                    <td class="invoiceA" colspan="8"></td>
                    <td class="invoiceA" colspan="4"></td>
                    <td class="invoiceA" colspan="6"></td>
                    <td class="invoiceA" colspan="6"></td>
                    <td class="invoiceA" colspan="9">¥${invoice.items.income}</td>
                    <td class="invoiceA" colspan="4"></td>
                    <td class="invoiceA" colspan="9">¥${invoice.items.tax}</td>
                </tr>
                <tr>
                    <td class="invoiceB" style="border-style: solid" colspan="15">税价合计（大写）</td>
                    <td class="invoiceB" style="border-top-style: solid; text-align: left" colspan="27"><img src="/img/WingDings.png">${invoice.items.total2}</td>
                    <td class="invoiceB" colspan="6">（小写）</td>
                    <td class="invoiceB" style="border-right-style: solid; text-align: left" colspan="13">¥${invoice.items.total}</td>
                </tr>
                <tr>
                    <td style="border-style: solid;" rowspan="4" colspan="2">销<div style="height: 12px"></div>贷<div style="height: 12px"></div>单<div style="height: 12px"></div>位</td>
                    <td colspan="33">名&emsp;&emsp;&emsp;&emsp;称：${invoice.payee.name}</td>
                    <td style="border-style: solid;" rowspan="4" colspan="2">备<div style="height: 40px"></div>注</td>
                    <td style="border-right-style: solid;" colspan="24">${invoice.remark}</td>
                </tr>
                <tr>
                    <td colspan="33">纳税人识别号：${invoice.payee.id}</td>
                    <td style="border-right-style: solid;" colspan="24"></td>
                </tr>
                <tr>
                    <td colspan="33">地&ensp;址、电&ensp;话：${invoice.payee.address}&ensp;${invoice.payee.phoneNumber}</td>
                    <td style="border-right-style: solid;" colspan="24"></td>
                </tr>
                <tr>
                    <td style="border-bottom-style: solid;" colspan="33">开户行及账号：${invoice.payee.bank}&ensp;${invoice.payee.bankId}</td>
                    <td style="border-right-style: solid; border-bottom-style: solid" colspan="24"></td>
                </tr>
                <tr>
                    <td colspan="30"></td>
                    <td colspan="13">开票人：${invoice.drawer}</td>
                    <td colspan="9">销贷单位：（章）</td>
                </tr>
            </table>
            <input type="button" id="delete" class="btn btn-danger" style="position:absolute; right: 100px" value="作废" onclick="delInvoice(${code},${id})">
            <input type="button" id="edit" class="btn btn-primary" style="position:absolute; right: 200px"value="编辑" onclick="location.href='GoEditInvoice?code=${code}&id=${id}'">
            <%--<input type="button" id="back" class="btn btn-default " style="position:absolute; right: 0px"value="返回" onclick="location.href='InvoiceOperation'">--%>
        </div>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
