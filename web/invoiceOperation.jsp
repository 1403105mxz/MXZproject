<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/11/1
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发票管理</title>
    <script>
        function onLoad() {
            if("${tip}" == "success") {
                alert("success");
            }
        }
    </script>
</head>
<body onload="onLoad()">
<input type="button" value="添加发票" onclick="location.href='addInvoice'"/>
<input type="button" value="搜索发票" onclick="location.href='searchInvoice'"/>
<INPUT name="logout" type="button" value="退出登录" onclick="location.href='Logout.action'">
<table>
    <s:iterator value="codeidList" var="x">
        <tr>
            <td><s:property value="x"/></td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
