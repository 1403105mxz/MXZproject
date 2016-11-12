<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 祥根_2
  Date: 2016/10/25
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索发票</title>
    <style>
        table {
            margin: 20em auto;
            table-layout: fixed;
            text-align: center;
        }
        td {
            width: 175px;
        }
    </style>
</head>
<body>
    <form action="searchInvoice" method="POST">
        <table>
            <tr>
                <td><label for="code">类别代码</label></td>
                <td><label for="id">发票编号</label></td>
            </tr>
            <tr>
                <td colspan="2"><input type="text" name="code" id="code" pattern="([0-9]{10})|([0-9]{12})"
                                       title="10或12位数字" maxlength="12" placeholder="10或12位数字"/>-<input
                        type="text" name="id" id="id" pattern="[0-9]{8}" maxlength="8" title="8位数字"
                        placeholder="8位数字"/></td>
                <td><input type="submit" value="搜索"/></td>
            </tr>
        </table>
    </form>
<a href="operationIndex.jsp">返回主页</a>
</body>
</html>
