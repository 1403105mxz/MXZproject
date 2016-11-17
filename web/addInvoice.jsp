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
        td {
            padding: 0.25em 0.5em;
            border-style: none;
        }
        td.a {
            border-right-style: solid;
            text-align: center;
            letter-spacing: 1px;
            border-collapse: collapse;
        }

        td.b {
            border-style: solid;
            text-align: center;
            letter-spacing: 1px;
            border-collapse: collapse;
        }

        input.a {
            padding: 0;
            border-collapse: collapse;
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
        <td style="width: 2em; border-style: solid;" rowspan="4" colspan="2">购<div style="height: 12px"></div>贷<div style="height: 12px"></div>单<div style="height: 12px"></div>位</td>
        <td style="width: 8em;" colspan="8">名&emsp;&emsp;&emsp;&emsp;称:</td>
        <td style="width: 400px;" colspan="25"><input type="text" style="width: 384px" class="a" placeholder="请输入名称"></td>
        <td style="width: 2em; border-style: solid;" rowspan="4" colspan="2">密<div style="height: 20px"></div>码<div style="height: 20px"></div>区</td>
        <td style="width: 384px; border-style: solid;" rowspan="4" colspan="24"></td>
    </tr>
    <tr>
        <td colspan="8">纳税人识别号:</td>
        <td colspan="25"><input type="text" style="width: 384px" class="a" placeholder="请输入识别号"></td>
    </tr>
    <tr>
        <td colspan="8">地&ensp;址、电&ensp;话</span>:</td>
        <td colspan="25"><input type="text" style="width: 188px" class="a" placeholder="请输入地址">&ensp;<input type="text" style="width: 188px" class="a" placeholder="请输入电话"></td>
    </tr>
    <tr>
        <td style="border-bottom-style: solid;" colspan="8">开户行及账号:</td>
        <td style="border-bottom-style: solid;" colspan="25"><input type="text" style="width: 188px" class="a" placeholder="请输入开户行">&ensp;<input type="text" style="width: 188px" class="a" placeholder="请输入账号"></td>
    </tr>
    <tr>
        <td class="a" colspan="15">货物或应税劳务名称</td>
        <td class="a" colspan="8">规格型号</td>
        <td class="a" colspan="4">单位</td>
        <td class="a" colspan="6">数&emsp;量</td>
        <td class="a" colspan="6">单&emsp;价</td>
        <td class="a" colspan="9">金&emsp;额</td>
        <td class="a" colspan="4">税率</td>
        <td class="a" colspan="9">税&emsp;额</td>
    </tr>
    <tr>
        <td style="border-right-style: solid;" colspan="15"><textarea rows="11" cols="25"></textarea></td>
        <td style="border-right-style: solid;" colspan="8"><textarea rows="11" cols="11"></textarea></td>
        <td style="border-right-style: solid;" colspan="4"><textarea rows="11" cols="3"></textarea></td>
        <td style="border-right-style: solid;" colspan="6"><textarea rows="11" cols="7"></textarea></td>
        <td style="border-right-style: solid;" colspan="6"><textarea rows="11" cols="7"></textarea></td>
        <td style="border-right-style: solid;" colspan="9"><textarea rows="11" cols="13"></textarea></td>
        <td style="border-right-style: solid;" colspan="4"><textarea rows="11" cols="3"></textarea></td>
        <td style="border-right-style: solid;" colspan="9"><textarea rows="11" cols="13"></textarea></td>
    </tr>
    <tr>
        <td class="a" colspan="15">合计</td>
        <td class="a" colspan="8"></td>
        <td class="a" colspan="4"></td>
        <td class="a" colspan="6"></td>
        <td class="a" colspan="6"></td>
        <td class="a" colspan="9"></td>
        <td class="a" colspan="4"></td>
        <td class="a" colspan="9"></td>
    </tr>
    <tr>
        <td class="a" style="border-style: solid" colspan="15">税价合计（大写）</td>
        <td class="a" colspan="27"></td>
        <td class="a" colspan="6">（小写）</td>
        <td class="a" colspan="13"></td>
    </tr>
</table>
<%--
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">添加发票</h1>
        <form class="form-horizontal" action="addInvoice.action" method="POST">
            <div class="form-group">
                <label for="invoiceCode" class="col-sm-2 control-label">类别代码</label>
                <div class="col-sm-6">
                    <input type="text" style="height:17px;" class="form-control" name="code" id="invoiceCode" pattern="([0-9]{10})|([0-9]{12})" title="10或12位数字" maxlength="12" placeholder="10或12位数字" onblur="onBlur('invoiceCode')" required value="${code}">
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
                    <input type="text" style="height:17px;" class="form-control" name="id" id="invoiceId" pattern="[0-9]{8}" title="8位数字" maxlength="8" placeholder="8位数字" onblur="onBlur('invoiceId')" required value="${id}"/>
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
                    <input type="text" style="height:17px;" class="form-control" name="payer" id="payer" maxlength="45" required value="${payer}">
                </div>
            </div>
            <div class="form-group">
                <label for="items" class="col-sm-2 control-label">付款项</label>
                <div class="col-sm-6">
                    <input type="text" style="height:17px;" class="form-control" name="items" id="items" maxlength="45" required value="${items}">
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
                    <input type="text" style="height:17px;" class="form-control" name="price" id="price" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" required value="${price}">
                </div>
            </div>
            <div class="form-group">
                <label for="remark" class="col-sm-2 control-label">备注</label>
                <div class="col-sm-6">
                    <input type="text" style="height:17px;" class="form-control" name="remark" id="remark" maxlength="45" value="${remark}">
                </div>
            </div>
            <div class="form-group">
                <label for="payee" class="col-sm-2 control-label">收款方</label>
                <div class="col-sm-6">
                    <input type="text" style="height:17px;" class="form-control" name="payee" id="payee" maxlength="45" required value="${payee}">
                </div>
            </div>
            <div class="form-group">
                <label for="drawer" class="col-sm-2 control-label">开票人</label>
                <div class="col-sm-6">
                    <input type="text" style="height:17px;" class="form-control" name="drawer" id="drawer" maxlength="45" required value="${drawer}">
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
