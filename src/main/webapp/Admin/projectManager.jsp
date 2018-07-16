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
<title>项目管理</title>
<link rel="stylesheet" href="../Admin/secondCSS/layer.css" id="layui_layer_skinlayercss"><link href="../Admin/secondCSS/WdatePicker.css" rel="stylesheet" type="text/css"></head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span>合同基本信息管理</nav>
<div class="page-container">
<form action="../project/projectManager.do" method="post">
	<div class="text-c"> 
<!-- 		<input type="text" name="startTime" onFocus="WdatePicker({maxDate:&#39;#F{$dp.$D(\&#39;datemax\&#39;)||\&#39;%y-%M-%d\&#39;}&#39;})" id="datemin" class="input-text Wdate" style="width:120px;"> -->
<!-- 		- -->
<!-- 		<input type="text" name="endTime" onFocus="WdatePicker({minDate:&#39;#F{$dp.$D(\&#39;datemin\&#39;)}&#39;,maxDate:&#39;%y-%M-%d&#39;})" id="datemax" class="input-text Wdate" style="width:120px;">&nbsp; -->
		<input type="text" class="input-text" style="width:100px" placeholder="项目名称" id="" name="projectName">&nbsp;
		<input type="text" class="input-text" style="width:100px" placeholder="修改人员" id="" name="clientshort">&nbsp;
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont"></i> 搜销售合同</button>
	</div>
</form>
    
	 
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l"><a class="btn btn-primary radius" onClick="projectAdd()" href="javascript:;"><i class="Hui-iconfont"></i> 添加项目基本信息</a></span>
	<span class="l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius" onClick="deleteSelect()" href="javascript:;"><i class="Hui-iconfont"></i> 删除选中项目</a></span>
	<span class="l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius"  href="../project/deleteAll.do"><i class="Hui-iconfont"></i> 删除全部项目</a></span>
	</div>
	
	<div class="mt-20">
	
		<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
		  <table class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
			<thead>
				<tr class="text-c" role="row" >
					<th class="sorting_disabled" rowspan="1" colspan="1" aria-label="合同字母编号" style="width:71px;"><input type = "checkbox" name = "checkAll" id = "checkAll"></th>
					<th class="sorting_disabled" rowspan="1" colspan="1" aria-label="合同字母编号" style="width: 71px;">序号</th>
					<th class="sorting_desc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="descending" aria-label="合同数字编号: 升序排列" style="width: 271px;">项目名称</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="销售单号: 升序排列" style="width: 280px;">开始时间</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="集团: 升序排列" style="width:280px;">结束时间</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="最终用户: 升序排列" style="width: 140px;">项目创建者</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="客户: 升序排列" style="width: 280px;">备注</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="备件名称: 升序排列" style="width: 140px;">修改者</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="合同额: 升序排列" style="width: 280px;">修改时间</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="操作: 升序排列" style="width: 120px;">操作</th>
				</tr>
			</thead>
          <tbody>               
          	 <c:forEach items="${proList}" var="project" varStatus="stat">
	                <tr class="text-c odd" role="row">
	                  <td ><input type="checkbox" name="checkbox" id="${project.projectId}" /></td>
	                  <td >${stat.index+1}</td>
	                  <td >${project.projectName}</td>
	                  <td >${project.startTime} </td>
	                  <td >${project.endTime}</td>
	                  <td >${project.createUserId}</td>
	                  <td >${project.remark} </td>
	                  <td >${project.updateUser}</td>
	                  <td >${project.updateTime}</td>
	                  <td > <a title="编辑" href="javascript:;" onClick="projectUpdate('${project.projectId}')" style="text-decoration:none"><i class="Hui-iconfont"></i></a>
						  <a title="删除" href="javascript:;" onClick="deleteSelect('${project.projectId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a>
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

function projectAdd(){
	location.href = 'projectReady.do';
}

function projectUpdate(id){
	location.href = "projectUpdate.do?projectId="+id;
}

function deleteSelect(){
	var obj = document.getElementsByName("checkbox");
	var checkedId = ""; 
	for(i in obj){
		if(obj[i].checked)
			checkedId += obj[i].id+",";
	}
	checkedId = checkedId.substr(0,checkedId.length-1);
	location.href = "../project/deleteProject.do?projectId="+checkedId;
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