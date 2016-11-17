<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/11/1
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>发票管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <script src="/js/main.js"></script>
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
        }
        td {
            border-style: solid;
        }
    </style>
    <script>
        function del(code, id) {
            var r = confirm("确认作废该发票吗？");
            if(r == true) {
                location.href = "DeleteInvoice?code=" + code + "&id=" + id;
            }
        }
    </script>
</head>
<body>
<table>
    <thead>
        <tr>
            <th>类别代码</th>
            <th>发票编号</th>
            <th>付款项</th>
            <th>总额</th>
            <th></th>
        </tr>
    </thead>
    <s:iterator value="invoiceList" status="st">
        <tr>
            <td>${code}</td>
            <td>${id}</td>
            <td>${items.name}</td>
            <td><script>
                document.write(fmoney(${items.finalTotal1},2));
            </script></td>
            <td><input type = "button" value = "作废" onclick="delInvoice('${code}', '${id}')"/>
                <input type = "button" value = "详情"
                       onclick="location.href='DetailInvoice?code=${code}&id=${id}'">
                <input type = "button" value = "编辑"
                       onclick="location.href='GoEditInvoice?code=${code}&id=${id}'"></td>
        </tr>
    </s:iterator>
</table>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
