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

        }
        tr {

        }
        th {

        }
        td {

        }
    </style>
</head>
<body>
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">你的下属</h1>
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>权限等级</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator value="branch" status="st">
                        <tr>
                            <td><s:property value="username"></s:property> </td>
                            <td><s:property value="name"></s:property></td>
                            <td><s:property value="id"></s:property> </td>
                            <td colspan="2">
                                <a class="btn btn-info" href = "ShowBranchInvoice.action?changep=${username}&changeName=${name}">查看发票</a>
                                <a class="btn btn-primary" href = "GoChangeId.action?changep=${username}">修改权限</a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
