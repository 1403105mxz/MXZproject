<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/11/13
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>查看发票</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <style>
        table {
            border-style: solid;
            border-collapse: collapse;
            margin: 100px auto;
        }
        tr {
            background-color: #CCCCCC;
        }
        th {
            border-style: solid;
            text-align: center;
        }
        td {
            border-style: solid;
        }
    </style>
</head>
<body>
<div class="container bs-docs-container">
    <table>
        <h1 id="overview" class="page-header">${changeName}的发票</h1>
        <tr>
            <th>类别代码</th>
            <th>发票编号</th>
            <th>日期</th>
            <th>付款方</th>
            <th>付款项</th>
            <th>数量</th>
            <th>单价</th>
            <th>备注</th>
            <th>总价</th>
            <th>收款方</th>
            <th>开票人</th>
        </tr>
        <s:iterator value="branchinvoice" status="st">
            <tr>
                <td><s:property value="code"></s:property> </td>
                <td><s:property value="id"></s:property></td>
                <td><s:property value="date"></s:property> </td>
                <td><s:property value="payer"></s:property> </td>
                <td><s:property value="items"></s:property> </td>
                <td><s:property value="number"></s:property> </td>
                <td><s:property value="price"></s:property> </td>
                <td><s:property value="remark"></s:property> </td>
                <td><s:property value="total"></s:property> </td>
                <td><s:property value="payee"></s:property> </td>
                <td><s:property value="drawer"></s:property> </td>
            </tr>
        </s:iterator>
    </table>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
