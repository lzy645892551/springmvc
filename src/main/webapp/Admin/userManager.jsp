<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>
    <link href="${pageContext.request.contextPath}/Admin/Styles/css.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/Admin/Styles/ts_css.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jquery.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jquery.hotkeys.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jstree/jquery.jstree.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/Admin/Scripts/jquery.cookie.js" type="text/javascript"></script>
    
</head>


	<br>
		  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		  <a href="toAddUser.do"><input type="button" id="btnAdd" class="button" value="添加" /></a>
	<br><br>

<body style="overflow-x: hidden; background: #EFF3FF;">

    	<table align="center" border="1">
    		<tr>
    			<th>登录账户</th>
    			<th>账户密码</th>
    			<th>组织编号</th>
    			<th>角色编号</th>
    			<th>姓名</th>
    			<th>联系方式</th>
    			<th>图片路径</th>
    			<th>登录时间</th>
    			<th>修改人</th>
    			<th>修改时间</th>
    			<th>删除人</th>
    			<th>删除时间</th>
    			<th>删除状态</th>
    			<th>业务员编号</th>
    			<th colspan="2">操作</th>
    		</tr>
    		
    		<c:forEach var="userList" items="${listUser }">
    			<tr>
    				<td>${userList.userId }</td>
    				<td>${userList.password }</td>
    				<td>${userList.organizationId }</td>
    				<td>${userList.rolId }</td>
    				<td>${userList.name }</td>
    				<td>${userList.tel }</td>
    				<td>${userList.picture }</td>
    				<td><fmt:formatDate value="${userList.userTime }" pattern="yyyy-MM-dd  HH:mm:ss" type="both"/></td>
    				<td>${userList.updateUser }</td>
    				<td><fmt:formatDate value="${userList.updateTime }" pattern="yyyy-MM-dd  HH:mm:ss" type="both"/></td>
    				<td>${userList.deleteUser }</td>
    				<td><fmt:formatDate value="${userList.deleteTime }" pattern="yyyy-MM-dd  HH:mm:ss" type="both"/></td>
    				<td>${userList.deleteState }</td>
    				<td>${userList.number }</td>
    			<td align="left">
                        <a href="toUpdateUser.do?userId=${userList.userId }"><input type="button" id="btnAdd" class="button" value="修改" /></a>
                 </td>
                 <td align="right">
                        <a href="javascript:void(0)" onclick="aa('${userList.userId}')"><input type="button" id="btnAdd" class="button" value="删除" /></a>
                 </td>
    			</tr>
    		
    		</c:forEach>
    	</table>
    	
    	<script>
	     	function aa(userId){
	     		if(confirm("确定删除吗?")){
	     			location.href="deleteUser.do?userId="+userId;
	     		}
	     	}
    	</script>
</body>
</html>
