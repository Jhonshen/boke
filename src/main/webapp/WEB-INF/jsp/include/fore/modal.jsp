<%--
  Created by IntelliJ IDEA.
  User: Jhon
  Date: 2018/8/18
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<script>
    $(function () {
        $("button.loginSubmitButton").click(function () {
            var name = encodeURI($("#name").val(), "UTF-8");
            var password = $("#password").val();
            if(0 == name.length || 0 == password.length) {
                $("span.errorMessage").html("请输入账号密码");
                $("div.registerErrorMessageDiv").css("visibility", "visible");
                return false;
            }
            var page = "foreloginAjax";
            $.get(
                page,
                {"name":name,"password":password},
                function(result){
                    if("success" == result) {
                        location.reload();
                    }
                    else {
                        $("span.errorMessage").html("账号密码错误");
                        $("div.registerErrorMessageDiv").css("visibility", "visible");
                    }
                }
            );
            return true;
        })
    })
</script>
<div class="modal" id="myModal" tabindex="-1" role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">登陆</h4>
            </div>
            <div class="registerErrorMessageDiv">
                <span class="errorMessage"></span>
            </div>
            <div class="modal-body">
                <span>用户名</span>
                <input id="name" name="name" type="text">
            </div>
            <div class="modal-body">
                <span>密码</span>
                <input id="password" name="password" type="password" type="text">
            </div>
            <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                    <button class="btn btn-primary loginSubmitButton" type="submit">登陆</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
