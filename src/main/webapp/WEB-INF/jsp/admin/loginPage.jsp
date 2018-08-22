<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jhon
  Date: 2018/8/18
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/fore/style.css" rel="stylesheet">
<div class="formArticleArea">
    <div class="formArticleDiv">
        <div class="panel panel-default">
            <div class="panel-heading">管理员登陆</div>
            <div class="panel-body">
                <div class="formArea">
                    <form method="post" action="jhonLogin" class="registerForm">
                        <div class="registerErrorMessageDiv">
                            <span class="errorMessage"></span>
                        </div>

                        <table>
                            <tr>
                                <td>
                                    管理员
                                </td>
                                <td>
                                    <input id="name" name="name"  class="form-control" placeholder="用户名">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    密码
                                </td>
                                <td>
                                    <input id="password" name="password" class="form-control" type="password" placeholder="密码">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input id="publish" type="submit" class="btn btn-primary btn-lg " role="button" value="登陆">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
