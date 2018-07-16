<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <form method="post" action="updateUser.do" id="form1">
    	<table align="center">
    		<tr>
    			<td>登录账户:<input type="text" id="userId" name="userId" value="${user.userId }" readonly="readonly"/></td>
    			<td>账户密码:<input type="password" id="password" name="password" value="${user.password }"/></td>
    		</tr>
    		<tr>
    			<td>组织编号:<input type="text" id="organizationId" name="organizationId" value="${user.organizationId }"/></td>
    			<td>角色编号:<input type="text" id="rolId" name="rolId" value="${user.rolId }"/></td>
    		</tr>
    		<tr>
    			<td>姓 &nbsp; &nbsp; &nbsp; 名:<input type="text" id="name" name="name" value="${user.name }"/></td>
    			<td>联系方式:<input type="text" id="tel" name="tel" value="${user.tel }"/></td>
    		</tr>
    		<tr>
    			<td>图片路径:<input type="text" id="picture" name="picture" value="${user.picture }"/></td>
    			<td>登录时间:<input type="text" id="userTime" name="userTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" value="<fmt:formatDate value='${user.userTime }' pattern='yyyy-MM-dd  HH:mm'/>"/></td>
    		</tr>
    		<tr>
    			<td>修&nbsp; 改&nbsp; 人:<input type="text" id="updateUser" name="updateUser" value="${name }" readonly="readonly"/></td>
    			<td>修改时间:<input type="text" id="updateTime" name="updateTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value='${user.updateTime }' pattern='yyyy-MM-dd  HH:mm'/>"/></td>
    		</tr>
    		<%-- <tr>
    			<td>删&nbsp; 除&nbsp; 人:<input type="text" id="deleteUser" name="deleteUser" value="${user.deleteUser }"/></td>
    			<td>删除时间:<input type="text" id="deleteTime" name="deleteTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value='${user.deleteTime }' pattern='yyyy-MM-dd  HH:mm'/>"/></td>
    		</tr> --%>
    		<tr>
    			<td>删除状态:<input type="text" id="deleteState" name="deleteState" value="${user.deleteState }"/></td>
    			<td>业务员编号:<input type="text" id="number" name="number" value="${user.number }"/></td>
    		</tr>
    		<tr>
                 <td align="right">
                        <input type="submit" id="btnAdd" class="button" value="修改" />
                 </td>
    		</tr>
    	</table>
    	
    </form>
    
    <script type="text/javascript">
	    function today(){//构建方法
	        var today=new Date();//new 出当前时间
	        var h=today.getFullYear();//获取年
	        var m=today.getMonth()+1;//获取月
	        var d=today.getDate();//获取日
	        var H = today.getHours();//获取时
	        var M = today.getMinutes();//获取分
	        var S = today.getSeconds();//获取秒
	        return h+"-"+m+"-"+d+" "+H+":"+M+":"+S; //返回 年-月-日 时:分:秒
		}
		document.getElementById("updateTime").value = today();//将获取到的 年-月-日 时:分:秒 赋给input文本输入框
	</script>
    
</body>
</html>
