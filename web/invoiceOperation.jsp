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
    <style>
        table {
            border-style: solid;
            border-collapse: collapse;
        }
        tr {
            background-color: #CCCCCC;
        }
        th {
            border-style: solid;
        }
        td {
            border-style: solid;
        }
    </style>
    <script>
        function del(code, id) {
            var r = confirm("确认作废该发票吗？");
            if(r == true) {
                location.href = "deleteInvoice?code=" + code + "&id=" + id;
            }
        }
    </script>
</head>
<body>
<input type="button" value="添加发票" onclick="location.href='addInvoice'"/>
<input type="button" value="搜索发票" onclick="location.href='searchInvoice'"/>
<input name="logout" type="button" value="退出登录" onclick="location.href='Logout.action'">
<table>
    <thead>
        <tr>
            <th>类别代码</th>
            <th>发票编号</th>
            <th>付款项</th>
            <th>总额</th>
            <th></th>
        </tr>
    </thead>
    <s:iterator value="codeidList" status="st">
        <tr>
            <td>${code}</td>
            <td>${id}</td>
            <td>${items}</td>
            <td>${total}</td>
            <td><input type = "button" value = "作废" onclick="del('${code}', '${id}')"/>
                <input type = "button" value = "详情"
                       onclick="location.href='detailInvoice?code=${code}&id=${id}'">
                <input type = "button" value = "编辑"
                       onclick="location.href='editInvoice?code=${code}&id=${id}&firstTime=${'firstTime'}'"></td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
