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
</head>
<body>
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">你的发票</h1>
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
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator value="invoiceList" status="st">
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
                            <td><input type = "button" class="btn btn-info" value = "详情"
                                       onclick="location.href='DetailInvoice?code=${code}&id=${id}'">
                                <input type = "button" class="btn btn-primary" value = "编辑"
                                       onclick="location.href='GoEditInvoice?code=${code}&id=${id}'">
                                <input type = "button" class="btn btn-danger" value = "作废"
                                       onclick="delInvoice('${code}', '${id}')"/></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <nav>
            <ul class="pagination">
                <li><a href="InvoiceOperation.action?pageNumber=1">首页</a></li>
                <li><a href="InvoiceOperation.action?pageNumber=${pageNumber-1}">上一页</a></li>
                <script>
                    var total = ${totalPage};
                    var now = ${pageNumber};
                    if(total < 10) {
                        for(var i=1; i<=total; i++) {
                            if (now == i) {
                                document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                            }
                            else {
                                document.write("<li><a href='InvoiceOperation.action?pageNumber=" + i + "'>" + i + "</a></li>");
                            }
                        }
                    }
                    else {
                        if (now <= 5) {
                            for(var i=1; i<=10; i++) {
                                if (now == i) {
                                    document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                                }
                            else {
                                    document.write("<li><a href='InvoiceOperation.action?pageNumber=" + i + "'>" + i + "</a></li>");
                                }
                            }
                        }
                        else if (now >= total - 5) {
                            for(var i=total-9; i<=total; i++) {
                                if (now == i) {
                                    document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                                }
                            else {
                                    document.write("<li><a href='InvoiceOperation.action?pageNumber=" + i + "'>" + i + "</a></li>");
                                }
                            }
                        }
                        else {
                            for(var i=now-4; i<=now+5; i++) {
                                if (now == i) {
                                    document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                                }
                                else {
                                    document.write("<li><a href='InvoiceOperation.action?pageNumber=" + i + "'>" + i + "</a></li>");
                                }
                            }
                        }
                    }
                    </script>
                <li><a href="InvoiceOperation.action?pageNumber=${pageNumber+1}">下一页</a></li>
                <li><a href="InvoiceOperation.action?pageNumber=${totalPage}">末页</a></li>
            </ul>
        </nav>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
