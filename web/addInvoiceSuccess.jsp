<%--
  Created by IntelliJ IDEA.
  User: 54333
  Date: 2016/11/12
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加成功</title>
    <script>
        if("${tip}" == "success") {
            var r = confirm("添加成功\n是否继续添加？");
            if(r == true){
                location.href = "addInvoice";
            }
            else {
                location.href = "invoiceOperation"
            }
        }
    </script>
</head>
<body>

</body>
</html>
