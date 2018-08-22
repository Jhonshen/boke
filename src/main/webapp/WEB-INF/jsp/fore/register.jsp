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
<script>
    $(function () {
        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility", "visible");
        </c:if>
        $(".registerForm").submit(function () {
            if(0 == $("#name").val().length) {
                $("span.errorMessage").html("请输入用户名");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if(0 == $("#password").val().length) {
                $("span.errorMessage").html("请输入密码");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if(0 == $("#repeatpassword").val().length) {
                $("span.errorMessage").html("请输入重复密码");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            if($("#password").val() != $("#repeatpassword").val()) {
                $("span.errorMessage").html("重复密码不一致");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            return true;
        })
    })
</script>
<div class="formArticleArea">
    <div class="formArticleDiv">
        <div class="panel panel-default">
            <div class="panel-heading">注册</div>
            <div class="panel-body">
                <div class="formArea">
                    <form method="post" action="foreregister" class="registerForm">
                        <div class="registerErrorMessageDiv">
                            <span class="errorMessage"></span>
                        </div>

                        <table>
                            <tr>
                                <td>
                                    设置用户名
                                </td>
                                <td>
                                    <input id="name" name="name"  class="form-control" placeholder="用户名不可改">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    设置密码
                                </td>
                                <td>
                                    <input id="password" name="password" class="form-control" type="password" placeholder="设置密码">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    密码确认
                                </td>
                                <td>
                                    <input id="repeatpassword"type="password" class="form-control" placeholder="请再次输入密码">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input id="publish" type="submit" class="btn btn-primary btn-lg " role="button" value="提交">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
