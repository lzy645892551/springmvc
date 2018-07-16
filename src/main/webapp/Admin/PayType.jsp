<%@ page language="java"
	import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/H-ui.min.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/H-ui.admin.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/iconfont.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/icheck.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/skin.css" id="skin">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/style.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/showLoading.css">
<title>报价制作</title>

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
function BjdBean(orderId,customerName,payArea,unitPrice,total,orderType,payTypeName,name){
	this.orderId = orderId;
	this.customerName = customerName;
	this.payArea = payArea;
	this.unitPrice = unitPrice;
	this.total = total;
	this.orderType = orderType;
	this.payTypeName = payTypeName;
	this.name = name;
}

function fn1(){
	var j = 0; 
	var arr = new Array();
	var selectarr = document.getElementsByName("mcheck");
	for(var i=0;i<selectarr.length;i++){
		if(selectarr[i].checked){
			var id = selectarr[i].value;
			
			var orderId = document.getElementById(id+"orderId").innerHTML;
			var customerName = document.getElementById(id+"customerName").innerHTML;
			var payArea = document.getElementById(id+"payArea").innerHTML;
			var unitPrice = document.getElementById(id+"unitPrice").innerHTML;
			var total = document.getElementById(id+"total").innerHTML;
			var orderType =  document.getElementById(id+"orderType").innerHTML;
			var payTypeName =  document.getElementById(id+"payTypeName").innerHTML;
			var name =  document.getElementById(id+"name").innerHTML;
			var bean = new BjdBean(orderId,customerName,payArea,unitPrice,total,orderType,payTypeName,name)
			arr[j] = bean;
			j++;
		}
	}
	document.getElementById("str").value = JSON.stringify(arr);
	document.getElementById("form2").submit();
	 
}


function zuofei(){
	var selectarr = document.getElementsByName("mcheck");
	var ids = [];
	for(var i=0;i<selectarr.length;i++){
		if(selectarr[i].checked){
			var id = selectarr[i].value;
			ids[i] = id;
		}
	}
	location.href="zuofei.do?ids="+ids;
}
function qianyue(){
	var selectarr = document.getElementsByName("mcheck");
	var ids = [];
	for(var i=0;i<selectarr.length;i++){
		if(selectarr[i].checked){
			var id = selectarr[i].value;
			ids[i] = id;
		}
	}
	location.href="qianyue.do?ids="+ids;
}
function del(){
	var selectarr = document.getElementsByName("mcheck");
	var ids = [];
	for(var i=0;i<selectarr.length;i++){
		if(selectarr[i].checked){
			var id = selectarr[i].value;
			ids[i] = id;
		}
	}
	location.href="del.do?ids="+ids;
}
</script>
<link rel="stylesheet" href="../Admin/secondCSS/layer.css" id="layui_layer_skinlayercss">
<link href="../Admin/secondCSS/WdatePicker.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="form1" action="http://localhost:8080/EMIS/delcontractinfo"
		method="post" id="form1">
		<input type="hidden" name="id" id="id">
	</form>
    
	<nav class="breadcrumb">
		<i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span>
		交易管理 <span class="c-gray en">&gt;</span> 订单管理
	</nav>
	
	<div class="page-container" id="page-content">
		<span class="l">  <a class="btn btn-primary radius" onClick="system_category_add('新增付款方式','../Admin/addfukuan.jsp')" href="javascript:;">新增付款方式</a></span>
		
		<button class="btn btn-primary radius" onclick="del()">删除</button>
		<div class="cl pd-5 bg-1 bk-gray mt-50">
			<div class="mt-50">
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
									style="width: 200px;">付款方式ID</th>
								<th width="100" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="规格型号: 升序排列" style="width: 80px;">付款方式名称</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="单位: 升序排列" style="width: 80px;">使用对象</th>
								<th width="80" class="sorting_disabled" rowspan="1" colspan="1"
									aria-label="销售单价" style="width: 80px;">付款方式类型</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="数量: 升序排列" style="width: 80px;">百分比</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="单位: 升序排列" style="width: 80px;">折扣</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 80px;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="htmx" items="${list}" varStatus="a">
								<tr class="text-c odd" role="row">
									<td><input type="checkbox" name="mcheck"  value="${htmx.payTypeId}" id="${htmx.payTypeId }"></td>
									<td name="payTypeId"  id="${htmx.payTypeId }payTypeId">${htmx.payTypeId}</td>
									<td name="payTypeName" id="${htmx.payTypeId }payTypeName">${htmx.payTypeName}</td>
									<td name="applyScope" id="${htmx.payTypeId }applyScope">${htmx.applyScope}</td>
									<td name="payTypeKind" id="${htmx.payTypeId }payTypeKind">${htmx.payTypeKind}</td>
									<td name="explains" id="${htmx.payTypeId }explains" >${htmx.explains }</td>
									<td name="discount" id="${htmx.payTypeId }discount" >${htmx.discount }</td>
									<td class="ybox06td03bcenter"><span class="l">  <a class="btn btn-primary radius" onClick="system_category_add('修改付款方式','selbyid.do?Id=${htmx.payTypeId}')" href="javascript:;">查看/修改</a></span> </td>
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
		<script type="text/javascript" src="../Admin/secondCSS/jquery.min.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/jquery.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/layer.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/laypage.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/WdatePicker.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/H-ui.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/H-ui.admin.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/jquery.showLoading.js"></script>
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
			
	
		</script>

	</div>
	<a href="javascript:void(0)" class="Hui-iconfont toTop" title="返回顶部"
		alt="返回顶部" style="display:none"></a>
</body>
</html>