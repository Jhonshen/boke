<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<html>

<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/back/style.css" rel="stylesheet">
    <title>文章管理</title>

    <div class="workingArea">
        <h1 class="label label-info" >文章管理</h1>

        <br>
        <br>
        <div class="listDataTableDiv">
            <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                <tr class="success">
                    <th >ID</th>
                    <th>文章标题</th>
                    <th>文章分类</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${articles}" var="a">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.title}</td>
                        <td>${a.category.name}</td>
                        <td><a href="admin_article_edit?id=${a.id}">修改</a></td>
                        <td><a href="admin_article_delete?id=${a.id}">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="pageDiv">
            <%@include file="../include/admin/adminPage.jsp" %>
        </div>
    </div>

    <div >
        <%@include file="../include/admin/adminFooter.jsp"%>
    </div>
