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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <script>
        var i = 5;
        var interValid;
        interValid = setInterval("fun()", 1000);
        function fun() {
            if(i==0) {
                location.href = 'index.jsp';
                clearInterval(interValid);
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
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>
