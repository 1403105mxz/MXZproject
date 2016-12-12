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
    <title>支出管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container bs-docs-container" style="position: relative">
    <h1 id="overview" class="page-header">支出管理<small>${date}</small></h1>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>金额</th>
                <th>备注</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="businessList" status="st">
                <tr>
                    <td>${money}</td>
                    <td>${remark}</td>
                    <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#修改${id}">修改</button></td>
                </tr>
                <div class="modal fade" id="修改${id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">修改</h4>
                            </div>
                            <form action="EditOutBusiness.action?pageNumber=${pageNumber}" method="post">
                                <div class="modal-body">
                                    <br/>
                                    <div class="input-group">
                                        <span class="input-group-addon">日期</span>
                                        <input type="text" class="form-control" name="business.date" value="${date}" readonly>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <span class="input-group-addon">金额</span>
                                        <input type="text" class="form-control" name="business.money" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" value="${money}" required>
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <span class="input-group-addon">备注</span>
                                        <input type="text" class="form-control" name="business.remark" maxlength="45" value="${remark}" required>
                                    </div>
                                </div>
                                <input type="hidden" name="business.id" value="${id}">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <input type="submit" class="btn btn-primary" value="保存"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </s:iterator>
            </tbody>
        </table>
    </div>
    <div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#新增">新增</button>
        <button type="submit" class="btn btn-default" style="position: absolute; right: 15px;" value="返回" onclick="location.href='OutOperation'">返回</button>
        <div class="modal fade" id="新增" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">新增</h4>
                    </div>
                    <form action="AddOutDate.action?pageNumber=${totalPage+1}" method="post">
                        <div class="modal-body">
                            <br/>
                            <div class="input-group">
                                <span class="input-group-addon">日期</span>
                                <input type="text" class="form-control" name="business.date" value="${date}" readonly>
                            </div>
                            <br/>
                            <div class="input-group">
                                <span class="input-group-addon">金额</span>
                                <input type="text" class="form-control" name="business.money" pattern="[0-9]+(.[0-9]+)?" title="不小于零的数字" required>
                            </div>
                            <br/>
                            <div class="input-group">
                                <span class="input-group-addon">备注</span>
                                <input type="text" class="form-control" name="business.remark" maxlength="45">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <input type="submit" class="btn btn-primary" value="新增"/>
                        </div>
                        <input type="hidden" name="business.id" value="${id}">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <nav>
        <ul class="pagination">
            <li><a href="DetailInDate.action?date=${date}&pageNumber=1">首页</a></li>
            <li><a href="DetailInDate.action?date=${date}&pageNumber=${pageNumber-1}">上一页</a></li>
            <script>
                var total = ${totalPage};
                var now = ${pageNumber};
                if(total < 10) {
                    for(var i=1; i<=total; i++) {
                        if (now == i) {
                            document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                        }
                        else {
                            document.write("<li><a href='DetailInDate.action?date=${date}&pageNumber=" + i + "'>" + i + "</a></li>");
                        }
                    }
                }
                else {
                    if (now <= 5) {
                        for(var i=1; i<=10; i++) {
                            if (now == i) {
                                document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                            }
                            else {
                                document.write("<li><a href='DetailInDate.action?date=${date}&pageNumber=" + i + "'>" + i + "</a></li>");
                            }
                        }
                    }
                    else if (now >= total - 5) {
                        for(var i=total-9; i<=total; i++) {
                            if (now == i) {
                                document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                            }
                            else {
                                document.write("<li><a href='DetailInDate.action?date=${date}&pageNumber=" + i + "'>" + i + "</a></li>");
                            }
                        }
                    }
                    else {
                        for(var i=now-4; i<=now+5; i++) {
                            if (now == i) {
                                document.write("<li class='active'><a href='#'>" + i + "<span class='sr-only'>(current)</span></a></li>");

                            }
                            else {
                                document.write("<li><a href='DetailInDate.action?date=${date}&pageNumber=" + i + "'>" + i + "</a></li>");
                            }
                        }
                    }
                }
            </script>
            <li><a href="DetailInDate.action?date=${date}&pageNumber=${pageNumber+1}">下一页</a></li>
            <li><a href="DetailInDate.action?date=${date}&pageNumber=${totalPage}">末页</a></li>
        </ul>
    </nav>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
