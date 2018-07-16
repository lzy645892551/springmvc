<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!
DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>万达营销流程管理系统</title>
<link href="<%=basePath%>Admin/css/css.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="js/ie6png.js" ></script>
<script type="text/javascript">
DD_belatedPNG.fix('div,ul,li,a,p,img,body,dl,dt,dd');</script>
<![endif]-->
<script type="text/javascript">
	function MM_jumpMenu(targ, selObj, restore) { //v3.0
		eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
		if (restore)
			selObj.selectedIndex = 0;
	}
</script>
<script>
	<!--
	/*第一种形式 第二种形式 更换显示样式*/
	function setTab(name, cursel, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById("con_" + name + "_" + i);
			menu.className = i == cursel ? "hover" : "";
			con.style.display = i == cursel ? "block" : "none";
		}
	}
	//-->
</script>
</head>
<body>
	<div class="yboxwidth boxcenter ybox01">
		<div class="ybox09">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="ybox10td1"><a href="#"><img
							src="<%=basePath%>Admin/images/op8_1.gif" width="28" height="54" /></a></td>
					<td><table border="0" cellspacing="0" cellpadding="0">
							<tr valign="top">
								<td class="ybox11td1"></td>
								<td class="ybox11td2"><a href="#">1、填写基本信息</a></td>
								<td class="ybox11td8"></td>
								<td class="ybox11td6"><a href="#">2、选择房间</a></td>
								<td class="ybox11td7"></td>
								<td class="ybox11td2"><a href="#">3、导入价格</a></td>
								<td class="ybox11td3"></td>
								<td class="ybox11td2"><a href="#">4、引入折扣方案</a></td>
								<td class="ybox11td3"></td>
								<td class="ybox11td2"><a href="#">5、引入付款方式</a></td>
								<td class="ybox11td3"></td>
								<td class="ybox11td2"><a href="#">6、预览并提交</a></td>
								<td class="ybox11td4"></td>
							</tr>
						</table></td>
					<td class="ybox10td1"><a href="#"><img
							src="<%=basePath%>Admin/images/op8_2.gif" width="28" height="54" /></a></td>
				</tr>
			</table>
		</div>
		<div class="ybox02">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="margb4">
				<tr>
					<td class="ybox03td1"></td>
					<td class="ybox03td2"></td>
					<td class="ybox03td3"></td>
				</tr>
				<tr>
					<td class="ybox03td4"></td>
					<td class="ybox03td5"><div class="ybox05 margb8">
							<dl>
								<dt>
									<strong>【注】</strong>只能包含未开过盘的房间，系统将自动过滤。
								</dt>
							</dl>
						</div>
						<div class="ybox07 margb2">

							<dl>
								<table border="0" cellspacing="0" cellpadding="0"
									class="ybox07table" >
									<tr align="left">
										<td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_1.gif" /></td>
										<td><a href="getroom.do" >添加房间</a></td>
										<td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
										<td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_2.gif" /></td>
										<td><a href="javascript:;" onclick="removebatch()">移除选中房间</a></td>
										<td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
										<td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_3.gif" /></td>
										<td><a href="removeall.do">移除所有房间</a></td>
										<td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
									</tr>
								</table>
							</dl>
						</div>
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							class="ybox06table">
							
							<tr>
								<td class="ybox06td01"><input type="checkbox"
									name="checkbox" id="checkall" onchange="trans()"  /></td>
								<td width="30" class="ybox06td01">序号</td>
								<td class="ybox06td01">项目</td>
								<td class="ybox06td01">房间</td>
								<td class="ybox06td01">建筑面积</td>
								<td class="ybox06td01">套内面积</td>
								<td class="ybox06td01">计价方式</td>
								<td class="ybox06td01">建筑面积单价</td>
								<td class="ybox06td01">套内面积单价</td>
							</tr>
							
							
							<c:forEach items="${roomList }" var="room" varStatus="i">
								<tr>
									<td class="ybox06td03bcenter"><input type="checkbox" name="mcheck" id="checkbox"
									value="${room.roomId }" /></td>
									<td class="ybox06td03bcenter">${i.count }</td>
									<td class="ybox06td03bleft">${open.project.projectName }</td>
									<td class="ybox06td03bleft">${room.roomCode }</td>
									<td class="ybox06td03bcenter">${room.buildUpArea }</td>
									<td class="ybox06td03bcenter">${room.innerArea }</td>
									<td class="ybox06td03bcenter">
										<c:if test="${open.priceType == 1 }">
											建筑面积
										</c:if>
										<c:if test="${open.priceType == 2 }">
											套内面积
										</c:if>
									</td>
									<td class="ybox06td03bcenter">${room.unitPrice }</td>
									<td class="ybox06td03bcenter">${room.innerPrice }</td>
								</tr>
							</c:forEach>
							
							
						</table>
						<div class="nums boxcenter black12">
							<a href="#" class="hovera">首 页</a><a href="#">上一页</a><a href="#">下一页</a><a
								href="#">尾 页</a>&nbsp;&nbsp;&nbsp;第1/3页&nbsp;&nbsp;&nbsp;每页&nbsp;
							<input name="textfield3" type="text" id="textfield" size="2" />
							&nbsp;条/共25条&nbsp;&nbsp;转到&nbsp; <input name="textfield3"
								type="text" id="textfield" size="2" /> &nbsp;页<a href="#">跳
								转</a>
						</div></td>
					<td class="ybox03td6"></td>
				</tr>
				<tr>
					<td class="ybox03td7"></td>
					<td class="ybox03td8"></td>
					<td class="ybox03td9"></td>
				</tr>
			</table>
			<table width="380" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="60" align="center"><a href="javascript:history.go(-1)"><img
							src="<%=basePath%>Admin/images/botton01.gif" width="95" height="34" /></a></td>
					<td align="center"><a href="getprice.do"><img
							src="<%=basePath%>Admin/images/botton02.gif" width="95" height="34" /></a></td>
				</tr>
			</table>
		</div>
	</div>
	
<script type="text/javascript">
	function removebatch() {
		var selectarr = document.getElementsByName("mcheck");
		var ids = [];
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				ids[i] = id;
			}
		}
		location.href = "removebatch.do?ids=" + ids;
	}

	function trans() {
		var check = $("#checkall").prop("checked");
		alert(check);
	}
</script>
	
</body>
</html>
