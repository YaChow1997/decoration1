<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>WebSocket 客户端</title>
</head>
<body>

</body>
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
        webSocket.onmessage = function(event){
            alert(event.data);
        }
    })
</script>
</html>
