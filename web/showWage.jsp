<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 54333
  Date: 2016/11/13
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html lang="zh-CN">
<head>
    <title>薪资查询</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>
<body onload="checkWage(<%=request.getSession().getAttribute("newid")%>)">
    <div class="container bs-docs-container">
        <h1 id="overview" class="page-header">薪资查询</h1>
        <table id="myWage" class="table table-striped table-bordered table-hover">
            <caption><h3>你的工资</h3></caption>
            <thead>
            <tr>
                <th>出勤天数</th>
                <th>基础工资</th>
                <th>奖金</th>
                <th>扣除情况</th>
                <th>应发工资</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>${wage.attendanceday}</th>
                <th>${wage.basewage}</th>
                <th>${wage.bonus}</th>
                <th>${wage.deduction}</th>
                <th>${wage.total}</th>
            </tr>
            </tbody>
        </table>

        <table id="wageList" class="table table-striped table-bordered table-hover">
            <caption><h3>下属工资</h3></caption>
            <thead>
                <tr>
                    <th>姓名</th>
                    <th>出勤天数</th>
                    <th>基础工资</th>
                    <th>奖金</th>
                    <th>扣除情况</th>
                    <th>应发工资</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <s:iterator value="wagelist" status="st">
                <tr>
                    <td>${name}</td>
                    <td>${attendanceday}</td>
                    <td>${basewage}</td>
                    <td>${bonus}</td>
                    <td>${deduction}</td>
                    <td>${total}</td>
                    <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#编辑${username}">编辑</button></td>
                    <div class="modal fade" id="编辑${username}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">编辑<small>${name}</small></h4>
                                </div>
                                <form action="EditWage.action" method="post">
                                    <div class="modal-body">
                                        <br/>
                                        <div class="input-group">
                                            <span class="input-group-addon">出勤天数</span>
                                            <input type="text" class="form-control" name="wage.attendanceday" value="${attendanceday}">
                                        </div>
                                        <br/>
                                        <div class="input-group">
                                            <span class="input-group-addon">基础工资</span>
                                            <input type="text" class="form-control" name="wage.basewage" value="${basewage}">
                                        </div>
                                        <br/>
                                        <div class="input-group">
                                            <span class="input-group-addon">奖金</span>
                                            <input type="text" class="form-control" name="wage.bonus" value="${bonus}">
                                        </div>
                                        <br/>
                                        <div class="input-group">
                                            <span class="input-group-addon">应扣项目</span>
                                            <input type="text" class="form-control" name="wage.deduction" value="${deduction}">
                                        </div>
                                    </div>
                                    <input type="hidden" name="wage.id" value="${id}">
                                    <input type="hidden" name="wage.username" value="${username}">
                                    <input type="hidden" name="wage.name" value="${name}">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <input type="submit" class="btn btn-primary" value="保存"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/main.js"></script>
</body>
</html>
