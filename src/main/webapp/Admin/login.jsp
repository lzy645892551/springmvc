<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="nofollow"/>
<link href="../Admin/css/adminStyle.css" rel="stylesheet" type="text/css" />
<style>
body{width:100%;height:100%;overflow:hidden;background:url(../Admin/images/pc_loginBg.jpg) no-repeat;background-size:cover;position:absolute;}
</style>
<script src="../Admin/js/jquery.js"></script>
<script src="../Admin/js/Particleground.js"></script>
<script>
$(document).ready(function() {
  $('body').particleground({
    dotColor:'green',
    lineColor:'#c9ec6e'
  });
  $('.intro').css({
    'margin-top': -($('.intro').height() /2)
  });
  $(".loginform input[type='button']").click(function(){
	    $("form").submit();
	  });
});
</script>

</head>
<body>
  <form class="loginform" action="../login.do" method="post" id="form">
   <h1>万达楼盘管理系统</h1>
   <ul>
    <li>
     <label>账号：</label>
     <input type="text" class="textBox" placeholder="管理员账号" id = "userId" name = "userId"/>
    </li>
    <li>
     <label>密码：</label> 
     <input type="password" class="textBox" placeholder="登陆密码" id = "password" name = "password" />
    </li>
    <li>
     <input type="button" value="立即登陆"/>
    </li>
   </ul>
  </form>
</body>
</html>