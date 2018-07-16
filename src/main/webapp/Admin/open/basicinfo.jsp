<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>万达营销流程管理系统</title>
<link href="<%=basePath%>Admin/css/css.css" rel="stylesheet"
	type="text/css" />
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
<form action="<%=basePath%>open/chooseroom.do" id="form11">
	<div class="yboxwidth boxcenter">
		<div class="ybox09">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="ybox10td1"><a href="#"><img
							src="<%=basePath%>Admin/images/op8_1.gif" width="28" height="54" /></a></td>
					<td><table border="0" cellspacing="0" cellpadding="0">
							<tr valign="top">
								<td class="ybox11td5"></td>
								<td class="ybox11td6"><a href="#">1、填写基本信息</a></td>
								<td class="ybox11td7"></td>
								<td class="ybox11td2"><a href="#">2、选择房间</a></td>
								<td class="ybox11td3"></td>
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
									<strong>【注】</strong>1、综合折扣率 = 100 –
									折扣率合计（"4、引入折扣方案"中的折扣率合计），综合折扣率不能编辑，由"4、引入折扣方案"自动计算。<br />
									2、已售房间不参与调价：在"2、选择房产"里将不能选择已经认购或者签约的房间。 <br />
									已售房间参与调价：在"2、选择房产"里可以选择已经认购或者签约的房间。 <br />
									3、红色（*）号为必填字段，填完后方能进行下一步操作。
								</dt>
							</dl>
						</div>
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							class="ybox04table">
							<tr>
								<td width="15%" class="ybox04tdl"><span class="red">*</span>
									项目名称</td>
								<td width="18%" class="ybox04tdr">
								<select class="black12" id="project.projectId" name="project.projectId"
									style="width:180px;">
										<c:if test="${open != null}">
											<option value="${open.project.projectId }">${open.project.projectName}</option>
										</c:if>
										<c:forEach items="${prolist}" var="p">
											<option value="${p.projectId}">${p.projectName}</option>
										</c:forEach>
								</select></td>
								<td width="15%" class="ybox04tdl"><span class="red">*</span>
									报告名称</td>
								<td width="18%" class="ybox04tdr"><input
									style="width:180px;" id="openingReportName" name="openingReportName" value="" /></td>
								<td width="15%" class="ybox04tdl"><span class="red">*</span>
									报告类型</td>
								<td width="19%" class="ybox04tdr"><input name="reportType" id="reportType"
									type="text" class="black12" id="textfield2" style="width:90%;"
									value="开盘报告" /></td>
							</tr>
							<tr>
								<td class="ybox04tdl"><span class="red">*</span> 编制日期</td>
								<td class="ybox04tdr" name="updateTime"><input type="hidden" name="updateTime" value="${updatetime}" />
								<fmt:formatDate  value="${updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td class="ybox04tdl"><span class="red">*</span> 综合折扣率(%)</td>
								<td class="ybox04tdr">
								<input name="discount" id="discount" value="${open.discount }" readonly="readonly" /> </td>
								<td class="ybox04tdl"><span class="red">*</span> 特例折扣比例(%)</td>
								<td class="ybox04tdr">0.2</td>
							</tr>
							<tr>
								<td class="ybox04tdl"><span class="red">*</span> 开盘日期</td>
								<td class="ybox04tdr" name="openingReportTime"><input type="hidden" name="openingReportTime" value="${opentime}" />
								<fmt:formatDate value="${opentime}" pattern="yyyy-MM-dd 08:00:00"/></td>
								
								<td class="ybox04tdl"><span class="red">*</span> 决策文件项目分解版本</td>
								<td class="ybox04tdr"><input name="textfield" type="text" 
									class="black12" id="textfield" style="width:90%;"
									value="20121118第1版本" /></td>
								<td class="ybox04tdl">状态</td>
								<td class="ybox04tdr">
									<c:if test="${open == null }">待审核</c:if>
									<c:if test="${open != null }">
										${open.state }
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="ybox04tdl"><span class="red">*</span> 计价方式</td>
								<td colspan="5" class="ybox04tdr">
										<label> <input type="radio" 
											name="priceType" id="RadioGroup1" value="1" /> 建筑面积
										</label> &nbsp;&nbsp; 
										<label> <input type="radio"
											name="priceType" id="RadioGroup1" value="2" /> 套内面积
										</label> &nbsp;&nbsp; 
								</td>
							</tr>
							<!-- <tr>
								<td class="ybox04tdl"><span class="red">*</span> 价格标准</td>
								<td colspan="5" class="ybox04tdr"><form id="form1"
										name="form1" method="post" action="">
										<label> <input type="radio" name="RadioGroup1"
											id="RadioGroup1_0" /> 以建筑单价为准
										</label> &nbsp;&nbsp; <label> <input type="radio"
											name="RadioGroup1" id="RadioGroup1_1" /> 以套内单价为准
										</label> &nbsp;&nbsp; <label> <input type="radio"
											name="RadioGroup1" id="RadioGroup1_1" /> 以标准总价为准
										</label>
									</form></td>
							</tr> -->
							<tr>
								<td class="ybox04tdl"><span class="red">*</span> 已售房间</td>
								<td colspan="5" class="ybox04tdr">
										<label> <input type="radio" name="RadioGroup2"
											id="RadioGroup2" /> 不参与调价
										</label> &nbsp;&nbsp; <label> <input type="radio"
											name="RadioGroup2" id="RadioGroup2" /> 参与调价
										</label>
									
									</td>
								</tr>
								<tr>
									<td class="ybox04tdl"><span class="red">*</span> 蓄客情况分析</td>
									<td colspan="5" class="ybox04tdr"><textarea
											name="textarea" rows="6" class="black12" id="textarea"
											style="width:99.5%;">自2012年11月3日售楼处开放起开始蓄客，截止到2013年2月21日，累计有效客户173组，经过置业顾问回访、营销活动筛选，并详细梳理每位商铺客户，共确定AB类客户数量为15组。
