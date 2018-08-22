<%--
  Created by IntelliJ IDEA.
  User: Jhon
  Date: 2018/8/10
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
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
    <title>首页</title>
<body >
<script>
    $(function () {
        $("#comment").click(function(){
            if($("#comments").attr("class") == "hidden")
                $("#comments").attr("class", "show")
            else
                $("#comments").attr("class", "hidden")
        })
    })
    $(function () {
        $("#writeComment").click(function () {
            var page="forechecklogin"
            $.get(
                page,
                function(result){
                    if("success" == result){
                        $("#writeInput").attr("class","show")
                    }
                    else{
                        $("#myModal").modal("show")
                    }
                }
            )
            return false;
        })
    })
</script>
<%@include file="../include/fore/foreTop.jsp"%>
<div class="articleArea">
    <div classs="articleDiv">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">${article.title}</h3>
            </div>
            <div class="panel-body">
                ${article.context}
                    <div class="panel panel-default comment">
                        <div class="panel-body">
                            <a href="#nowhere" id="comment">
                                <span class="glyphicon glyphicon-comment"></span> ${comments.size()}条评论
                            </a>
                            <a href="#nowhere" class="pull-right" id="writeComment">
                                <span class="glyphicon glyphicon-pencil"></span>写评论
                            </a>
                            <div id="comments" class="hidden">
                                <c:forEach items="${comments}"  var="c" varStatus="st">
                                    <span class="glyphicon glyphicon-user"></span> ${c.user.name}:
                                    <br>
                                    ${c.context}
                                    <br>
                                </c:forEach>
                            </div>
                            <div id="writeInput" class="hidden">
                                <form action="foreWriteComment" method="post">
                                    <input type="text" name="context">
                                    <input type="hidden" name="uid" value="${user.id}">
                                    <input type="hidden" name="aid" value="${article.id}">
                                    <button type="submit" class="btn btn-primary btn-sm">发表</button>
                                </form>
                            </div>
                        </div>
            </div>
        </div>
    </div>
</div>
</body>