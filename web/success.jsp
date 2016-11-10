<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/10/25
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${successTips}</title>
    <script>
        var i = 5;
        var intervalid;
        intervalid = setInterval("fun()", 1000);
        function fun() {
            if(i==0) {
                location.href = 'index.jsp';
                clearInterval(intervalid);
            }
            else {
                document.getElementById("mes").innerHTML = i;
                i--;
            }
        }
    </script>
</head>
<body>

    ${successTips},将在<span id="mes">5</span>秒后返回主页。<br/>
    <INPUT name="back" type="button" value="返回" onclick="location.href='index.jsp'">
</body>
</html>
