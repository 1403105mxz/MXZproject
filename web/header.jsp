<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                adsfasdf<span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="GoOperationIndex.action">财务管理系统</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">发票管理<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="InvoiceOperation.action">查看发票</a></li>
                        <li><a href="GoAddInvoice.action">新增发票</a></li>
                    </ul>
                </li>
                <li><a href="#">报表管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">薪资税率<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">薪资计算</a></li>
                        <li><a href="#">税率计算</a></li>
                    </ul>
                </li>
                <%--<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>--%>
            </ul>
            <form class="navbar-form navbar-left" role="search" action="SearchInvoice.action" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control" name="code" id="code" pattern="([0-9]{10})|([0-9]{12})"
                           title="10或12位数字" maxlength="12" placeholder="类别代码(10或12位)" required/> - <input
                        type="text" class="form-control" name="id" id="id" pattern="[0-9]{8}" maxlength="8" title="8位数字"
                        placeholder="发票编号(8位数字)" required/>
                </div>
                <button type="submit" class="btn btn-default">搜索发票</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=request.getSession().getAttribute("newname")%>
                        <span class="badge">V<%=request.getSession().getAttribute("newid")%></span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href data-toggle="modal" data-target="#修改姓名">修改姓名</a></li>
                        <li><a href data-toggle="modal" data-target="#修改密码" id="changePassword">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="ShowBranch.action">查看下属</a></li>
                    </ul>
                </li>
                <li><a href="SignOut.action">注销</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="modal fade" id="修改姓名" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">修改姓名</h4>
            </div>
            <form action="ChangeName.action" method="post">
                <div class="modal-body">
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">原姓名</span>
                        <input type="text" class="form-control" value="<%=request.getSession().getAttribute("newname")%>" disabled>
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">新姓名</span>
                        <input type="text" class="form-control" name="Editname" id="name" maxlength="20" minlength="2" required placeholder="2-20个字符">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="submit" class="btn btn-primary" value="保存"/>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="修改密码" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <form id="changePasswordForm" action="ChangePassword.action" method="post">
                <div class="modal-body">
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">原密码</span>
                        <input type="password" class="form-control" name="Oldpassword" id="oldPassword" maxlength="20" required/>
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">新密码</span>
                        <input type="password" class="form-control" name="Editpassword" id="password" maxlength="20" minlength="6" required placeholder="6-20个字符"/>
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon">确认密码</span>
                        <input type="password" class="form-control" name="Editpassword2" id="confirmPassword" maxlength="20" minlength="6" required oninput="checkPassword()"/></td>
                    </div>
                    <br/>
                    <div class="alert alert-danger" id="passwordError" role="alert" style="display:none">
                        原密码错误！
                    </div>
                    <div class="alert alert-danger" id="confirmPasswordError" role="alert" style="display:none">
                        两次输入的密码不一致！
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="submit" class="btn btn-primary" onclick="checkPassword()" value="保存"/>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    if("${tip}" == "原密码错误！") {
        //document.getElementById("修改密码").classList.remove("fade");
        document.getElementById("changePassword").click();
        document.getElementById("passwordError").style.display = "block";
    }
    else if("${tip}" == "两次输入的密码不一致") {
        //document.getElementById("修改密码").classList.remove("fade");
        document.getElementById("changePassword").click();
        document.getElementById("confirmPasswordError").style.display = "block";
    }
    function checkPassword() {
        if(document.getElementById("password").value != document.getElementById("confirmPassword").value){
            document.getElementById("passwordError").style.display = "none";
            document.getElementById("confirmPasswordError").style.display = "block";
        }
        else {
            document.getElementById("confirmPasswordError").style.display = "none";
        }
    }
</script>