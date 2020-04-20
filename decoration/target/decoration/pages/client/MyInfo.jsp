<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主页</title>
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
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<c:url value="/dist/css/skins/_all-skins.min.css"/>">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style>
        .jumbotron {
            border-top: 800px;
            background: #ffffff;

        }
    </style>
    <style type="text/css">
        .box{
            width: 400px;
            height: 600px;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <jsp:include page="../navbar.jsp"/>

    <!-- =============================================== -->
    <jsp:include page="../aside.jsp"/>

    <!-- =============================================== -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- /.content -->
        <!-- /.content-wrapper -->

        <section class="content">
            <!-- Main row -->
            <div class="col-md-6 col-md-offset-3">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">个人信息</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="userName" value="${user.name}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="balance" value="${user.phone}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="新密码">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="确认密码">
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <div class="row">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button type="button" class="form-control btn btn-primary" id="confirmUpdate">修改支付密码</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box -->
            </div>

        </section>

    </div>
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.4.13
        </div>
        <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
        reserved.
    </footer>
    <!-- ./wrapper -->
    <!-- jQuery 3 -->
    <script src="<c:url value="/bower_components/jquery/dist/jquery.min.js"/>"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
    <!-- SlimScroll -->
    <script src="<c:url value="/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"/> "></script>
    <!-- FastClick -->
    <script src="<c:url value="/bower_components/fastclick/lib/fastclick.js"/>"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value="/dist/js/adminlte.min.js"/>"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value="/dist/js/demo.js"/>"></script>
    <script>
        $(document).ready(function () {
            $("#confirmUpdate").click(function () {
                var accountNumber=$("#accountNumber").val();
                var password=$("#newPassword").val();
                var confirmPassword=$("#confirmPassword").val();
                if(password==""||password==null){
                    alert("新密码不能为空！");
                    return;
                }
                if(/^[0-9]{6}$/.test(password)!=1){
                    alert("新密码格式有误！");
                    return;
                }
                if(confirmPassword==""||confirmPassword==null){
                    alert("确认密码不能为空！");
                    return;
                }
                if(confirmPassword!=password){
                    alert("两次输入的密码不一致");
                    return;
                }
                $.ajax({
                    type: "POST",
                    contentType:"application/x-www-form-urlencoded",
                    url: "<c:url value='/account/changePassword'/>",
                    data: {"password":password,"accountNumber":accountNumber},
                    dataType: "json",
                    success: function(data){
                        if(data.status.code==1){
                            alert("支付密码修改成功！");
                            $('#password').attr('value', password);
                            $('#newPassword').val("");
                            $('#confirmPassword').val("");
                        }else{
                            alert("密码修改失败!");
                        }
                    },
                    error:function(){
                        console.log("发送失败")
                    }
                });

            })
            $('.sidebar-menu').tree()
        })
    </script>
</body>
</html>

