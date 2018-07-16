<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="../Admin/secondCSS/H-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="../Admin/secondCSS/H-ui.admin.css">
<link rel="stylesheet" type="text/css"
	href="../Admin/secondCSS/iconfont.css">
<link rel="stylesheet" type="text/css"
	href="../Admin/secondCSS/icheck.css">
<link rel="stylesheet" type="text/css"
	href="../Admin/secondCSS/skin.css" id="skin">
<link rel="stylesheet" type="text/css"
	href="../Admin/secondCSS/style.css">
<link rel="stylesheet" type="text/css"
	href="../Admin/secondCSS/showLoading.css">
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
	function BjdBean(roomPayId, contractId, orderId, roomId, customerId, customerName, userId, name,receivableMoney,receivedMoney,uncollectedMoney,payTime,payType,finishTimes,waitTimes,deleteState) {
		this.roomPayId = roomPayId;
		this.contractId = contractId;
		this.orderId = orderId;
		this.roomId = roomId;
		this.customerId = customerId;
		this.customerName = customerName;
		this.userId = userId;
		this.name = name;
		this.receivableMoney = receivableMoney;
		this.receivedMoney = receivedMoney;
		this.uncollectedMoney = uncollectedMoney;
		this.payTime = payTime;
		this.payType = payType;
		this.finishTimes = finishTimes;
		this.waitTimes = waitTimes;
		this.deleteState = deleteState;
	}

	function fn1() {
		var j = 0;
		var arr = new Array();
		var selectarr = document.getElementsByName("mcheck");
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;

				var roomPayId = document.getElementById(id + "roomPayId").innerHTML;
				var contractId = document.getElementById(id + "contractId").innerHTML;
				var orderId = document.getElementById(id + "orderId").innerHTML;
				var roomId = document.getElementById(id + "roomId").innerHTML;
				var customerId = document.getElementById(id + "customerId").innerHTML;
				var customerName = document.getElementById(id + "customerName").innerHTML;
				var userId = document.getElementById(id + "userId").innerHTML;
				var name = document.getElementById(id + "name").innerHTML;
				var receivableMoney = document.getElementById(id + "receivableMoney").innerHTML;
				var receivedMoney = document.getElementById(id + "receivedMoney").innerHTML;
				var uncollectedMoney = document.getElementById(id + "uncollectedMoney").innerHTML;
				var payTime = document.getElementById(id + "payTime").innerHTML;
				var payType = document.getElementById(id + "payType").innerHTML;
				var finishTimes = document.getElementById(id + "finishTimes").innerHTML;
				var waitTimes = document.getElementById(id + "waitTimes").innerHTML;
				var deleteState = document.getElementById(id + "deleteState").innerHTML;
				var bean = new BjdBean(roomPayId, contractId, orderId, roomId, customerId, customerName, userId, name,receivableMoney,receivedMoney,uncollectedMoney,payTime,payType,finishTimes,waitTimes,deleteState)
				arr[j] = bean;
				j++;
			}
		}
		document.getElementById("str").value = JSON.stringify(arr);
		document.getElementById("form2").submit();
	}
	function huankuan() {
		var selectarr = document.getElementsByName("mcheck");
		var ids = "";
		var receivedMoneys = "";
		var uncollectedMoneys = "";
		for (var i = 0; i < selectarr.length; i++) {
				var id = selectarr[i].value;
				var receivedMoney = document.getElementById(id + "receivedMoney").value;
				var uncollectedMoney = document.getElementById(id + "uncollectedMoney").innerHTML;
				if(receivedMoney!=""){
					ids += id+",";
					receivedMoneys += receivedMoney+",";
					uncollectedMoneys += uncollectedMoney+",";
				}
		}
		location.href="huankuan.do?ids="+ids+"&receivedMoneys="+receivedMoneys+"&uncollectedMoneys="+uncollectedMoneys;
	}

	function gengming() {
		var selectarr = document.getElementsByName("mcheck");
		
		var j = 0;
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				var deleteState = document.getElementById(id + "deleteState").innerHTML;
				j++;
			}
		}
		if(j == 1){
			if(deleteState == '作废'){
				alert("此订单已作废！")
			}
			if(deleteState == '使用'||deleteState == '申请未通过'){
				location.href='gengmingshenqing.do?id='+id;
			}
			if(deleteState == '更名申请中' || deleteState == '换房申请中'){
				alert("正在申请！")
			}
			if(deleteState == '换房申请通过'){
				alert("正在进行换房申请！")
			}
			if(deleteState == '更名申请通过'){
				var customerName;
				customerName=prompt("请输入更改后的客户名:");
				location.href='gengming.do?customerName='+customerName+'&roomPayId='+id;
			}
			//system_category_add('添加销售机会','../xiaoshou/zhuanqianyue.do?customerName='+customerName+'&userName='+userName); 
		}
		if(j>1){
			alert("每次只能转一个！");
		}
		if(j==0){
			alert("请选择要更名的！");
		} 
	}
	function huanfang() {
		var selectarr = document.getElementsByName("mcheck");
		
		var j = 0;
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				var deleteState = document.getElementById(id + "deleteState").innerHTML;
				j++;
			}
		}
		if(j == 1){
			if(deleteState == '作废'){
				alert("此订单已作废！")
			}
			if(deleteState == '使用'||deleteState == '申请未通过'){
				location.href='huanfangshenqing.do?id='+id;
			}
			if(deleteState == '更名申请中' || deleteState == '换房申请中'){
				alert("正在申请！")
			}
			if(deleteState == '更名申请通过'){
				alert("正在进行更名申请！")
			}
			if(deleteState == '换房申请通过'){
				system_category_add('选择房间','xuanzefang.do?id='+id); 
			}
			//system_category_add('添加销售机会','../xiaoshou/zhuanqianyue.do?customerName='+customerName+'&userName='+userName); 
		}
		if(j>1){
			alert("每次只能转一个！");
		}
		if(j==0){
			alert("请选择要换的房！");
		} 
	}
	function zuofei() {
		var selectarr = document.getElementsByName("mcheck");
		var ids = [];
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				ids[i] = id;
			}
		}
		location.href = "zuofei.do?ids=" + ids;
	}
	
	function del() {
		var selectarr = document.getElementsByName("mcheck");
		var ids = [];
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				ids[i] = id;
			}
		}
		location.href = "del.do?ids=" + ids;
	}
	function tuikuan() {
		var selectarr = document.getElementsByName("mcheck");
		var ids = [];
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				ids[i] = id;
			}
		}
		location.href = "tuikuan.do?ids=" + ids;
	}
