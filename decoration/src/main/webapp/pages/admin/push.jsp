<%--
  Created by IntelliJ IDEA.
  User: Yangchow
  Date: 2020-03-11
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理客户</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap.min.css"/>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/bower_components/font-awesome/css/font-awesome.min.css"/>">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<c:url value="/bower_components/Ionicons/css/ionicons.min.css"/>">
    <!-- daterange picker -->
    <link rel="stylesheet" href="<c:url value="/bower_components/bootstrap-daterangepicker/daterangepicker.css"/>">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet"
          href="<c:url value="/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="<c:url value="/plugins/iCheck/all.css"/>">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet"
          href="<c:url value="/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css"/>">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="<c:url value="/plugins/timepicker/bootstrap-timepicker.min.css"/>">
    <!-- Select2 -->
    <link rel="stylesheet" href="<c:url value="/bower_components/select2/dist/css/select2.min.css"/> ">
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

        <!-- Main content -->
        <section class="content">

            <div class="box box-default">
                <div class="box-header with-border">
                    <h3 class="box-title">推送</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                            <div class="form-group col-md-6">
                                <label>推送标题</label>
                                <input type="text" class="form-control" name="title" placeholder="标题">
                            </div>
                        <!-- /.form-group -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>消息内容</label>
                            <textarea class="form-control" name="content" placeholder="内容"></textarea>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" id="push" class="btn btn-primary pull-right">推送</button>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.4.13
        </div>
        <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
        reserved.
    </footer>

    <!-- ./wrapper -->
    <script src="<c:url value="/bower_components/jquery/dist/jquery.min.js"/> "></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
    <!-- Select2 -->
    <script src="<c:url value="/bower_components/select2/dist/js/select2.full.min.js"/>"></script>
    <!-- InputMask -->
    <script src="<c:url value="/plugins/input-mask/jquery.inputmask.js"/>"></script>
    <script src="<c:url value="/plugins/input-mask/jquery.inputmask.date.extensions.js"/>"></script>
    <script src="<c:url value="/plugins/input-mask/jquery.inputmask.extensions.js"/>"></script>
    <!-- date-range-picker -->
    <script src="<c:url value="/bower_components/moment/min/moment.min.js"/>"></script>
    <script src="<c:url value="/bower_components/bootstrap-daterangepicker/daterangepicker.js"/>"></script>
    <!-- bootstrap datepicker -->
    <script src="<c:url value="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>"></script>
    <!-- bootstrap color picker -->
    <script src="<c:url value="/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"/>"></script>
    <!-- bootstrap time picker -->
    <script src="<c:url value="/plugins/timepicker/bootstrap-timepicker.min.js"/>"></script>
    <!-- SlimScroll -->
    <script src="<c:url value="/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"/>"></script>
    <!-- iCheck 1.0.1 -->
    <script src="<c:url value="/plugins/iCheck/icheck.min.js"/>"></script>
    <!-- FastClick -->
    <script src="<c:url value="/bower_components/fastclick/lib/fastclick.js"/>"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value="/dist/js/adminlte.min.js"/>"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value="/dist/js/demo.js"/>"></script>
    <script type="text/javascript" src="<c:url value='/dist/js/bootstrap-paginator.js'/>"></script>
    <script>
        $(document).ready(function () {
            $("#push").click(function(){
                var title=$("input[name='title']").val();
                var content=$("textarea[name='content']").val();
                $.ajax({
                    type:"post",
                    url:"<c:url value="/push"/>",
                    contentType:"application/x-www-form-urlencoded",
                    data:{"title":title,"content":content},
                    dataType:"json",
                    success: function (data) {
                        if(data.status.code==1){
                            alert("推送成功");
                        }else{
                            alert(data.status.message);
                        }
                    },
                    error:function(){
                        alert("推送失败");
                    }
                })
            })
        })
    </script>
</body>
</html>

