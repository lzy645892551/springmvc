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
<title>户型管理</title>
<link rel="stylesheet" href="../Admin/secondCSS/layer.css" id="layui_layer_skinlayercss"><link href="../Admin/secondCSS/WdatePicker.css" rel="stylesheet" type="text/css"></head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span>户型管理</nav>
<div class="page-container">
<form action="../layout/layoutManager.do" method="post">
	<div class="text-c"> 
<!-- 	日期范围： -->
<!-- 		<input type="text" name="start" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;"> -->
<!-- 		- -->
<!-- 		<input type="text" name="end" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">&nbsp; -->
		<input type="text" class="input-text" style="width:100px" placeholder="户型名称" id="apartmentLayout" name="apartmentLayout">&nbsp;
		<input type="text" class="input-text" style="width:100px" placeholder="修改人" id="updateUser" name="updateUser">&nbsp;
<!--  		<input type="text" class="input-text" style="width:100px" placeholder="楼层" id="floorCount" name="floorCount">&nbsp; -->
<!-- 		<input type="text" class="input-text" style="width:100px" placeholder="单元数" id="roomCount" name="roomCount">&nbsp; -->
<!-- 		<input type="text" class="input-text" style="width:100px" placeholder="省份" id="" name="province">&nbsp; -->
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont"></i> 搜户型信息</button>
	</div>
</form>
    
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l"><a class="btn btn-primary radius" onClick="system_category_add('添加户型信息','../layout/layoutReady.do')" href="javascript:;"><i class="Hui-iconfont"></i> 添加户型基本信息</a></span>
	<span class="l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius" onClick="deleteSelect()" href="javascript:;"><i class="Hui-iconfont"></i> 删除选中户型信息</a></span>
	<span class="l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius"  href="../layout/layoutDeleteAll.do"><i class="Hui-iconfont"></i> 删除全部户型</a></span>
	</div>
	
	
	
	<div class="mt-20">
	
		<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
		  <table class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
			<thead>
				<tr class="text-c" role="row"><th class="sorting_disabled" rowspan="1" colspan="1" aria-label="合同字母编号" style="width:180px;"><input type = "checkbox" name = "checkAll" id = "checkAll"></th>
					<th class="sorting_desc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="descending" aria-label="合同数字编号: 升序排列" style="width: 180px;">序号</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="销售单号: 升序排列" style="width: 380px;">户型名称</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="客户: 升序排列" style="width: 157px;">修改人</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="备件名称: 升序排列" style="width: 400px;">修改时间</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="合同额: 升序排列" style="width: 150px;">操作</th>
				  </tr>
			</thead>
          <tbody>          
          		<c:forEach items="${layoutList}" var="layout" varStatus="stat">
          				<tr class="text-c odd" role="row">
						<td><input type = "checkbox" name ="checkbox" id = "${layout.apartmentLayoutId}" onchange="selectPorjectId()" /></td>
						<td class="sorting_1">${stat.index+1}</td>
						<td>${layout.apartmentLayout}</td>
						<td>${layout.updateUser }</td>
						<td>${layout.updateTime }</td>
						<td class="f-14">
						  <a title="编辑" href="javascript:;" onClick="system_category_add('修改户型信息','../layout/layoutReady.do?apartmentLayoutId=${layout.apartmentLayoutId}')" style="text-decoration:none"><i class="Hui-iconfont"></i></a>
						  <a title="删除" href="javascript:;" onClick="deleteSelect('${layout.apartmentLayoutId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a>
			  		    </td>
			    	</tr>
          		</c:forEach>     
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

function deleteSelect(apartmentLayoutId){
	var layoutIdSelect = "";
	if(apartmentLayoutId!=null){
		layoutIdSelect = apartmentLayoutId;
	}else{
		var obj = document.getElementsByName("checkbox");	
		for(i in obj){
			if(obj[i].checked){
				layoutIdSelect += obj[i].id+","
			}
		}
		layoutIdSelect = layoutIdSelect.substr(0,layoutIdSelect.length-1);
	}
	location.href = "../layout/layoutDelete.do?apartmentLayoutId="+layoutIdSelect;
	
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