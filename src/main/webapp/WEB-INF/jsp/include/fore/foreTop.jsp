<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<html>

<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/fore/style.css" rel="stylesheet">
    <script>

    </script>
    <%@include file="modal.jsp"%>
    <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img style="margin-left:10px;margin-right:0px" class="pull-left" src="img/site/headPortrait.jpeg" height="45px">
                <a class="navbar-brand">博客</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li <c:if test="${category == 0}"> class="active"</c:if>><a href="firstPage?category=0">首页</a></li>
                    <li <c:if test="${category == 1}"> class="active"</c:if>><a href="foreArticle?category=1">算法</a></li>
                    <li <c:if test="${category == 2}"> class="active"</c:if>><a href="foreArticle?category=2">日常</a></li>
                    <li <c:if test="${category == 3}"> class="active"</c:if>><a href="foreArticle?category=3">Java</a></li>
                    <li <c:if test="${category == 4}"> class="active"</c:if>><a href="foreArticle?category=4">其他</a></li>
                </ul>
                <c:if test="${!empty user}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a >你好:${user.name}</a></li>
                        <li><a href="logout">退出</a></li>
                    </ul>
                </c:if>
                <c:if test="${empty user}">
                    <ul class="nav navbar-nav navbar-right active">
                        <li><a data-toggle="modal" data-target="#myModal">请登陆</a></li>
                        <li><a href="register">注册账号</a></li>
                    </ul>
                </c:if>
                <form action="foreSearch" method="post" class="navbar-form navbar-right">
                    <div class="form-group">
                        <input type="text" class="form-control" value="" name="keyword" placeholder="search">
                    </div>
                    <button type="submit" class="btn btn-default ">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </form>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>