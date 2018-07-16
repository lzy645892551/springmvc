<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/Admin/Styles/css.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var winHeight = $(window).height();
            $(".welcome").css("height", winHeight);
        });
     
    </script>
</head>
<body style="background: #fff;">
    <div class="welcome">
        <div class="welcomeFont">
            您好，欢迎进入“万达房产管理”！</div>
    </div>
</body>
</html>
