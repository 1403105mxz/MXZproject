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
<body class="signIn">
<div class="container bs-docs-container">
    <div class="jumbotron success">
        <h1>${successTips}</h1>
        <p>将在<span id="mes">5</span>秒后返回主页。</p>
        <p><a class="btn btn-primary btn-lg" href="index.jsp" role="button">立即返回</a></p>
    </div>
</div>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>
