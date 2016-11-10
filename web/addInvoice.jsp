<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/10/25
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加发票</title>
    <style>
        table {
            margin: 20em auto;
            table-layout: fixed;
        }
    </style>
</head>
<body>
<form action="addInvoice" method="POST">
    <table>
        <tr>
            <td><label for="code">类别代码：</label></td>
            <td><input type="text" name="code" id="code" pattern="([0-9]{10})|([0-9]{12})" title="10或12位数字" placeholder="10或12位数字" required/></td>
        </tr>
        <tr>
            <td><label for="id">发票编号：</label></td>
            <td><input type="text" name="id" id="id" pattern="[0-9]{8}" title="8位数字" placeholder="8位数字" required/></td>
        </tr>
        <tr>
            <td><label for="date">日期：</label></td>
            <td><input type="date" name="date" id="date" pattern="^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$" placeholder="以YYYY-MM-DD格式输入" required/></td>
        </tr>
        <tr>
            <td><label for="payer">付款方：</label></td>
            <td><input type="text" name="payer" id="payer" maxlength="45" required/></td>
        </tr>
        <tr>
            <td><label for="items">付款项：</label></td>
            <td><input type="text" name="items" id="items" maxlength="45" required/></td>
        </tr>
        <tr>
            <td><label for="number">数量：</label></td>
            <td><input type="number" name="number" id="number" min="1" required/></td>
        </tr>
        <tr>
            <td><label for="price">单价(人民币)：</label></td>
            <td><input type="text" name="price" id="price" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" required/></td>
        </tr>
        <tr>
            <td><label for="remark">备注：</label></td>
            <td><input type="text" name="remark" id="remark" maxlength="45"/></td>
        </tr>
        <tr>
            <td><label for="payee">收款方：</label></td>
            <td><input type="text" name="payee" id="payee" maxlength="45" required/></td>
        </tr>
        <tr>
            <td><label for="drawer">开票人：</label></td>
            <td><input type="text" name="drawer" id="drawer" maxlength="45" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="添加"/></td>
        </tr>
    </table>
</form>>
<a href="operationIndex.jsp">返回主页</a>
</body>
</html>
