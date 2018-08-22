<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
</script>

<title>评论管理</title>

<div class="workingArea">
    <h1 class="label label-info" >评论管理</h1>

    <br>
    <br>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th >ID</th>
                <th>评论</th>
                <th>用户名称</th>
                <th>文章标题</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${comments}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td ><c:if test="${c.context.length() > 10}">${c.context.substring(0, 10)}</c:if>
                        <c:if test="${!(c.context.length() > 10)}">${c.context}</c:if></td>
                    <td>${c.user.name}</td>
                    <td>${c.article.title}</td>
                    <td><a href="admin_comment_delete?id=${c.id}">删除</a></td>
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
