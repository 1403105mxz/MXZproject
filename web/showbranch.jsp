<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/11/12
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>查看我的下属</title>
</head>
<body>
当前用户：<%=request.getSession().getAttribute("newname")%>
<br/>
权限级别：<%=request.getSession().getAttribute("newid")%>
${tips4}
<br/>
<table class = "user">
    <tr>
        <td class ="allLi">用户名</td>
        <td class ="allLi">姓名</td>
        <td class ="allLi">ID</td>
    </tr>
    <s:iterator value="branch" status="st">
        <tr>
            <td><s:property value="username"></s:property> </td>
            <td><s:property value="name"></s:property></td>
            <td><s:property value="id"></s:property> </td>
            <td><a href = "Changeid.action?changep=${username}">查看</a></td>
            <td><a href = "Gochangeid.action?changep=${username}">修改权限</a></td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
