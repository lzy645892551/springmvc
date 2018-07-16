<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.autocomplete {
	border: 1px solid #9ACCFB;
	background-color: white;
	text-align: left;
}

.autocomplete li {
	list-style-type: none;
}

.clickable {
	cursor: default;
}

.highlight {
	background-color: #9ACCFB;
}
</style>
<script type="text/javascript" src="../Admin/secondCSS/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//取得div层 
		var $search = $('#search');
		//取得输入框JQuery对象 
		var $searchInput = $search.find('#projectmanager1');
		//关闭浏览器提供给输入框的自动完成 
		$searchInput.attr('autocomplete', 'off');
		//创建自动完成的下拉列表，用于显示服务器返回的数据,插入在搜索按钮的后面，等显示的时候再调整位置 
		var $autocomplete = $('<div class="autocomplete"></div>')
			.hide()
			.insertAfter('#projectmanager1');
		//清空下拉列表的内容并且隐藏下拉列表区 
		var clear = function() {
			$autocomplete.empty().hide();
		};
		//注册事件，当输入框失去焦点的时候清空下拉列表并隐藏 
		$searchInput.blur(function() {
			setTimeout(clear, 500);
		});
		//下拉列表中高亮的项目的索引，当显示下拉列表项的时候，移动鼠标或者键盘的上下键就会移动高亮的项目，想百度搜索那样 
		var selectedItem = null;
		//timeout的ID 
		var timeoutid = null;
		//设置下拉项的高亮背景 
		var setSelectedItem = function(item) {
			//更新索引变量 
			selectedItem = item ;
			//按上下键是循环显示的，小于0就置成最大的值，大于最大值就置成0 
			if (selectedItem < 0) {
				selectedItem = $autocomplete.find('li').length - 1;
			} else if (selectedItem > $autocomplete.find('li').length - 1) {
				selectedItem = 0;
			}
			//首先移除其他列表项的高亮背景，然后再高亮当前索引的背景 
			$autocomplete.find('li').removeClass('highlight')
				.eq(selectedItem).addClass('highlight');
		};
		var ajax_request = function() {
			//ajax服务端通信 
			$.ajax({
				'url' : 'returnprojectmanager', //服务器的地址 
				'data' : {
					'projectmanager1' : $searchInput.val()
				}, //参数 
				'dataType' : 'json', //返回数据类型 
				'type' : 'POST', //请求类型 
				'success' : function(data) {
					if (data.length) {
						//遍历data，添加到自动完成区 
						$.each(data, function(index, term) {
							//创建li标签,添加到下拉列表中 
							$('<li></li>').text(term).appendTo($autocomplete)
								.addClass('clickable')
								.hover(function() {
									//下拉列表每一项的事件，鼠标移进去的操作 
									$(this).siblings().removeClass('highlight');
									$(this).addClass('highlight');
									selectedItem = index;
								}, function() {
									//下拉列表每一项的事件，鼠标离开的操作 
									$(this).removeClass('highlight');
									//当鼠标离开时索引置-1，当作标记 
									selectedItem = -1;
								})
								.click(function() {
									//鼠标单击下拉列表的这一项的话，就将这一项的值添加到输入框中 
									$searchInput.val(term);
									//清空并隐藏下拉列表 
									$autocomplete.empty().hide();
								});
						}); //事件注册完毕 
						//设置下拉列表的位置，然后显示下拉列表 
						var ypos = $searchInput.position().top;
						var xpos = $searchInput.position().left;
						$autocomplete.css('width', $searchInput.css('width'));
						$autocomplete.css({
							'position' : 'relative',
							'left' : xpos + "px",
							'top' : ypos + "px"
						});
						setSelectedItem(0);
						//显示下拉列表 
						$autocomplete.show();
					}
				}
			});
		};
		//对输入框进行事件注册 
		$searchInput
			.keyup(function(event) {
				//字母数字，退格，空格 
				if (event.keyCode > 40 || event.keyCode == 8 || event.keyCode == 32) {
					//首先删除下拉列表中的信息 
					$autocomplete.empty().hide();
					clearTimeout(timeoutid);
					timeoutid = setTimeout(ajax_request, 100);
				} else if (event.keyCode == 38) {
					//上 
					//selectedItem = -1 代表鼠标离开 
					if (selectedItem == -1) {
						setSelectedItem($autocomplete.find('li').length - 1);
					} else {
						//索引减1 
						setSelectedItem(selectedItem - 1);
					}
					event.preventDefault();
				} else if (event.keyCode == 40) {
					//下 
					//selectedItem = -1 代表鼠标离开 
					if (selectedItem == -1) {
						setSelectedItem(0);
					} else {
						//索引加1 
						setSelectedItem(selectedItem + 1);
					}
					event.preventDefault();
				}
			})
			.keypress(function(event) {
				//enter键 
				if (event.keyCode == 13) {
					//列表为空或者鼠标离开导致当前没有索引值 
					if ($autocomplete.find('li').length == 0 || selectedItem == -1) {
						return;
					}
					$searchInput.val($autocomplete.find('li').eq(selectedItem).text());
					$autocomplete.empty().hide();
					event.preventDefault();
				}
			})
			.keydown(function(event) {
				//esc键 
				if (event.keyCode == 27) {
					$autocomplete.empty().hide();
					event.preventDefault();
				}
			});
		//注册窗口大小改变的事件，重新调整下拉列表的位置 
		$(window).resize(function() {
			var ypos = $searchInput.position().top;
			var xpos = $searchInput.position().left;
			$autocomplete.css('width', $searchInput.css('width'));
			$autocomplete.css({
				'position' : 'relative',
				'left' : xpos + "px",
				'top' : ypos + "px"
			});
		});
	});
