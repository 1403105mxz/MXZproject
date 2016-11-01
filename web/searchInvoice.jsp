<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/10/25
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索发票</title>
</head>
<body>
<s:form action="searchInvoice" method="POST">
    <s:textfield name="code" label="类别代码"/>
    <s:textfield name="id" label="发票编号"/>
    <s:submit value="搜索"/>
</s:form>
<a href="operationIndex.jsp">返回主页</a>
</body>
</html>
