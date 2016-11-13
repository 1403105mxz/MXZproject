<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/11/13
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>查看发票</title>
</head>
<body>
当前用户：<%=request.getSession().getAttribute("newname")%>
<br/>
权限级别：<%=request.getSession().getAttribute("newid")%>
<br/>
查看用户：${changep}
<br/>
<table>
    <tr>
        <td class ="allLi">类别代码</td>
        <td class ="allLi">发票编号</td>
        <td class ="allLi">日期</td>
        <td class ="allLi">付款方</td>
        <td class ="allLi">付款项</td>
        <td class ="allLi">数量</td>
        <td class ="allLi">单价</td>
        <td class ="allLi">备注</td>
        <td class ="allLi">总价</td>
        <td class ="allLi">收款方</td>
        <td class ="allLi">开票人</td>
    </tr>
    <s:iterator value="branchinvoice" status="st">
        <tr>
            <td><s:property value="code"></s:property> </td>
            <td><s:property value="id"></s:property></td>
            <td><s:property value="date"></s:property> </td>
            <td><s:property value="payer"></s:property> </td>
            <td><s:property value="items"></s:property> </td>
            <td><s:property value="number"></s:property> </td>
            <td><s:property value="price"></s:property> </td>
            <td><s:property value="remark"></s:property> </td>
            <td><s:property value="total"></s:property> </td>
            <td><s:property value="payee"></s:property> </td>
            <td><s:property value="drawer"></s:property> </td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
