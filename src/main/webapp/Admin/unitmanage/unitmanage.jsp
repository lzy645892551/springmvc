<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println("basePath："+basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%-- <base href="<%=basePath%>"> --%>

<title>单元管理</title>
<link href="<%=basePath%>Admin/css/css.css" rel="stylesheet" type="text/css" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
</script>
</head>

<body>

	<div class="yboxwidth boxcenter ybox01">
		
		<div class="ybox09">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="ybox10td1"></td>
					<td><table border="0" cellspacing="0" cellpadding="0">
							<tr valign="top">
								<!-- <td class="ybox11td1"></td> -->
								<td class="ybox11td6"><a href="#">&nbsp;&nbsp;单元管理&nbsp;&nbsp;</a></td>
								<!-- <td class="ybox11td3"></td>
								<td class="ybox11td2"><a href="#">2、选择房间</a></td>
								<td class="ybox11td8"></td>
								<td class="ybox11td6"><a href="#">3、导入价格</a></td>
								<td class="ybox11td7"></td>
								<td class="ybox11td2"><a href="#">4、引入折扣方案</a></td>
								<td class="ybox11td3"></td>
								<td class="ybox11td2"><a href="#">5、引入付款方式</a></td>
								<td class="ybox11td3"></td>
								<td class="ybox11td2"><a href="#">6、预览并提交</a></td>
								<td class="ybox11td4"></td> -->
							</tr>
						</table></td>
					<td class="ybox10td1"></td>
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
					<td class="ybox03td5"><!-- <div class="ybox05 margb8">
							<dl>
								<dt>
									<strong>【注】</strong>1、点击"下载价格模板"，填写房间价格。<br />
									2、点击"导入价格明细"，导入房间价格。
								</dt>
							</dl>
						</div> -->
						<div class="ybox07 margb2">
							<dl>
								<table border="0" cellspacing="0" cellpadding="0"
									class="ybox07table">
									<tr align="left">
										<td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_4.gif" /></td>
										<td><a href="#">下载价格模板</a></td>
										<td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
										<td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_5.gif" /></td>
										<td><a href="#">导入价格明细</a></td>
										<td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
									</tr>
									<div style="float:right"><a href="unitmanage/toadd.do">添加</a></div>
								</table>
							</dl>
						</div>
						<br>
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							class="ybox06table">
							<tr>
								<td width="30" class="ybox06td01">序号</td>
								<td class="ybox06td01">所属楼栋</td>
								<td class="ybox06td01">所属项目</td>
								<td class="ybox06td01">单元号</td>
								<td class="ybox06td01">房间数量</td>
								<td class="ybox06td01">修改人</td>
								<td class="ybox06td01">修改时间</td>
								<td class="ybox06td01">操作</td>
							</tr>
							<c:forEach var="unit" items="${list}" varStatus="i">
								<tr>
									<td class="ybox06td02wcenter">${i.count }</td>
									<td class="ybox06td02wleft">${unit.buildId }</td>
									<td class="ybox06td02wleft">${unit.projectId }</td>
									<td class="ybox06td02wcenter">${unit.unitCode }</td>
									<td class="ybox06td02wcenter">${unit.roomCount }</td>
									<td class="ybox06td02wcenter">${unit.updateUser }</td>
									<td class="ybox06td02wcenter">${unit.updateTime }</td>
									<td class="ybox06td02wcenter"><a href="unitmanage/toupdate.do?unitId=${unit.unitId}">修改</a> || <img  src="<%=basePath%>Admin/images/op4_3.gif"></td>
								</tr>
							</c:forEach>
							
							<tr>
								<td class="ybox06td02wcenter">1</td>
								<td class="ybox06td02wleft">银川西夏万达广场</td>
								<td class="ybox06td02wleft">城市商业街-1-101</td>
								<td class="ybox06td02wcenter">162.74</td>
								<td class="ybox06td02wcenter">154.38</td>
								<td class="ybox06td02wcenter">建筑面积</td>
								<td class="ybox06td02wcenter">13648.91</td>
								<td class="ybox06td02wcenter">14388.03</td>
								<td class="ybox06td02wcenter">2221224.11</td>
							</tr>
							<tr>
								<td class="ybox06td03bcenter">2</td>
								<td class="ybox06td03bleft">银川西夏万达广场</td>
								<td class="ybox06td03bleft">城市商业街-1-102</td>
								<td class="ybox06td03bcenter">135.34</td>
								<td class="ybox06td03bcenter">128.39</td>
								<td class="ybox06td03bcenter">建筑面积</td>
								<td class="ybox06td03bcenter">11040.40</td>
								<td class="ybox06td03bcenter">11638.03</td>
								<td class="ybox06td03bcenter">1494207.20</td>
							</tr>
							<tr>

								<td class="ybox06td02wcenter">3</td>
								<td class="ybox06td02wleft">银川西夏万达广场</td>
								<td class="ybox06td02wleft">城市商业街-1-103</td>
								<td class="ybox06td02wcenter">20.33</td>
								<td class="ybox06td02wcenter">19.29</td>
								<td class="ybox06td02wcenter">建筑面积</td>
								<td class="ybox06td02wcenter">32779.35</td>
								<td class="ybox06td02wcenter">34546.61</td>
								<td class="ybox06td02wcenter">666404.14</td>
							</tr>
							<tr>
								<td class="ybox06td03bcenter">4</td>
								<td class="ybox06td03bleft">银川西夏万达广场</td>
								<td class="ybox06td03bleft">城市商业街-1-104</td>
								<td class="ybox06td03bcenter">94.26</td>
								<td class="ybox06td03bcenter">89.42</td>
								<td class="ybox06td03bcenter">建筑面积</td>
								<td class="ybox06td03bcenter">18322.83</td>
								<td class="ybox06td03bcenter">19314.58</td>
								<td class="ybox06td03bcenter">1727109.59</td>
							</tr>
							<tr>

								<td class="ybox06td02wcenter">5</td>
								<td class="ybox06td02wleft">银川西夏万达广场</td>
								<td class="ybox06td02wleft">城市商业街-1-105</td>
								<td class="ybox06td02wcenter">98.48</td>
								<td class="ybox06td02wcenter">93.42</td>
								<td class="ybox06td02wcenter">建筑面积</td>
								<td class="ybox06td02wcenter">20496.58</td>
								<td class="ybox06td02wcenter">21606.75</td>
								<td class="ybox06td02wcenter">2018503.04</td>
							</tr>
							<tr>
								<td class="ybox06td03bcenter">6</td>
								<td class="ybox06td03bleft">银川西夏万达广场</td>
								<td class="ybox06td03bleft">城市商业街-1-106</td>
								<td class="ybox06td03bcenter">83.88</td>
								<td class="ybox06td03bcenter">79.58</td>
								<td class="ybox06td03bcenter">建筑面积</td>
								<td class="ybox06td03bcenter">18322.36</td>
								<td class="ybox06td03bcenter">19312.39</td>
								<td class="ybox06td03bcenter">1536879.91</td>
							</tr>
							<tr>
								<td class="ybox06td02wcenter">7</td>
								<td class="ybox06td02wleft">银川西夏万达广场</td>
								<td class="ybox06td02wleft">城市商业街-1-107</td>
								<td class="ybox06td02wcenter">141.45</td>
								<td class="ybox06td02wcenter">134.19</td>
								<td class="ybox06td02wcenter">建筑面积</td>
								<td class="ybox06td02wcenter">11800.63</td>
								<td class="ybox06td02wcenter">12439.07</td>
								<td class="ybox06td02wcenter">1669198.91</td>
							</tr>
							<tr>
								<td class="ybox06td03bcenter">8</td>
								<td class="ybox06td03bleft">银川西夏万达广场</td>
								<td class="ybox06td03bleft">城市商业街-1-108</td>
								<td class="ybox06td03bcenter">31.87</td>
								<td class="ybox06td03bcenter">30.23</td>
								<td class="ybox06td03bcenter">建筑面积</td>
								<td class="ybox06td03bcenter">32779.35</td>
								<td class="ybox06td03bcenter">34557.65</td>
								<td class="ybox06td03bcenter">1044677.82</td>
							</tr>
							<tr>
								<td class="ybox06td02wcenter">9</td>
								<td class="ybox06td02wleft">银川西夏万达广场</td>
								<td class="ybox06td02wleft">城市商业街-1-109</td>
								<td class="ybox06td02wcenter">110.36</td>
								<td class="ybox06td02wcenter">104.66</td>
								<td class="ybox06td02wcenter">建筑面积</td>
								<td class="ybox06td02wcenter">15056.50</td>
								<td class="ybox06td02wcenter">15876.51</td>
								<td class="ybox06td02wcenter">1661635.04</td>
							</tr>
							<tr>
								<td class="ybox06td03bcenter">10</td>
								<td class="ybox06td03bleft">银川西夏万达广场</td>
								<td class="ybox06td03bleft">城市商业街-1-110</td>
								<td class="ybox06td03bcenter">83.94</td>
								<td class="ybox06td03bcenter">79.64</td>
								<td class="ybox06td03bcenter">建筑面积</td>
								<td class="ybox06td03bcenter">17235.87</td>
								<td class="ybox06td03bcenter">18166.49</td>
								<td class="ybox06td03bcenter">1446778.89</td>
							</tr>
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
			<!-- <table width="380" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="60" align="center"><a href="#"><img
							src="images/botton01.gif" width="95" height="34" /></a></td>
					<td align="center"><a href="#"><img
							src="images/botton02.gif" width="95" height="34" /></a></td>
				</tr>
			</table> -->
		</div>
	</div>
</body>
</html>
