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
            width;
        }
    </style>
</head>
<body>
<form action="addInvoice" method="POST">
    <table>
        <tr>
            <td><label for="code">类别代码：</label></td>
            <td><input type="text" name="code" id="code" required/></td>
        </tr>
        <tr>
            <td><label for="id">发票编号：</label></td>
            <td><input type="text" name="id" id="id" required/></td>
        </tr>
        <tr>
            <td><label for="date">日期：</label></td>
            <td><input type="date" name="date" id="date" required/></td>
        </tr>
        <tr>
            <td><label for="payer">付款方：</label></td>
            <td><input type="text" name="payer" id="payer" required/></td>
        </tr>
        <tr>
            <td><label for="items">付款项：</label></td>
            <td><input type="text" name="items" id="items" required/></td>
        </tr>
        <tr>
            <td><label for="number">数量：</label></td>
            <td><input type="text" name="number" id="number"/></td>
        </tr>
        <tr>
            <td><label for="price">单价(人民币)：</label></td>
            <td><input type="text" name="price" id="price"/></td>
        </tr>
        <tr>
            <td><label for="remark">备注：</label></td>
            <td><input type="text" name="remark" id="remark"/></td>
        </tr>
        <tr>
            <td><label for="payee">付款方：</label></td>
            <td><input type="text" name="payee" id="payee" required/></td>
        </tr>
        <tr>
            <td><label for="drawer">开票人：</label></td>
            <td><input type="text" name="drawer" id="drawer" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="添加"/></td>
        </tr>
    </table>
</form>>
<a href="operationIndex.jsp">返回主页</a>
</body>
</html>
