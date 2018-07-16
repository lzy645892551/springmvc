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
    <form method="post" action="updateOrganization.do" id="form1">
    	<table align="center">
    		<tr>
    			<td>组织名称:<input type="text" id="organizationName" name="organizationName" value="${organization.organizationName }" />
    			<input type="hidden" id="organizationId" name="organizationId" value="${organization.organizationId }" />
    			</td>
    		</tr>
    		<tr>
    			<td>组织地址:<input type="text" id="organizationAddress" name="organizationAddress" value="${organization.organizationAddress }"/></td>
    		</tr>
    		<tr>
    			<td>组织电话:<input type="text" id="organizationTel" name="organizationTel" value="${organization.organizationTel }"/></td>
    		</tr>
    		<tr>
    			<td>修&nbsp; 改&nbsp; 人:<input type="text" id="updateUser" name="updateUser" value="${name }" readonly="readonly"/></td>
    		</tr>
    		<tr>
    			<td>修改时间:<input type="text" id="updateTime" name="updateTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value='${organization.updateTime }' pattern='yyyy-MM-dd  HH:mm'/>"/></td>
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
