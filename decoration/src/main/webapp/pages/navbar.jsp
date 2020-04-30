<%--
  Created by IntelliJ IDEA.
  User: Yangchow
  Date: 2020-03-11
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="main-header">
    <!-- Logo -->
    <a href="<c:url value="/render/toIndex"/>" class="logo">
        <!-- logo for regular state and mobile devices -->
        <span class="logo-mini"><b>+</b></span>
        <span class="logo-lg"><b>个性化装修</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="/images/pic/${sessionScope.USER_SESSION.picture}" class="user-image user_pic" alt="User Image">
                        <span class="hidden-xs">${sessionScope.USER_SESSION.name}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-footer">
                            <div class="pull-right">
                                <a href="<c:url value="/user/outLogin"/>" class="btn btn-default btn-flat">退出登录</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <%--<!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>--%>
            </ul>
        </div>
    </nav>
</header>
<div  style="z-index: 20;position: fixed;bottom:0px;right:10px;display: none;width:300px;" id="tip">
    <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" id="closeAlert">×</button>
        <label>推送</label>
        标题：<input type="text" class="form-control" name="title1">
        内容：<input type="text" class="form-control" name="content1">
    </div>
</div>
<script src="<c:url value="/bower_components/jquery/dist/jquery.min.js"/>"></script>
<script type="application/javascript">
    $(function(){
        var webSocket = new WebSocket("ws://localhost:8080/decoration/webSocketServer");
        webSocket.onopen = function(event){
            console.log("连接成功");
            console.log(event);
        };
        webSocket.onerror = function(event){
            console.log("连接失败");
            console.log(event);
        };
        webSocket.onclose = function(event){
            console.log("Socket连接断开");
            console.log(event);
        };
        var timer;
        webSocket.onmessage = function(event){
            var parse = JSON.parse(event.data);
            if(parse.type=='pushdata'){
                $("[name=title1]").val(parse.data.title);
                $("[name=content1]").val(parse.data.content);
            }
            if(parse.type='reservedata'){
                $("[name=title1]").val("您有一个预约请求！");
                $("[name=content1]").val(parse.data+"发起预约请求，请到预约列表接受该用户请求");
            }
            if(parse.type='acceptdata'){
                $("[name=title1]").val("预约成功消息：");
                $("[name=content1]").val(parse.data+"接受了您的预约！");
            }
            $("#tip").show('slow');
            clearInterval(timer);
            timer=setInterval(function(){
                $("#tip").hide('slow');
            },10000);
        }
        $("#closeAlert").click(function(){
            $("#tip").hide('slow');
        })
    })
</script>