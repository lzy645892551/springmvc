<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- saved from url=(0045)http://localhost:8080/EMIS/getallcontractinfo -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/H-ui.min.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/H-ui.admin.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/iconfont.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/icheck.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/skin.css" id="skin">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/style.css">
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>房间管理</title>
<link rel="stylesheet" href="../Admin/secondCSS/layer.css" id="layui_layer_skinlayercss"><link href="../Admin/secondCSS/WdatePicker.css" rel="stylesheet" type="text/css"></head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span>合同基本信息管理</nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l"><a href = "javascript:window.history.back(-1)" class="btn btn-primary radius" style = "width: 150px" >返回</a>
    </span></div>
	
	
	<div class="mt-20">
		<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
		  <table class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
			<thead>
				  <tr  class="text-c odd" role="row">
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="销售单号: 升序排列" style="width: 280px;">房间名称</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="销售单号: 升序排列" style="width: 280px;">楼层</th>
<!-- 					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="最终用户: 升序排列" style="width: 280px;">项目编号</th> -->
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="最终用户: 升序排列" style="width: 300px;">房间的实际面积</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="最终用户: 升序排列" style="width: 300px;">房间的可使用面积</th>
					<th class="sorting_disabled" rowspan="1" colspan="1" aria-label="采购方" style="width:180px;">套内面积单价</th>
					<th class="sorting_disabled" rowspan="1" colspan="1" aria-label="采购方" style="width:180px;">建筑面积单价</th>
				  </tr>
			</thead>
          <tbody>          
          			<tr class="text-c odd" role="row">
						<td>${room.roomCode}</td>
						<td>${room.floor }</td>
					    <td>${room.buildUpArea }</td>
						<td>${room.innerArea }</td>
						<td>${room.innerPrice}</td>
						<td>${room.unitPrice}</td>
			    	</tr>
		    </tbody>
		</table>
		</div>
	</div>
</div>
	<footer class="footer mt-20">
	<div class="container">
		Copyright ©       本后台系统由KEG提供技术支持
	</div>
    </footer>
<script type="text/javascript" src="../Admin/secondCSS/jquery.min.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/layer.js"></script>
<script type="text/javascript" src="../Admin/secondCSS/laypage.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/WdatePicker.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/H-ui.js"></script><a href="javascript:void(0)" class="Hui-iconfont toTop" title="返回顶部" alt="返回顶部" style="display:none"></a> 
<script type="text/javascript" src="../Admin/secondCSS/H-ui.admin.js"></script> 
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,4]}// 制定列不参与排序
	]
});

function deleteSelect(roomId){
	var roomIdSelect = "";
	if(roomId!=null){
		roomIdSelect = roomId;
	}else{
		var obj = document.getElementsByName("checkbox");	
		for(i in obj){
			if(obj[i].checked){
				roomIdSelect += obj[i].id+","
			}
		}
		roomIdSelect = roomIdSelect.substr(0,roomIdSelect.length-1);
	}
	location.href = "../room/roomDelete.do?roomId="+roomIdSelect;
	
}



/*系统-栏目-添加*/
function system_category_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*系统-栏目-编辑*/
function system_category_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*系统-栏目-删除*/
function system_category_del(title,url,id,w,h){
	layer_show(title,url,w,h);

}
</script>

</body></html>