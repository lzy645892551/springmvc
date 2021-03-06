<%@ page language="java"
	import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println("basePath："+basePath);
%>
<!DOCTYPE html>
<!-- saved from url=(0036)http://localhost:8080/EMIS/getbaojia -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Admin/secondCSS/H-ui.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Admin/secondCSS/H-ui.admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Admin/secondCSS/iconfont.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Admin/secondCSS/icheck.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Admin/secondCSS/skin.css" id="skin">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Admin/secondCSS/style.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Admin/secondCSS/showLoading.css">
<title>开盘管理</title>

<style type="text/css">
div#activity_pane {
	float: center;
	width: 150px;
	margin-top: 200px;
	height: 50px;
	border: 1px solid #CCCCCC;
	background-color: #EEEEEE;
	margin-left: 500px;
	text-align: center;
	display: none;
}

input[type=checkbox] {
	width: 20px;
	height: 20px;
}

.checkboxFive {
	width: 25px;
	margin: 20px 100px;
	position: relative;
}

.checkboxFive label {
	cursor: pointer;
	position: absolute;
	width: 25px;
	height: 25px;
	top: 0;
	left: 0;
	background: #eee;
	border: 1px solid #ddd;
}

.checkboxFive label:after {
	opacity: 0.2;
	content: '';
	position: absolute;
	width: 9px;
	height: 5px;
	background: transparent;
	top: 6px;
	left: 7px;
	border: 3px solid #333;
	border-top: none;
	border-right: none;
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.checkboxFive label:hover::after {
	opacity: 0.5;
}

/**
 * Create the checkbox state for the tick
 */
.checkboxFive input[type=checkbox]:checked+label:after {
	opacity: 1;
}
}
</style>

<script type="text/javascript">
function BjdBean(bjmc,ggxh,jsdw,dj,sl,ze,bz){
	this.bjmc = bjmc;
	this.ggxh = ggxh
	this.jsdw = jsdw
	this.dj = dj;
	this.sl = sl;
	this.ze = ze;
	this.bz = bz;
}

