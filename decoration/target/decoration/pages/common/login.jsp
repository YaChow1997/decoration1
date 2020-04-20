<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Internet+</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap.min.css"/>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/bower_components/font-awesome/css/font-awesome.min.css"/>">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<c:url value="/bower_components/Ionicons/css/ionicons.min.css"/>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<c:url value="/dist/css/AdminLTE.min.css"/>">
    <!-- iCheck -->
    <link rel="stylesheet" href="<c:url value="/plugins/iCheck/square/blue.css"/>">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#"><b></b></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录系统账号</p>
        <form>
            <div class="form-group has-feedback">
                <input type="name" class="form-control" id="name" placeholder="姓名">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="password" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <a href="register.jsp" class="text-center">注册新用户</a>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="button" id="login_button" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <!-- /.social-auth-links -->


    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="<c:url value="/bower_components/jquery/dist/jquery.min.js"/>"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<!-- iCheck -->
<script src="<c:url value="/plugins/iCheck/icheck.min.js"/>"></script>
<script>
    $(function () {

        $("#password").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $('#login_button').click();
            }
        });

        $("#login_button").click(function(){
            var name = $("#name").val();
            var password = $("#password").val();
            if (name == null || name== ""||password == null || password== "") {
                alert("用户名和密码不能为空！");
                return;
            }
            $.ajax({
                type: "POST",
                contentType:"application/x-www-form-urlencoded",
                url: "<c:url value='/user/login'/>",
                data: {"name":$("#name").val(),"password":$("#password").val()},
                dataType: "json",
                success: function(data){
                    if(data.result==true){
                        window.location.href = "<c:url value='/render/toIndex'/>";
                    }else {
                        alert("用户名或密码输入错误！");
                    }
                },
                error:function(){
                    console.log("发送失败")
                }
            });
        })

    });
</script>
</body>
</html>