</script>
<link rel="stylesheet" href="../Admin/secondCSS/layer.css"
	id="layui_layer_skinlayercss">
<link href="../Admin/second/WdatePicker.css" rel="stylesheet"
	type="text/css">
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
		<button class="btn btn-primary radius" onclick="del()">删除房款信息</button>
		<button class="btn btn-primary radius" onclick="zuofei()">作废房款信息</button>
		<button class="btn btn-primary radius" onclick="gengming()">更名申请</button>
		<button class="btn btn-primary radius" onclick="huanfang()">换房申请</button>
		<button class="btn btn-primary radius" onclick="huankuan()">还款</button>
		<button class="btn btn-primary radius" onclick="tuikuan()">退款</button>
		<form action="daochu.do" method="post" id="form2">
			<input type="hidden" name="list" id="str" />
			<button class="btn btn-primary radius" id="" name="" onclick="fn1()">导出</button>
		</form>
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
									style="width: 80px;">编号</th>
								<th width="100" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="规格型号: 升序排列" style="width: 80px;">合同编号</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="单位: 升序排列" style="width: 80px;">订单编号</th>
								<th width="80" class="sorting_disabled" rowspan="1" colspan="1"
									aria-label="销售单价" style="width: 80px;">房间编号</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="数量: 升序排列" style="width: 80px;">客户编号</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="单位: 升序排列" style="width: 30px;">客户名称</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">业务员编号</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">业务员名称</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">应收金额</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">已收金额</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">未收金额</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">付款时间</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">付款类型</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">已缴款次数</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">待交款次数</th>
								<th width="80" class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									aria-label="备注: 升序排列" style="width: 30px;">状态</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="htmx" items="${list}" varStatus="a">
								<tr class="text-c odd" role="row">
									<td><input type="checkbox" name="mcheck"
										value="${htmx.roomPayId}" id="${htmx.roomPayId }"></td>
									<td name="roomPayId"
										id="${htmx.roomPayId }roomPayId">${htmx.roomPayId}</td>
									<td name="contractId"
										id="${htmx.roomPayId }contractId">${htmx.contractId}</td>
									<td name="orderId"
										id="${htmx.roomPayId }orderId">${htmx.orderId}</td>
									<td name="roomId" id="${htmx.roomPayId }roomId">${htmx.roomId}</td>
									<td name="customerId" id="${htmx.roomPayId }customerId">${htmx.customerId}</td>
									<td name="customerName" id="${htmx.roomPayId }customerName">${htmx.customerName }</td>
									<td name="userId" id="${htmx.roomPayId }userId">${htmx.userId }</td>
									<td name="name" id="${htmx.roomPayId }name">${htmx.name }</td>
									<td name="receivableMoney" id="${htmx.roomPayId }receivableMoney">${htmx.receivableMoney }</td>
									<td ><input name="receivedMoney" id="${htmx.roomPayId }receivedMoney" type="text"  class="input-text "  value="${htmx.receivedMoney}"></td>
									<td name="uncollectedMoney" id="${htmx.roomPayId }uncollectedMoney">${htmx.uncollectedMoney }</td>
									<td name="payTime" id="${htmx.roomPayId }payTime">${htmx.payTime }</td>
									<td name="payType" id="${htmx.roomPayId }payType">${htmx.payType }</td>
									<td name="finishTimes" id="${htmx.roomPayId }finishTimes">${htmx.finishTimes }</td>
									<td name="waitTimes" id="${htmx.roomPayId }waitTimes">${htmx.waitTimes }</td>
									<td name="deleteState" id="${htmx.roomPayId }deleteState">${htmx.deleteState }</td>
									<%-- <td class="ybox06td03bcenter"><span class="l"> <a
											class="btn btn-primary radius"
											onClick="system_category_add('修改订单信息','selbyid.do?xiaoshouId=${htmx.roomPayId}')"
											href="javascript:;">查看/修改</a></span></td> --%>
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
		<script type="text/javascript"
			src="../Admin/secondCSS/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/H-ui.js"></script>
		<script type="text/javascript" src="../Admin/secondCSS/H-ui.admin.js"></script>
		<script type="text/javascript"
			src="../Admin/secondCSS/jquery.showLoading.js"></script>
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
		
		
		
		
			function hh(id) {
				var sl = document.getElementById(id + "sl").value;
				var dj = document.getElementById(id + "dj").innerHTML;
				var ze = sl * dj;
				document.getElementById(id + "ze").value = ze;
			}
		</script>

	</div>
	<a href="javascript:void(0)" class="Hui-iconfont toTop" title="返回顶部"
		alt="返回顶部" style="display:none"></a>
</body>
</html>