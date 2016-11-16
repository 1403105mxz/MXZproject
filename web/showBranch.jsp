<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/11/12
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>查看我的下属</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
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
<br/>
<table>
        <tr>
            <th>用户名</th>
            <th>姓名</th>
            <th>ID</th>
            <th>操作</th>
        </tr>
    <s:iterator value="branch" status="st">
        <tr>
            <td><s:property value="username"></s:property> </td>
            <td><s:property value="name"></s:property></td>
            <td><s:property value="id"></s:property> </td>
            <td colspan="2"><a href = "Showbranchinvoice.action?changep=${username}&changeName=${name}">查看</a>
            <a href = "Gochangeid.action?changep=${username}">修改权限</a></td>
        </tr>
    </s:iterator>
</table>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
