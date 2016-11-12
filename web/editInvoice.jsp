<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/11/12
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑发票</title>
</head>
<body>
<s:form action="editInvoice" method="POST">
    <s:hidden name="code" value="%{invoice.code}"/>
    <s:hidden name="id" value="%{invoice.id}"/>
    <s:property value="invoice.code"/>
    <s:property value="invoice.id"/>
    <s:textfield name="payer" label="付款方" value="%{invoice.payer}"/>
    <s:textfield name="items" label="付款项" value="%{invoice.items}"/>
    <s:textfield name="number" label="数量" value="%{invoice.number}"/>
    <s:textfield name="price" label="单价(人民币)" value="%{invoice.price}"/>
    <s:textfield name="remark" label="备注" value="%{invoice.remark}"/>
    <s:textfield name="payee" label="收款项" value="%{invoice.payee}"/>
    <s:textfield name="drawer" label="开票人" value="%{invoice.drawer}"/>
    <s:textfield name="date" label="日期" value="%{invoice.date}"/>
    <s:submit value="提交"/>
</s:form>
<s:a href="search.action?name=%{author.name}">返回</s:a>
</body>
</html>