开盘预计公开推出A区商铺全部未售房源单位，约151套房源，开盘预计去化55套（含涉及分层改造换签房源45套）。
                  </textarea></td></tr>
									<tr>
										<td class="ybox04tdl"><span class="red">*</span> 定金收取方案</td>
										<td colspan="5" class="ybox04tdr"><textarea
												name="textarea2" rows="6" class="black12" id="textarea2"
												style="width:99.5%;">认购金统一为10万元。
根据目前相关政策法规，付款方式暂定以下两种：
1、一次性付款
认购当日交10万元定金，7天内签订合同，付清全部房款。
2、按揭付款
认购当日交10万元定金，7天内签订合同，付清购房首付款，贷款首付和利率等以各银行规定为准。</textarea></td>
									</tr>
									<tr>
										<td class="ybox04tdl"><span class="red">*</span> 开盘报告说明</td>
										<td colspan="5" class="ybox04tdr">
											<textarea
												name="textarea3" rows="6" class="black12" id="openingReportDescription"
												style="width:99.5%;">
本次推出1#、2#、3#、4#、5#、6#分层改造后底商，共168套，销售总面积16193平米，总销售额30655万元，综合折扣率为92%，折实总价为28202万元。由于A区分层改造后有6套受到较大影响，商铺的其中一部分面积改为消防楼梯，销售面积减少351㎡，故与决策文件面积差生差异。
${open.openingReportDescription }
											</textarea></td>
									</tr>
						</table></td>
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
					<td height="60" align="center"><a href="javascript:;" onclick="subb()"><img
							src="<%=basePath%>Admin/images/botton02.gif" width="95"
							height="34" /></a></td>
							
					
				</tr>
				
			</table>
		</div>
	</div>
</form>
	
	<script type="text/javascript">
	 function subb(){
	 	document.getElementById("form11").submit();
	 	
	 }
	 function sub(){
		var project = document.getElementById("project.projectName").value;
		var openingReportName = document.getElementById("openingReportName").value;
		var reportType = document.getElementById("reportType").value;
		var updateTime = document.getElementById("updateTime").value;
		var discount = document.getElementById("discount").value;
		var opentime = document.getElementById("opentime").value;
		var priceType = document.getElementByName("RadioGroup1").value;
		
		for(var i=0; i < priceType.length; i++) {
			if (priceType[i].checked == true) { //得到选中的单选按钮状态（判断是否被选中）
            	alert(priceType[i].value + " 被选中"); //弹出选中单选按钮的值
				priceType = priceType[i];
			}
		}
	 	$.ajax({
				url : "chooseroom.do",
				data : {
					"openingReportName" : openingReportName,
					"project.projectId" : project,
					"reportType" : reportType,
					"updateTime" : updateTime,
					"discount" : discount,
					"opentime" : opentime,
					"priceType" : priceType,
				},
				dataType : "text",
				type : "post",
				success : function(data) {
					window.parent.location.reload(); 
				},
				error : function() {
					alert(2);
				}
			}); 
	} 
	</script>
</body>
</html>
