<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'unitadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="unitmanage/add.do">
    	<div>
    		<label>所属项目</label>
    		<%-- <select>
    		
    			<c:forEach var="">
    				<option></option>
    			</c:forEach>
    			
    		</select> --%>
    		<input type="text" style="width:350px;" value="${map.pro }">
    	</div>
    	<div>
    		<label>所属楼栋</label>
    		<select>
    			<option></option>
    		</select>
    	</div>
    	<div>
    		<label>单元号</label>
    		<select>
    			<option> </option>
    		</select>
    	</div>
    	<div>
    		<label>单元房间数</label>
    		<select>
    			<option value="1">----1----</option>
    			<option value="2">----2----</option>
    			<option value="3">----3----</option>
    			<option value="4">----4----</option>
    		</select>
    	</div>
    	
    	
    	
    </form>
    
    
  </body>
</html>















