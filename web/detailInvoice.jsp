<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/10/25
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索结果</title>
    <style>
        table {
            margin: 20em auto;
            table-layout: fixed;
            width: 250px;
        }
    </style>
    <script>
        function del(code, id) {
            var r = confirm("确认作废该发票吗？");
            if(r == true) {
                location.href = "deleteInvoice?code=" + code + "&id=" + id;
            }
        }
    </script>
</head>
<body>
<table>
    <tr>
        <td>类别代码：</td>
        <td>${invoice.code}</td>
    </tr>
    <tr>
        <td>发票编号：</td>
        <td>${invoice.id}</td></tr>
    <tr>
        <td>日期：</td>
        <td>${invoice.date}</td>
    </tr>
    <tr>
        <td>付款方：</td>
        <td>${invoice.payer}</td>
    </tr>
    <tr>
        <td>付款项：</td>
        <td>${invoice.items}</td>
    </tr>
    <tr>
        <td>数量：</td>
        <td>${invoice.number}</td>
    </tr>
    <tr>
        <td>单价(人民币)：</td>
        <td>${invoice.price}</td>
    </tr>
    <tr>
        <td>备注：</td>
        <td>${invoice.remark}</td>
    </tr>
    <tr>
        <td>总额：</td>
        <td>${invoice.total}</td>
    </tr>
    <tr>
        <td>收款方：</td>
        <td>${invoice.payee}</td>
    </tr>
    <tr>
        <td>开票人：</td>
        <td>${invoice.drawer}</td>
    </tr>
    <tr><td><input type = "button" value = "作废" onclick="del(${code},${id})"></td></tr>
    <td><input type = "button" value = "编辑"
               onclick="location.href='editInvoice?code=${code}&id=${id}&firstTime=${'firstTime'}'"></td>
</table>
<a href="operationIndex.jsp">返回主页</a>
</body>
</html>
