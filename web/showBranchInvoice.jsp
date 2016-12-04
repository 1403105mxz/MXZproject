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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <script src="/js/main.js"></script>
    <style>
        table {

        }
        tr {

        }
        th {

        }
        td {
            vertical-align: bottom;
            line-height: 1.5em;
        }
    </style>
</head>
<body>
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">${changeName}的发票</h1>
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>类别代码</th>
                        <th>发票编号</th>
                        <th>日期</th>
                        <th>付款项</th>
                        <th>数量</th>
                        <th>总额</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator value="branchinvoice" status="st">
                        <tr>
                            <td>${code}</td>
                            <td>${id}</td>
                            <td>${date}</td>
                            <td>${items.name}</td>
                            <td>
                                <script>
                                    document.write(fmoney(${items.amount},0));
                                </script>
                            </td>
                            <td>
                                <script>
                                    document.write(fmoney(${items.income},2));
                                </script>
                            </td>
                            <td>
                                <form action="DetailInvoice.action" style="display: inline" method="post">
                                    <input type="hidden" name="branchAccount" value="${changep}">
                                    <input type="hidden" name="code" value="${code}">
                                    <input type="hidden" name="id" value="${id}">
                                    <input type="submit" class="btn btn-info" value="详情">
                                </form>
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