function fn1(){
	var j = 0; 
	var arr = new Array();
	var selectarr = document.getElementsByName("mcheck");
	for(var i=0;i<selectarr.length;i++){
		if(selectarr[i].checked){
			var id = selectarr[i].value;
			
			var bjmc = document.getElementById(id+"bjmc").innerHTML;
			var ggxh = document.getElementById(id+"ggxh").innerHTML;
			var jsdw = document.getElementById(id+"jsdw").innerHTML;
			var dj = document.getElementById(id+"dj").innerHTML;
			var sl = document.getElementById(id+"sl").value;
			var ze =  document.getElementById(id+"ze").value;
			var bz =  document.getElementById(id+"bz").value;
			var bean = new BjdBean(bjmc,ggxh,jsdw,dj,sl,ze,bz)
			
			arr[j] = bean;
			j++;
		}
	}
	document.getElementById("str").value = JSON.stringify(arr);
	document.getElementById("form2").submit();
	 
}
</script>
<link rel="stylesheet" href="<%=basePath%>Admin/secondCSS/layer.css" id="layui_layer_skinlayercss">
<link href="<%=basePath%>Admin/second/WdatePicker.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="form1" action="http://localhost:8080/EMIS/delcontractinfo"
		method="post" id="form1">
		<input type="hidden" name="id" id="id">
	</form>
    
	<nav class="breadcrumb">
		<i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>
		 楼房管理 <span class="c-gray en">&gt;</span> 开盘管理
	</nav>
	
	<div class="page-container" id="page-content">
		<!-- <span class="l">  
		<a class="btn btn-primary radius" onClick="system_category_add('添加合同基本信息','selfangjian.do')" href="javascript:;">新增认购</a></span>
		<form action="daochu2.jsp" method="post" id="form2">
			<input type="hidden" name="list" id="str" />
			<button class="btn btn-primary radius" id="" name="" onclick="fn1()">导出</button>
		</form> -->
		<div>
			<button class="btn btn-primary radius" onclick="delbatch()">导出</button>
			<a class="btn btn-primary radius" href="tobasicinfo.do">新增开盘</a>
			<button class="btn btn-primary radius" onclick="delbatch()">批量删除</button>
		</div>
		
		<!-- 
		<a href="" class="btn btn-primary radius">认购转签约</a>
		<a href="" class="btn btn-primary radius">作废</a>
		 -->
		<div class="cl pd-5 bg-1 bk-gray mt-50">
			<div  > &nbsp;&nbsp;&nbsp;
				
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper no-footer">
					<div class="dataTables_length" id="DataTables_Table_0_length">
						
					</div>
					<table
						class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer"
						id="DataTables_Table_0" role="grid"
						aria-describedby="DataTables_Table_0_info">
						<thead>
							<tr class="text-c" role="row">
								<th width="40" class="sorting_disabled" rowspan="1" colspan="1"
									aria-label="" style="width: 60px;"><input type="checkbox"
									name="" value=""></th>
								<th width="40" class="sorting_desc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-sort="descending" aria-label="备件名称: 升序排列"
									style="width: 30px;">序号</th>
								<th width="100" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="规格型号: 升序排列" style="width: 80px;">开盘报告名称</th>
								<th width="40" class="sorting_desc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-sort="descending" aria-label="备件名称: 升序排列"
									style="width: 200px;">报告类型</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="单位: 升序排列" style="width: 80px;">项目名称</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="单位: 升序排列" style="width: 80px;">折扣</th>
								<th width="80" class="sorting_disabled" rowspan="1" colspan="1"
									aria-label="销售单价" style="width: 80px;">状态</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="数量: 升序排列" style="width: 80px;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="open" items="${list}" varStatus="i">
								<tr class="text-c odd" role="row">
									<td><input type="checkbox" name="mcheck"  value="${open.openingReportId }" id="${open.openingReportId }"></td>
									<td name="count"  id="">${i.count }</td>
									<td name="openingReportName" id="${open.openingReportName }openingReportName">${open.openingReportName }</td>
									<td name="reportType"  id="${open.reportType}reportType">${open.reportType}</td>
									<td name="projectName"  id="${open.project.projectName}reportType">${open.project.projectName}</td>
									<td name="discount" id="${open.discount }discount">${open.discount }</td>
									<td name="state" id="${open.state }state">${open.state }</td>
									<td style="padding-left:-10px"><span class="l">  
									<a class="btn btn-primary radius" style="text-align:center;" <%-- onClick="system_category_add('修改单元信息','basicinfo.do?unitId=${unit.unitId}')" --%> 
									href="basicinfo.do">查看</a></span> 
									<%-- <a class="btn btn-primary radius" 
									href="javascript:if(confirm('确定删除吗?'))location='delete.do?unitId=${unit.unitId}'">删除</a></td> --%>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		<footer class="footer mt-20">
			<div class="container">Copyright © 本后台系统由KEG提供技术支持</div>
		</footer>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/layer.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/laypage.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/H-ui.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/H-ui.admin.js"></script>
		<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/jquery.showLoading.js"></script>
		<script type="text/javascript">
			$('.table-sort').dataTable({
				"aaSorting" : [ [ 1, "desc" ] ], //默认第几个排序
				"bStateSave" : true, //状态保存
				"aoColumnDefs" : [
					//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
					{
						"orderable" : false,
						"aTargets" : [ 0, 4 ]
					} // 制定列不参与排序
				]
			});
			/*系统-栏目-添加*/
			function system_category_add(title, url, w, h) {
				layer_show(title, url, w, h);
			}
			/*系统-栏目-编辑*/
			function system_category_edit(title, url, id, w, h) {
				layer_show(title, url, w, h);
			}
			/*系统-栏目-删除*/
			function system_hetong_del(obj, id) {
				layer.confirm('确认要删除吗？', function(index) {
					$(obj).parents("tr").remove();
					document.getElementById("id").value = id;
					document.form1.submit();
					layer.msg('已删除!', {
						icon : 1,
						time : 1000
					});
				});
			}
			
	
 	
 	
			function hh(id){
				var sl = document.getElementById(id+"sl").value; 
			    var dj = document.getElementById(id+"dj").innerHTML; 
			    var ze = sl*dj;
				document.getElementById(id+"ze").value = ze;
			}
			
			function delbatch() {
				var selectarr = document.getElementsByName("mcheck");
				var ids = [];
				for (var i = 0; i < selectarr.length; i++) {
					if (selectarr[i].checked) {
						var id = selectarr[i].value;
						ids[i] = id;
					}
				}
				location.href = "delbatch.do?ids=" + ids;
			}
			
	
		</script>

	</div>
	<a href="javascript:void(0)" class="Hui-iconfont toTop" title="返回顶部"
		alt="返回顶部" style="display:none"></a>
</body>
</html>