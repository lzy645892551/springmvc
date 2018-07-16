<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
</head>
<body style="background:#fff;">
<br />
<div style="width:900px;" class="tbox01 boxcenter">
  <div class="tbox02">
    <dl>
      <dt></dt>
      <dd>
        <div class="tbox02menu">
          <ul>
            <li><a href="#">取消</a></li>
            <li><a href="#">确定</a></li>
          </ul>
        </div>
      </dd>
    </dl>
  </div>
  <div class="tbox03">
    
    <div class="tbox04a">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="ybox06table">
        <tr>
          <td width="40" class="ybox06td01"><input type="checkbox" name="checkbox" id="checkbox" /></td>
          <td width="30" class="ybox06td01">序号</td>
          <td class="ybox06td01">付款方式名称 </td>
        </tr>
        
        <c:forEach items="${payList }" var="pay" varStatus="i">
	        <tr>
	          <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox3" id="checkbox" value="${pay.payTypeId }" /></td>
	          <td class="ybox06td02wcenter">${i.count }</td>
	          <td class="ybox06td02wleft">${pay.payTypeName } </td>
	        </tr>
        </c:forEach>
        
        <!-- <tr>
          <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox" /></td>
          <td class="ybox06td02wcenter">1</td>
          <td class="ybox06td02wleft">商铺按揭（定金50万） </td>
        </tr>
        <tr>
          <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox" /></td>
          <td class="ybox06td03bcenter">2</td>
          <td class="ybox06td03bleft">一次性97折（50万） </td>
        </tr>
        <tr>
          <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox" /></td>
          <td class="ybox06td02wcenter">3</td>
          <td class="ybox06td02wleft">一次性98折（定金30万） </td>
        </tr>
        <tr>
          <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox" /></td>
          <td class="ybox06td03bcenter">4</td>
          <td class="ybox06td03bleft">按揭（定金5万） </td>
        </tr>
        <tr>
          <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox" /></td>
          <td class="ybox06td02wcenter">5</td>
          <td class="ybox06td02wleft">一次性98折(50万) </td>
        </tr>
        <tr>
          <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox" /></td>
          <td class="ybox06td03bcenter">6</td>
          <td class="ybox06td03bleft">按揭</td>
        </tr> -->
      </table>
      <div class="nums boxcenter black12"><a href="#" class="hovera">首 页</a><a href="#">上一页</a><a href="#">下一页</a><a href="#">尾 页</a>&nbsp;&nbsp;&nbsp;第1/3页&nbsp;&nbsp;&nbsp;每页&nbsp;
        <input name="textfield3" type="text" id="textfield" size="2"/>
  &nbsp;条/共25条&nbsp;&nbsp;转到&nbsp;
  <input name="textfield3" type="text" id="textfield" size="2"/>
  &nbsp;页<a href="#">跳 转</a></div>
  <div>
  	<a href="javascript:;" onclick="subb()"><img
							src="<%=basePath%>Admin/images/button_tj.gif" width="95"
							height="34" /></a>
  </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	function subb() {
		var selectarr = document.getElementsByName("checkbox3");
		var ids = [];
		for (var i = 0; i < selectarr.length; i++) {
			if (selectarr[i].checked) {
				var id = selectarr[i].value;
				ids[i] = id;
			}
		}
		location.href = "addpay.do?ids=" + ids;
	}
</script>
</body>
</html>

