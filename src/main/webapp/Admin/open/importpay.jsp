<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
</script>
<script>
<!--
/*第一种形式 第二种形式 更换显示样式*/
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"hover":"";
con.style.display=i==cursel?"block":"none";
}
}
//-->
</script>
<link rel="stylesheet" href="<%=basePath%>Admin/secondCSS/layer.css" id="layui_layer_skinlayercss" />
</head>
<body>
<div class="yboxwidth boxcenter ybox01">
  <div class="ybox09">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="ybox10td1"><a href="#"><img src="<%=basePath%>Admin/images/op8_1.gif" width="28" height="54" /></a></td>
        <td><table border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td class="ybox11td1"></td>
            <td class="ybox11td2"><a href="#">1、填写基本信息</a></td>
            <td class="ybox11td3"></td>
            <td class="ybox11td2"><a href="#">2、选择房间</a></td>
            <td class="ybox11td3"></td>
            <td class="ybox11td2"><a href="#">3、导入价格</a></td>
            <td class="ybox11td3"></td>
            <td class="ybox11td2"><a href="#">4、引入折扣方案</a></td>
            <td class="ybox11td8"></td>
            <td class="ybox11td6"><a href="#">5、引入付款方式</a></td>
            <td class="ybox11td7"></td>
            <td class="ybox11td2"><a href="#">6、预览并提交</a></td>
            <td class="ybox11td4"></td>
          </tr>
        </table></td>
        <td class="ybox10td1"><a href="#"><img src="<%=basePath%>Admin/images/op8_2.gif" width="28" height="54" /></a></td>
      </tr>
    </table>
  </div>
  
  <div class="ybox02">
  <div class="ybox07 margb2">
            <dl>
              <table border="0" cellspacing="0" cellpadding="0" class="ybox07table">
                <tr align="left">
                  <td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_1.gif" /></td>
                  <td><a href="choosepay.do">选择支付方式</a></td>
                  <td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
                  <td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_5.gif" /></td>
                  <td><a href="javascript:;" onclick="delpay()" >移除选中支付方式</a></td>
                  <td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif"  /></td>
                </tr>
              </table>
            </dl>
          </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="margb4">
      <tr>
        <td class="ybox03td1"></td>
        <td class="ybox03td2"></td>
        <td class="ybox03td3"></td>
      </tr>
      <tr>
        <td class="ybox03td4"></td>
        <td class="ybox03td5"><table width="100%" border="0" cellpadding="0" cellspacing="1" class="ybox06table">
          <tr>
            <td width="50" class="ybox06td01"><input type="checkbox" name="checkbox" id="checkbox" /></td>
            <td width="30" class="ybox06td01">序号</td>
            <td class="ybox06td01">付款方式名称 </td>
            <td class="ybox06td01">查看</td>
            </tr>
            
          <c:forEach items="${openPayList }" var="payType" varStatus="i">
          	<tr>
	            <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox3" id="checkbox" value="${payType.payTypeId }" /></td>
	            <td class="ybox06td02wcenter">${i.count }</td>
	            <td class="ybox06td02wleft">${payType.payTypeName } </td>
	            <td class="ybox06td02wcenter"><a href="#">查看</a></td>
            </tr>
          </c:forEach>
          
          <!-- <tr>
            <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
            <td class="ybox06td02wcenter">1</td>
            <td class="ybox06td02wleft">一次性付款 </td>
            <td class="ybox06td02wcenter"><a href="#">查看</a></td>
            </tr>
          <tr>
            <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
            <td class="ybox06td03bcenter">2</td>
            <td class="ybox06td03bleft">银行按揭贷款 </td>
            <td class="ybox06td03bcenter"><a href="#">查看</a></td>
          </tr> -->
          </table>
          <div class="nums boxcenter black12"><a href="#" class="hovera">首 页</a><a href="#">上一页</a><a href="#">下一页</a><a href="#">尾 页</a>&nbsp;&nbsp;&nbsp;第1/3页&nbsp;&nbsp;&nbsp;每页&nbsp;
            <input name="textfield3" type="text" id="textfield" size="2"/>
  &nbsp;条/共25条&nbsp;&nbsp;转到&nbsp;
  <input name="textfield3" type="text" id="textfield" size="2"/>
  &nbsp;页<a href="#">跳 转</a></div></td>
        <td class="ybox03td6"></td>
      </tr>
      <tr>
        <td class="ybox03td7"></td>
        <td class="ybox03td8"></td>
        <td class="ybox03td9"></td>
      </tr>
    </table>
    <table width="380" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="60" align="center"><a href="javascript:history.go(-1)"><img src="<%=basePath%>Admin/images/botton01.gif" width="95" height="34" /></a></td>
        <td align="center"><a href="topreview.do"><img src="<%=basePath%>Admin/images/botton02.gif" width="95" height="34" /></a></td>
      </tr>
    </table>
  </div>
</div>
<script type="text/javascript" src="<%=basePath%>Admin/secondCSS/layer.js"></script>
<script type="text/javascript">
	function system_category_add(title, url, w, h) {
		layer_show(title, url, w, h);
	}
	function delpay() {
		var selectarr = document.getElementsByName("checkbox3");
		var ids = [];
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				ids[i] = id;
			}
		}
		
		alert(ids.length);
		if(ids.length > 0)
			location.href = "delpay.do?ids=" + ids;
		else
			alert("请选择要移除的内容！");
	}
</script>
</body>
</html>
