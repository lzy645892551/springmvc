<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:useBean id="command" class="com.wanda.bean.User" scope="request"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加用户</title>
    <link href="Styles/css.css" rel="stylesheet" type="text/css" />
    <link href="Styles/ts_css.css" rel="stylesheet" type="text/css" />
    <script src="../Admin/Scripts/jquery.js" type="text/javascript"></script>
    <script src="../Admin/Scripts/jquery.hotkeys.js" type="text/javascript"></script>
    <script src="../Admin/Scripts/jstree/jquery.jstree.js" type="text/javascript"></script>
    <script src="../Admin/Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../Admin/My97DatePicker/WdatePicker.js"></script> 


</head>



<br><br>
<body style="overflow-x: hidden; background: #EFF3FF;">
    <form method="post" action="addUser.do" id="form1">
    	<table align="center">
    	
    		<tr>
    			<td>登录账户:<input type="text" id="userId" name="userId" placeholder="请输入用户名"/></td>
    		</tr>
    		<tr>
    			<td>账户密码:<input type="password" id="password" name="password"/></td>
    		</tr>
    		<!-- <tr>
    			<td>组织编号:<input type="text" id="organizationId" name="organizationId"/></td>
    		</tr> -->
    		<tr>	
    			<td>角色编号:
    				<select id="rolId" name="rolId">
    					<option value="1">管理员</option>
    					<option value="2">总经理</option>
    					<option value="3" selected="selected">业务员</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>姓 &nbsp; &nbsp; &nbsp; 名:<input type="text" id="name" name="name" placeholder="请输入姓名"/></td>
    		</tr>
    		<tr>	
    			<td>联系方式:<input type="text" id="tel" name="tel"/></td>
    		</tr>
    		<tr>
    			<td>图片路径:<input type="text" id="picture" name="picture"/></td>
    		</tr>
    		<!-- <tr>
    			<td>登录时间:<input type="text" id="userTime" name="userTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
    		</tr>
    		<tr>
    			<td>修&nbsp; 改&nbsp; 人:<input type="text" id="updateUser" name="updateUser" value="无"/></td>
    		</tr>
    		<tr>
    			<td>修改时间:<input type="text" id="updateTime" name="updateTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
    		</tr>
    		<tr>
    			<td>删&nbsp; 除&nbsp; 人:<input type="text" id="deleteUser" name="deleteUser" value="无"/></td>
    		</tr>
    		<tr>
    			<td>删除时间:<input type="text" id="deleteTime" name="deleteTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
    		</tr>
    		<tr>
    			<td>删除状态:<input type="text" id="deleteState" name="deleteState" value="未删除"/></td>
    		</tr> -->
    		<tr>
    			<td>业务员编号:<input type="text" id="number" name="number"/>
    			<input type="hidden" id="deleteState" name="deleteState" value="未删除"/>
    			</td>
    		</tr>
    		<tr>
                 <td align="right">
                        <input type="submit" id="btnAdd" class="button" value="提交" />
                 </td>
    		</tr>
    	</table>
    </form>
    
</body>
  <script>
  	 //ajax 重点  
  	 //async(可选) 参数  表示 ajax请求同步还是异步  默认为true 表示 异步  可修改为false 表示同步
  	 //常用的 ajax 参数 url data(传递的数据) dataType(返回值数据类型 json text) type(传递数据的请求方式 get or post)
  	 //回调函数  success  error    
  	 //json 返回值(响应 必须  键和值都是字符串)
  	 // List["list":{"uid":"1","uname":"zhangsan"}]
  	 $("#btnAdd").click(function(){
  		 var userId = $("#userId").val();
  		 //var password = $("#inp2").val();
  		 //参数 url  data(json格式) {键:值,键:值}  callback
  		 var abc = "123";
  		 $.ajax({
  			 url:"../addUserCkeck.do",
  			 data:{"userId":userId},
  			 dataType:"json",
  			 type:"post",
  			 async:false, //很重要
  			 success:function(data){
  				 //alert(data);
  				 for(var a in data){
  					alert(a + ":"+data[a]);
  				 }
  			 },
  			 error:function(data){
  				 alert('出错了');
  			 }
  		 });
  	 });
  	 
  </script>

</html>
