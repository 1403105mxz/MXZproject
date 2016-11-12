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
    <s:iterator value="codeidList" status="st">
        <tr>
            <td><s:property value="code"/></td>
            <td><s:property value="id"/></td>
            <td><s:property value="items"/></td>
            <td><s:property value="total"/></td>
            <td><input type = "button" value = "作废"
                       onclick="location.href='deleteInvoice.action?code=${code}&id=${id}'"></td>
            <td><input type = "button" value = "详情"
                       onclick="location.href='detailInvoice.action?code=${code}&id=${id}'"></td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
