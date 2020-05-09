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
                <div class="col-lg-3 col-xs-6">
                    <!-- Profile Image -->
                    <div class="small-box bg-aqua">
                        <img class="profile-user-img img-responsive img-circle user_pic"  src="/images/pic/${sessionScope.USER_SESSION.picture}" alt="User profile picture">
                        <h3 class="profile-username text-center">${sessionScope.USER_SESSION.name}</h3>
                    </div>
                        <!-- /.box-body -->
                </div>
            </div>
            <div class="row">
                <!-- 修改信息-->
                <div class="col-lg-3 col-xs-6">
                    <!-- About Me Box -->
                    <div class="small-box bg-aqua">
                        <div class="box-header with-border">
                            <h3 class="box-title">修改信息</h3>
                        </div>
                        <h5><i class="fa fa-phone margin-r-5"></i> 联系方式</h5>
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" name="phone" value="${sessionScope.USER_SESSION.phone}">
                        </div>
                        <button type="button" class="btn btn-primary btn-block btn-flat" id="updateInfo">修      改</button>
                        <!-- /.box-body -->
                    </div>
                    <div class="box">
                        <div class="box-header">
                            <h2>历史订单列表</h2>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>联系方式</th>
                                    <th>预约状态</th>
                                </tr>
                                </thead>
                                <tbody id="tableContent">

                                </tbody>
                            </table>

                            <nav aria-label="Page navigation" class="text-right">
                                <ul class="pull-right pagination" id="pages"></ul>
                            </nav>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
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

            Bootstrap_paging(1)
            function Bootstrap_paging(page) {
                var json = new Object();
                json.pageNumber = page;//页码
                json.pageSize = 10;//页面大小
                console.log(json)
                $.ajax({
                    type: "GET",
                    url: "<c:url value='/decorator/queryProcessesByDecoratorId1'/>",
                    dataType: "json",
                    data: json,
                    success: function (data) {
                        $("#tableContent").html("")
                        if (data.result.total == 0) {
                            $("#tableContent").html("<tr style='display:none;'><td colspan='9'></td></tr><tr><td colspan='9'><p class='text-center' style='color:#777;padding-top:20px;'>暂无数据</p></td></tr>")
                            return;
                        }

                        for (var i = 0; i < data.result.size; i++) {
                            var isAccept;
                            switch (data.result.data[i].isAccept) {
                                case("0"):
                                    isAccept = "<span class='label label-success' >已结束</span>";
                                    break;
                                case("1"):
                                    isAccept = "<span class='label label-success'>进行中</span>";
                                    break;
                            }

                            var node = "<tr>" +
                                "                    <td>" + ((page - 1) * 10 + i + 1) + "</td>" +
                                "                    <td>" + (data.result.data[i].name == null ? "无" : data.result.data[i].name) + "</td>" +
                                "                    <td>" + (data.result.data[i].phone == null ? "无" : data.result.data[i].phone) + "</td>" +
                                "                    <td>" + isAccept + "</td>" +
                                "                    <td>" ;
                            $("#tableContent").append(node);
                        }

                        $(".acceptClient").click(function () {
                            $("#acceptClientDialog").modal('show');
                            $("#acceptForm input[name='id']").val($(this).attr("clientId1"));
                        })
                        $(".finishClient").click(function () {
                            $("#finishClientDialog").modal('show');
                            $("#finishForm input[name='id']").val($(this).attr("clientId1"));
                        })
                        var options = {
                            bootstrapMajorVersion: 3,
                            currentPage: page, // 当前页数
                            numberOfPages: 5, // 显示按钮的数量
                            totalPages: Math.ceil(data.result.total / 10), //总页数
                            itemTexts: function (type, page, current) {
                                switch (type) {
                                    case "first":
                                        return "首页";
                                    case "prev":
                                        return "上一页";
                                    case "next":
                                        return "下一页";
                                    case "last":
                                        return "末页";
                                    case "page":
                                        return page;
                                }
                            },
                            // 点击事件，用于通过Ajax来刷新整个list列表
                            onPageClicked: function (event, originalEvent, type, page) {
                                Bootstrap_paging(page);
                            }
                        };
                        if (data.result.total > 0) {
                            $('#pages').bootstrapPaginator(options);//显示控件
                        } else {
                            $('#pages').hide();
                        }
                    }
                });
            }


            $("#updateInfo").click(function () {
                var phone=$("input[name='phone']").val();
                if(phone==null||phone==""){
                    alert("联系方式不能为空！");
                    return;
                }
                var json = new Object();
                json.phone = phone;
                console.log(json)
                $.ajax({
                    type: "post",
                    url: "<c:url value='/user/updateInfo'/>",
                    dataType: "json",
                    data: json,
                    success: function (data) {
                        if(data.status.code==1){
                            alert("修改成功！");
                            window.location.reload();
                        }else{
                            alert("修改失败!");
                        }
                    }
                })

            })
            $('.sidebar-menu').tree()
        })
    </script>
</body>
</html>