</script>
<!-- 类似百度搜索结束 -->

<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="Bookmark" href="http://localhost:8080/favicon.ico">
<link rel="Shortcut Icon" href="http://localhost:8080/favicon.ico">
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


<link rel="stylesheet" href="../Admin/secondCSS/layer.css"
	id="layui_layer_skinlayercss">
<link href="secondCSS/WdatePicker.css" rel="stylesheet" type="text/css">
</head>
<body>
	<article class="page-container">
		<form action="add.do" name="form" method="post"
			class="form form-horizontal" id="form-member-add">


			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>机会名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" style="width:350px;" value=""
						placeholder="" id="saleChanceName" name="saleChanceName">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>意向项目：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="input-text" style="width:350px;" id="projectId"
						name="projectId" onchange="getloudong()">
						<option value="">-------请选择-------</option>
						<c:forEach items="${lista}" var="dd">
							<option value="${dd.projectId}">${dd.projectName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>意向楼栋：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="input-text" style="width:350px;" id="buildId"
						name="buildId" onchange="getunit()">
						<option value="">-------请选择-------</option>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>意向单元：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="input-text" style="width:350px;" id="unitId"
						name="unitId" onchange="getroom()">
						<option value="">-------请选择-------</option>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>意向房间：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="input-text" style="width:350px;" id="roomId"
						name="roomId">
						<option value="">-------请选择-------</option>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>客户姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select class="input-text" style="width:350px;" id="customerName"
						name="customerName" onchange="gettel()">
						<option value="">-------请选择-------</option>
						<c:forEach items="${listf}" var="dd">
							<option value="${dd.customerName}">${dd.customerName}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>客户联系方式：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" style="width:350px;" value=""
						placeholder="" id="tel" name="tel">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">业务员编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" style="width:350px;" value=""
						placeholder="" id="number" name="number" onkeydown="getname()">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">业务员姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
						<select class="input-text" style="width:350px;" id="userName"
						name="userName" >
						<option value="">-------请选择-------</option>
						<c:forEach items="${list3}" var="dd">
							<option value="${dd.name}">${dd.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">描述：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" style="width:350px;" value=""
						placeholder="" id="intentionDescription"
						name="intentionDescription">
				</div>
			</div>

			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" id="send" onclick="sub()"
						value="  提交  ">
				</div>
			</div>

		</form>
	</article>

	<script type="text/javascript" src="../Admin/secondCSS/jquery.min.js"></script>
	<script type="text/javascript" src="../Admin/secondCSS/layer.js"></script>
	<script type="text/javascript" src="../Admin/secondCSS/laypage.js"></script>
	<script type="text/javascript"
		src="../Admin/secondCSS/jquery.icheck.min.js"></script>
	<script type="text/javascript" src="../Admin/secondCSS/WdatePicker.js"></script>
	<script type="text/javascript"
		src="../Admin/secondCSS/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="../Admin/secondCSS/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="../Admin/secondCSS/validate-methods.js"></script>
	<script type="text/javascript"
		src="../Admin/secondCSS/messages_zh.min.js"></script>
	<script type="text/javascript" src="../Admin/secondCSS/H-ui.js"></script>
	<a href="javascript:void(0)" class="Hui-iconfont toTop" title="返回顶部"
		alt="返回顶部" style="display:none"></a>
	<script type="text/javascript" src="../Admin/secondCSS/H-ui.admin.js"></script>
	<script type="text/javascript" src="../Admin/secondCSS/jquery-ui.css"></script>
	<script type="text/javascript" src="../Admin/secondCSS/jquery-ui.js"></script>

	<script type="text/javascript">
		function getname() {
			var number = document.getElementById("number").value;
			$.ajax({
				url : "../xiaoshou/selbynum.do",
				data : {
					"number" : number,
				},
				dataType : "text",
				type : "get",
				success : function(data) {
					document.getElementById("userName").value = data;
				},
				error : function() {}
			});
		}
		function gettel() {
			var customerName = document.getElementById("customerName").value;
			$.ajax({
				url : "../xiaoshou/seltel.do",
				data : {
					"customerName" : customerName,
				},
				dataType : "text",
				type : "get",
				success : function(data) {
					document.getElementById("tel").value = data;
				},
				error : function() {
					alert("cuo!")
				}
			});
		}
		function getroom() {
			var unitId = document.getElementById("unitId").value;
			$.ajax({
				url : "../xiaoshou/selroom.do",
				data : {
					"unitId" : unitId,
				},
				dataType : "text",
				type : "get",
				success : function(data) {
					var data2 = eval(data);
					$("#roomId option").remove();
					$("#roomId").append("<option value=''>-------请选择-------</option>");
					for (var i in data2) {
						var rid = data2[i].roomId;
						var rname = data2[i].roomCode;
						$("#roomId").append("<option value=" + rid + "> " + rname + " </option>");
					}
				},
				error : function() {
					alert("cuo!")
				}
			});
		}
		function getunit() {
			var buildId = document.getElementById("buildId").value;
			$.ajax({
				url : "../xiaoshou/selunit.do",
				data : {
					"buildId" : buildId,
				},
				dataType : "text",
				type : "get",
				success : function(data) {
					var data2 = eval(data);
					$("#unitId option").remove();
					$("#unitId").append("<option value=''>-------请选择-------</option>");
					for (var i in data2) {
						var uid = data2[i].unitId;
						var uname = data2[i].unitCode;
						$("#unitId").append("<option value=" + uid + "> " + uname + " </option>");
					}
				},
				error : function() {
					alert("cuo!")
				}
			});
		}
		function getloudong() {
			var projectId = document.getElementById("projectId").value;
			$.ajax({
				url : "../xiaoshou/selloudong.do",
				data : {
					"projectId" : projectId,
				},
				dataType : "text",
				type : "get",
	
				success : function(data) {
					var m = data.split("/");
					$("#buildId option").remove();
					$("#buildId").append("<option value=''>-------请选择-------</option>");
					for (var i in m) {
						var n = m[i].split(",");
						$("#buildId").append("<option value=" + n[1] + "> " + n[0] + " </option>");
					}
				},
				error : function() {}
			});
		}
		function zhekou() {
			var explains = document.getElementById("explains").value;
			var zhekou = 1 - explains / 100;
			document.getElementById("discount").value = zhekou;
		}
		function sub() {
			var saleChanceName = document.getElementById("saleChanceName").value;
			var projectId = document.getElementById("projectId").value;
			var buildId = document.getElementById("buildId").value;
			var unitId = document.getElementById("unitId").value;
			var roomId = document.getElementById("roomId").value;
			var customerName = document.getElementById("customerName").value;
			var tel = document.getElementById("tel").value;
			var number = document.getElementById("number").value;
			var userName = document.getElementById("userName").value;
			var intentionDescription = document.getElementById("intentionDescription").value;
			$.ajax({
				url : "../xiaoshou/add.do",
				data : {
					"saleChanceName" : saleChanceName,
					"projectId" : projectId,
					"buildId" : buildId,
					"unitId" : unitId,
					"roomId" : roomId,
					"customerName" : customerName,
					"tel" : tel,
					"number" : number,
					"userName" :  userName,
					"intentionDescription" :  intentionDescription,
				},
				dataType : "text",
				type : "post",
				success : function(data) {
					window.parent.location.reload();
				},
				error : function() {
					alert("有误");
				}
			});
	
		}
	
		function gradeChange() {
			var roomId = document.getElementById("sel").value;
			$.ajax({
				url : "selArea.do",
				data : {
					"roomId" : roomId,
				},
				dataType : "text",
				type : "get",
				success : function(data) {
					var m = data.split("/");
					var ze = m[0] * m[1];
					document.getElementById("area").value = m[0];
					document.getElementById("price").value = m[1];
					document.getElementById("ze").value = ze;
				},
				error : function() {}
			});
		}
	</script>
</body>
</html>