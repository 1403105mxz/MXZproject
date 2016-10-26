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
</head>
<body>
<s:form action="addInvoice" method="POST">
    <s:textfield name="code" label="类别代码"/>
    <s:textfield name="id" label="发票编号"/>
    <s:textfield name="date" label="日期"/>
    <s:textfield name="payer" label="付款方"/>
    <s:textfield name="items" label="付款项"/>
    <s:textfield name="number" label="数量"/>
    <s:textfield name="price" label="单价(人民币)"/>
    <s:textfield name="remark" label="备注"/>
    <s:textfield name="payee" label="收款方"/>
    <s:textfield name="drawer" label="开票人"/>
    <s:textfield name="account" label="所属账号"/>
    <s:submit value="添加"/>
</s:form>
<a href="index.jsp">返回主页</a>
</body>
</html>
