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
</head>
<body>
<table>
    <tr><td><s:property value="invoice.code"/></td></tr>
    <tr><td><s:property value="invoice.id"/></td></tr>
    <tr><td><s:property value="invoice.date"/></td></tr>
    <tr><td><s:property value="invoice.payer"/></td></tr>
    <tr><td><s:property value="invoice.items"/></td></tr>
    <tr><td><s:property value="invoice.number"/></td></tr>
    <tr><td><s:property value="invoice.price"/></td></tr>
    <tr><td><s:property value="invoice.remark"/></td></tr>
    <tr><td><s:property value="invoice.total"/></td></tr>
    <tr><td><s:property value="invoice.payee"/></td></tr>
    <tr><td><s:property value="invoice.drawer"/></td></tr>
    <tr><td><input type = "button" value = "作废"
                   onclick="location.href='deleteInvoice.action?code=${code}&id=${id}'"></td></tr>
    <td><input type = "button" value = "编辑"
               onclick="location.href='editInvoice?code=${code}&id=${id}&firstTime=${'firstTime'}'"></td>
</table>
<a href="operationIndex.jsp">返回主页</a>
</body>
</html>
