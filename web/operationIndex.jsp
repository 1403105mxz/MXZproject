<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/11/1
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导航页</title>
</head>
<body>
当前用户：<%=request.getSession().getAttribute("newname")%>
<br/>
权限级别：<%=request.getSession().getAttribute("newid")%>
<br/>
${tips4}
<br/>
<input type="button" onclick="location.href='invoiceOperation'" value="发票管理"/>
<INPUT name="logout" type="button" value="退出登录" onclick="location.href='Logout.action'">
<INPUT name="showbranch" type="button" value="查看下属" onclick="location.href='Showbranch.action'">
</body>
</html>
