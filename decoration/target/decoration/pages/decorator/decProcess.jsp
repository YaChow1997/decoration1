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
        <form name="Form2" action="/decoration/common/upload" method="post"  enctype="multipart/form-data">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <!-- The time line -->
                    <ul class="timeline">


            <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-green">
                   装修准备阶段
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
                <i class="fa fa-camera bg-purple"></i>

                <div class="timeline-item">
                    file 1 : <input type="file" name="imgs"><br />
                    <div class="timeline-body">
                        <img src="${urlList.get(0)}" class="margin">
                    </div>
                </div>
            </li>

                        <!-- timeline time label -->
                        <li class="time-label">
                  <span class="bg-green">
                    硬装（基础施工）阶段
                  </span>
                        </li>
                        <!-- /.timeline-label -->
                        <!-- timeline item -->
                        <li>
                            <i class="fa fa-camera bg-purple"></i>

                            <div class="timeline-item">
                                file 2 : <input type="file" name="imgs"><br />

                                <div class="timeline-body">
                                    <img src="${urlList.get(1)}" class="margin">
                                </div>
                            </div>
                        </li>


                        <!-- timeline time label -->
                        <li class="time-label">
                  <span class="bg-green">
                   主材安装阶段
                  </span>
                        </li>
                        <!-- /.timeline-label -->
                        <!-- timeline item -->
                        <li>
                            <i class="fa fa-camera bg-purple"></i>

                            <div class="timeline-item">
                                file 3 : <input type="file" name="imgs"><br />
                                <div class="timeline-body">
                                    <img src="${urlList.get(2)}" class="margin">
                                </div>
                            </div>
                        </li>


                        <!-- timeline time label -->
                        <li class="time-label">
                  <span class="bg-green">
                    软装阶段
                  </span>
                        </li>
                        <!-- /.timeline-label -->
                        <!-- timeline item -->
                        <li>
                            <i class="fa fa-camera bg-purple"></i>

                            <div class="timeline-item">
                                file 4 : <input type="file" name="imgs"><br />
                                <div class="timeline-body">
                                    <img src="${urlList.get(3)}" class="margin">
                                </div>
                            </div>
                        </li>

                            <input type="submit"  name="提交">

                    </ul>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

        </section>
        </form>
    </div>


        <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
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
