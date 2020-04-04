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
            <div class="row">
                <c:forEach var="decorators" items="${decoratorsList}" varStatus="status">
                    <div class="col-md-8">
                        <!-- Default box -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title"  >${decorators.name}</h3>
                                <h4>${decorators.phone}</h4>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                        <i class="fa fa-minus"></i></button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                        <i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body" style="display: block;">
                                <a href="<c:url value="/render/todetail2" />?id=${status.index + 295}">
                                    <img src="/images/pic/${decorators.icon}" >
                                </a>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <p class="text-muted well well-sm no-shadow">
                                    <span class="pull-right">预约状态：${decorators.status==0?"未预约":"已预约"}</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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

            $('.sidebar-menu').tree()
        })
    </script>
</body>
</html>
