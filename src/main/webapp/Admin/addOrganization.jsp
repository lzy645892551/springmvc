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
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jquery.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jquery.hotkeys.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jstree/jquery.jstree.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/Admin/My97DatePicker/WdatePicker.js"></script> 


</head>



<br><br>
<body style="overflow-x: hidden; background: #EFF3FF;">
    <form method="post" action="addOrganization.do" id="form1">
    	<table align="center">
    	
    		<tr>
    			<td>组织名称:<input type="text" id="organizationName" name="organizationName" placeholder="请输入名称"/></td>
    		</tr>
    		<tr>
    			<td>组织地址:<input type="password" id="organizationAddress" name="organizationAddress"/></td>
    		</tr>
    		<tr>
    			<td>组织电话:<input type="text" id="organizationTel" name="organizationTel"/>
    			<input type="hidden" id="deleteState" name="deleteState" value="未删除"/>
    			</td>
    		</tr>
    		<!-- <tr>
    			<td>修&nbsp; 改&nbsp; 人:<input type="text" id="updateUser" name="updateUser"/></td>
    		</tr>
    		<tr>
    			<td>修改时间:<input type="text" id="updateTime" name="updateTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/></td>
    		</tr>
    		<tr>
    			<td>删&nbsp; 除&nbsp; 人:<input type="text" id="deleteUser" name="deleteUser"/></td>
    		</tr>
    		<tr>
    			<td>删除时间:<input type="text" id="deleteTime" name="deleteTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/></td>
    		</tr>
    		<tr>
    			<td>删除状态:<input type="text" id="deleteState" name="deleteState" value="无"/></td>
    		</tr> -->
    		<tr>
                 <td align="right">
                        <input type="submit" id="btnAdd" class="button" value="提交" />
                 </td>
    		</tr>
    	</table>
    </form>
    
</body>
</html>
