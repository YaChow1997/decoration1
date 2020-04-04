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
                    <h3 class="box-title">添加客户</h3>

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
                        <form>
                            <div class="form-group col-md-6">
                                <label>客户姓名</label>
                                <select class="form-control select2" style="width: 100%;" name="userId">
                                    <option selected="selected" value="">请选择已有用户名</option>
                                    <c:forEach var="user" items="${users}">
                                        <option value="${user.id}">${user.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <!-- /.form-group -->
                            <div class="form-group col-md-6">
                                <label>地址</label>
                                <input type="text" class="form-control" name="address" placeholder="请输入地址">
                            </div>
                            <div class="form-group col-md-6">
                                <label>手机号</label>
                                <input type="text" class="form-control" name="phone" placeholder="请输入手机号">
                            </div>
                            <div class="form-group col-md-6">
                                <label>状态</label>
                                <select class="form-control" name="status">
                                    <option selected="selected" value="">买房状态</option>
                                    <option value="0">还没买房</option>
                                    <option value="1">已买房未拿到钥匙</option>
                                    <option value="2">装备装修</option>
                                    <option value="3">已订装修公司</option>
                                    <option value="4">已经装修</option>
                                </select>
                            </div>

                        </form>
                        <!-- /.form-group -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" id="addClient" class="btn btn-primary pull-right">添加客户</button>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <div class="row">
                                <form class="form-horizontal" id="condition">
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" placeholder="用户名" name="name">
                                    </div>

                                    <div class="col-sm-2">
                                        <select class="form-control" name="status">
                                            <option value="">买房状态</option>
                                            <option value="0">还没买房</option>
                                            <option value="1">已买房未拿到钥匙</option>
                                            <option value="2">装备装修</option>
                                            <option value="3">已订装修公司</option>
                                            <option value="4">已经装修</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-2">
                                        <button type="button" class="btn btn-block btn-primary" id="queryClient">查询
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>联系方式</th>
                                    <th>地址</th>
                                    <th>买房状态</th>
                                    <th>操作</th>
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
                    <!-- /.box -->
                </div>
                <!-- /.col -->
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

    <%--删除账户--%>
    <div class="modal fade modal-danger" id="deleteClientDialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">删除账户</h4>
                </div>
                <div class="modal-body">
                    <p>确认删除账户？</p>
                    <form id="deleteForm">
                        <input type="hidden" name="id"/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-outline" id="confirmDeleteBtn">确认删除</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
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

            //Initialize Select2 Elements
            $('.select2').select2()
            //选择用户事件
            $("select[name='userId']").change(function () {
                var userId=$(this).val();
                $.ajax({
                    type: "get",
                    url: "<c:url value='/user/queryByUserId'/>" ,
                    contentType:"application/x-www-form-urlencoded",
                    data: {"id":userId},
                    dataType: "json",
                    success: function (data) {
                        $("input[name='name']").val(data.result.name);
                        $("input[name='address']").val(data.result.address);
                        $("input[name='phone']").val(data.result.phone);
                        $("input[name='status']").val(data.result.status);
                    }
                });
            })

            $("#addClient").click(function(){
                var userId=$("select[name='userId']").val();
                var address=$("input[name='address']").val();
                var phone=$("input[name='phone']").val();
                var status=$("select[name='status']").val();
                if (userId==null||userId=="") {
                    alert("请选择用户");
                    return;
                }
                $.ajax({
                    type: "post",
                    url: "<c:url value='/client/addClient'/>" ,
                    contentType:"application/x-www-form-urlencoded",
                    data: {"userId":userId,"address":address,"phone":phone,"status":status},
                    dataType: "json",
                    success: function (data) {
                        if(data.status.code==1){
                            alert("添加成功");
                            window.location.reload();
                        }else{
                            alert(data.status.message);
                        }
                    },
                    error:function(){
                        alert("发送失败");
                    }
                });
            })

            $('.sidebar-menu').tree()
            //时间范围控件显示

            $("#queryClient").click(function(){
                Bootstrap_paging(1)
            })

            Bootstrap_paging(1)
            function Bootstrap_paging(page) {
                var name = $("#condition input[name='name']").val();
                var status = $("#condition  select[name='status']").val();

                var json = new Object();
                if (name != "") {
                    json.name = name;
                }

                if (status != "") {
                    json.status = status;
                }

                json.pageNumber = page;//页码
                json.pageSize = 10;//页面大小
                console.log(json)
                $.ajax({
                    type: "GET",
                    url: "<c:url value='/client/queryClients'/>",
                    dataType: "json",
                    data: json,
                    success: function (data) {
                        $("#tableContent").html("")
                        if (data.result.total == 0) {
                            $("#tableContent").html("<tr style='display:none;'><td colspan='9'></td></tr><tr><td colspan='9'><p class='text-center' style='color:#777;padding-top:20px;'>暂无数据</p></td></tr>")
                            return;
                        }

                        for (var i = 0; i < data.result.size; i++) {
                            var clientStatus;
                            switch (data.result.data[i].status) {
                                case("0"):
                                    clientStatus = "<span class='label label-success' >还没买房</span>";
                                    break;
                                case("1"):
                                    clientStatus = "<span class='label label-success'>已买房未拿到钥匙</span>";
                                    break;
                                case("2"):
                                    clientStatus = "<span class='label label-success'>准备装修</span>";
                                    break;
                                case("3"):
                                    clientStatus = "<span class='label label-success'>已订装修公司</span>";
                                    break;
                                case("4"):
                                    clientStatus = "<span class='label label-success'>已经装修</span>";
                                    break;
                            }
                            var node = "<tr>" +
                                "                    <td>" + ((page - 1) * 10 + i + 1) + "</td>" +
                                "                    <td>" + (data.result.data[i].name == null ? "无" : data.result.data[i].name) + "</td>" +
                                "                    <td>" + (data.result.data[i].phone == null ? "无" : data.result.data[i].phone) + "</td>" +
                                "                    <td>" + (data.result.data[i].address == null ? "无" : data.result.data[i].address) + "</td>" +
                                "                    <td>" + clientStatus + "</td>" +
                                "                    <td>" ;
                            node+="<button type='button' clientId=" + data.result.data[i].id + " class='btn btn-danger deleteClient'>删除</button></td>";
                            $("#tableContent").append(node);
                        }

                        $(".deleteClient").click(function () {
                            $("#deleteClientDialog").modal('show');
                            $("#deleteForm input[name='id']").val($(this).attr("clientId"));
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

            /*确认删除*/
            $("#confirmDeleteBtn").click(function(){
                var id=$("#deleteForm input[name='id']").val();
                var json={id:id,isDelete:"1"};
                $.ajax({
                    type: "post",
                    url: "<c:url value='/client/updateClient'/>",
                    dataType: "json",
                    data: json,
                    success: function (data) {
                        if(data.status.code==1){
                            alert("删除成功");
                            Bootstrap_paging(1)
                        }else{
                            alert(data.status.message);
                        }
                        $("#deleteClietnDialog").modal('hide');
                    }
                })
            })
        })
    </script>
</body>
</html>

