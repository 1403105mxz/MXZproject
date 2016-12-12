<%--
  Created by IntelliJ IDEA.
  User: 54333
  Date: 2016/11/12
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>添加成功</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <script>
        if("${tip}" == "success") {
            var r = confirm("添加成功\n是否继续添加？");
            if(r == true){
                location.href = "GoAddInvoice";
            }
            else {
                location.href = "InvoiceOperation"
            }
        }
    </script>
</head>
<body>
</body>
</html>
