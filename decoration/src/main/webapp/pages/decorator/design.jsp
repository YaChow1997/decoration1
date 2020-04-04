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
            <div class="box box-warning">
                <div class="box-header with-border">
                    <h3 class="box-title">装修方案设计</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form role="form">
                        <!-- text input -->
                        <!-- select -->
                        客户id:<span id="clientId">${clientId}</span>
                        我的id:<span id="decoratorId">${sessionScope.USER_SESSION.id}</span>
                        <div class="form-group">
                            <label>装修风格</label>
                            <select class="form-control" name="style">
                                <option selected="selected" value="">选择风格</option>
                                <option>现代简约</option>
                                <option>中式现代</option>
                                <option>北欧极简</option>
                                <option>日式</option>
                                <option>潮流混搭</option>
                                <option>地中海</option>
                                <option>美式田园</option>
                                <option>美式经典</option>
                                <option>欧式豪华</option>
                                <option>其他</option>
                            </select>
                        </div>
                        <label>房屋面积</label>
                        <div class="form-group" >
                            <input type="text" name="square" class="col-xs-2" placeholder="请输入面积">平方米
                        </div>
                        <div class="form-group">
                            <label>户型</label>
                            <select class="form-control" name="house">
                                <option selected="selected" value="">选择户型</option>
                                <option>平层户型</option>
                                <option>跃层户型</option>
                                <option>错层户型</option>
                                <option>复式户型</option>
                            </select>
                        </div>
                        <label>施工费和辅料</label>
                        <div class="form-group">
                            <input type="text" class="col-xs-3" name="constructionCost" placeholder="请输入费用">元
                        </div>
                        <label>主材费用</label>
                        <div class="form-group">
                            <input type="text" class="col-xs-3" name="mainMaterial" placeholder="请输入费用">元
                        </div>
                        <label>家具家电费用</label>
                        <div class="form-group">
                            <input type="text" class="col-xs-3" name="furniture" placeholder="请输入费用">元
                        </div>
                        <label>软装费用</label>
                        <div class="form-group">
                            <input type="text" class="col-xs-3" name="softOutfit" placeholder="请输入费用">元
                        </div>
                        <div class="box-footer">
                            <button type="submit" id="addDesign" class="btn btn-info pull-right">提交装修方案</button>
                        </div>
                    </form>

                </div>
                <div class="box-footer">
                    <form name="Form1" action="/decoration/common/upload1?id=${clientId}" method="post"  enctype="multipart/form-data">
                    装修图纸 : <input type="file" name="img"><br />
                    <input type="hidden" id="clientId1" name="clientId1" value="${clientId}">
                    <input type="submit"  name="上传">
                </form>
                </div>
                <!-- /.box-body -->
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
            $("#addDesign").click(function(){
                var decoratorId=${sessionScope.USER_SESSION.id};
                var clientId=${clientId};
                var style=$("select[name='style']").val();
                var square=$("input[name='square']").val();
                var house=$("select[name='house']").val();
                var constructionCost=$("input[name='constructionCost']").val();
                var mainMaterial=$("input[name='mainMaterial']").val();
                var furniture=$("input[name='furniture']").val();
                var softOutfit=$("input[name='softOutfit']").val();
                if (clientId==null){
                    alert("客户不存在或未接单！");
                    return;
                }
                $.ajax({
                    type: "post",
                    url: "<c:url value='/decorator/addDesign'/>" ,
                    contentType:"application/x-www-form-urlencoded",
                    data: {"decoratorId":decoratorId,"clientId":clientId,"style":style,"square":square,"house":house,"constructionCost":constructionCost,"mainMaterial":mainMaterial,"furniture":furniture,"softOutfit":softOutfit},
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
        })
    </script>
</body>
</html>

