<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>详情</title>
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

    <jsp:include page="../navbar.jsp"/>-

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- /.content -->
        <!-- /.content-wrapper -->

        <section class="content">
            <!-- Main row -->
            <div class="row">
                    <div class="col-md-9">
                        <!-- Default box -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title"  >${data.title}</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                        <i class="fa fa-minus"></i></button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                        <i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body" style="display: block;">
                                    <img src="/images/pic${data.pic}" >
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <p class="text-muted well well-sm no-shadow">
                                    <span class="pull-left">OID:${data.oid}</span>
                                    <a href="${data.url}">查看更多</a>
                                    <span class="pull-right">更新时间：${data.updated}</span>
                                </p>
                            </div>
                            <%--评分--%>
                            <input id="input-id" type="number" class="rating" min=0 max=5 step=1 data-size="lg" >
                            <button type="button" class="btn btn-primary" id="confirmRate">提交评价</button>
                            <a type="button" class='btn btn-info btn-sm returnButton' href="<c:url value="/render/toIndex"/>">返回首页</a>
                        </div>
                    </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <span>为您推荐：</span>
                            <h3 class="box-title"  >${data1.title}</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body" style="display: block;">
                            <img src="/images/pic${data1.pic}" >
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <p class="text-muted well well-sm no-shadow">
                                <span class="pull-left">OID:${data1.oid}</span>
                                <a href="${data1.url}">查看更多</a>
                                <span class="pull-right">更新时间：${data1.updated}</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <span>为您推荐：</span>
                            <h3 class="box-title"  >${data2.title}</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body" style="display: block;">
                            <img src="/images/pic${data2.pic}" >
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <p class="text-muted well well-sm no-shadow">
                                <span class="pull-left">OID:${data2.oid}</span>
                                <a href="${data2.url}">查看更多</a>
                                <span class="pull-right">更新时间：${data2.updated}</span>
                            </p>
                        </div>
                    </div>
                </div><div class="col-md-3">
                <!-- Default box -->
                <div class="box">
                    <div class="box-header with-border">
                        <span>为您推荐：</span>
                        <h3 class="box-title"  >${data3.title}</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body" style="display: block;">
                        <img src="/images/pic${data3.pic}" >
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <p class="text-muted well well-sm no-shadow">
                            <span class="pull-left">OID:${data3.oid}</span>
                            <a href="${data3.url}">查看更多</a>
                            <span class="pull-right">更新时间：${data3.updated}</span>
                        </p>
                    </div>
                </div>
            </div>
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
        // 默认
        $("#input-id").rating();
        // 带参数
        $("#input-id").rating({'size':'lg'});
        })
        $("#confirmRate").click(function () {
            var score=$("#input-id").val();
            var exampleId=${data.id};
            if(score==""||score==null){
                alert("还没有评价！");
                return;
            }

            $.ajax({
                type: "POST",
                contentType:"application/x-www-form-urlencoded",
                url: "<c:url value='/common/rate'/>",
                data: {"score":score,"exampleId":exampleId},
                dataType: "json",
                success: function(data){
                    if(data.status.code==1){
                        alert("评价成功！");
                    }else{
                        alert(data.status.message);
                    }
                },
                error:function(){
                    console.log("发送失败")
                }
            });

        })
        </script>
</body>
</html>

