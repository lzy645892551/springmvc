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
            <td class="ybox11td8"></td>
            <td class="ybox11td6"><a href="#">4、引入折扣方案</a></td>
            <td class="ybox11td7"></td>
            <td class="ybox11td2"><a href="#">5、引入付款方式</a></td>
            <td class="ybox11td3"></td>
            <td class="ybox11td2"><a href="#">6、预览并提交</a></td>
            <td class="ybox11td4"></td>
          </tr>
        </table></td>
        <td class="ybox10td1"><a href="#"><img src="<%=basePath%>Admin/images/op8_2.gif" width="28" height="54" /></a></td>
      </tr>
    </table>
  </div>
  <div class="ybox02">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="margb4">
      <tr>
        <td class="ybox03td1"></td>
        <td class="ybox03td2"></td>
        <td class="ybox03td3"></td>
      </tr>
      <tr>
        <td class="ybox03td4"></td>
        <td class="ybox03td5"><div class="ybox05 margb8">
            <dl>
              <dt><strong>【注】</strong>1、包含本次开盘房间所能使用到的所有折扣。<br />
                　　　2、当计算方法是减点时，折扣率 = 折扣额度×预计使用比例。 <br />
                　　　　 当计算方法是打折时，折扣率 = （100 – 折扣额度）×预计使用比例。 <br />
                　　　　 当计算方法是总价优惠、单价优惠等时，须手工填写折扣率。 <br />
                　　　3、综合折扣率 = 100 - 折扣率合计。</dt>
            </dl>
          </div>
          <div class="ybox07 margb2">
            <dl>
              <table border="0" cellspacing="0" cellpadding="0" class="ybox07table">
                <tr align="left">
                  <td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_6.gif" /></td>
                  <td><a href="javascript:;" onclick="calculate()">引用折扣</a></td>
                  <td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
                  <td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_3.gif" /></td>
                  <td><a href="javascript:;" onclick="subtract()">移除选中折扣</a></td>
                  <td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif"  /></td>
                </tr>
              </table>
            </dl>
          </div>
          <table width="100%" border="0" cellpadding="0" cellspacing="1" class="ybox06table">
            <tr>
              <td width="40" class="ybox06td01"><input type="checkbox" name="checkbox2" id="checkbox" /></td>
               <td width="30" class="ybox06td01">序号</td>
              <td width="190" class="ybox06td01">折扣名称</td>
              <td width="90" class="ybox06td01">计算方法</td>
              <td width="100" class="ybox06td01">折扣额度(%)</td>
              <td width="90" class="ybox06td01">优惠金额</td>
              <td width="120" class="ybox06td01">预计使用比例(%)</td>
              <td width="90" class="ybox06td01">折扣率(%)</td>
              <td class="ybox06td01">折扣说明</td>
            </tr>
            <tr>
              <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox2" value="0.2" /></td>
              <td class="ybox06td02wcenter">1</td>
              <td class="ybox06td02wleft">特例折扣 </td>
              <td class="ybox06td02wcenter">减点</td>
              <td class="ybox06td02wcenter">0.20</td>
              <td class="ybox06td02wcenter">0.00</td>
              <td class="ybox06td02wcenter">100</td>
              <td class="ybox06td02wcenter">0.20</td>
              <td class="ybox06td02wleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox2" value="0.8" /></td>
              <td class="ybox06td03bcenter">2</td>
              <td class="ybox06td03bleft">按揭折扣</td>
              <td class="ybox06td03bcenter">打折</td>
              <td class="ybox06td03bcenter">99.00</td>
              <td class="ybox06td03bcenter">0.00</td>
              <td class="ybox06td03bcenter">80</td>
              <td class="ybox06td03bcenter">0.80</td>
              <td class="ybox06td03bleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox3" value="0.2" /></td>
              <td class="ybox06td02wcenter">3</td>
              <td class="ybox06td02wleft">按时签约 </td>
              <td class="ybox06td02wcenter">打折</td>
              <td class="ybox06td02wcenter">98.00</td>
              <td class="ybox06td02wcenter">0.00</td>
              <td class="ybox06td02wcenter">100</td>
              <td class="ybox06td02wcenter">0.20</td>
              <td class="ybox06td02wleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox" value="0.8" /></td>
              <td class="ybox06td03bcenter">4</td>
              <td class="ybox06td03bleft">开盘折扣（开盘七日内）</td>
              <td class="ybox06td03bcenter">打折</td>
              <td class="ybox06td03bcenter">98.00</td>
              <td class="ybox06td03bcenter">0.00</td>
              <td class="ybox06td03bcenter">80</td>
              <td class="ybox06td03bcenter">0.80</td>
              <td class="ybox06td03bleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox" value="0.2" /></td>
              <td class="ybox06td02wcenter">5</td>
              <td class="ybox06td02wleft">老带新</td>
              <td class="ybox06td02wcenter">打折</td>
              <td class="ybox06td02wcenter">98.00</td>
              <td class="ybox06td02wcenter">0.00</td>
              <td class="ybox06td02wcenter">100</td>
              <td class="ybox06td02wcenter">0.20</td>
              <td class="ybox06td02wleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox" value="0.8" /></td>
              <td class="ybox06td03bcenter">6</td>
              <td class="ybox06td03bleft">认筹折扣</td>
              <td class="ybox06td03bcenter">打折</td>
              <td class="ybox06td03bcenter">98.00</td>
              <td class="ybox06td03bcenter">0.00</td>
              <td class="ybox06td03bcenter">80</td>
              <td class="ybox06td03bcenter">0.80</td>
              <td class="ybox06td03bleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox" value="0.2" /></td>
              <td class="ybox06td02wcenter">7</td>
              <td class="ybox06td02wleft">特例折扣 </td>
              <td class="ybox06td02wcenter">打折</td>
              <td class="ybox06td02wcenter">97.00</td>
              <td class="ybox06td02wcenter">0.00</td>
              <td class="ybox06td02wcenter">100</td>
              <td class="ybox06td02wcenter">0.20</td>
              <td class="ybox06td02wleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox" value="0.8" /></td>
              <td class="ybox06td03bcenter">8</td>
              <td class="ybox06td03bleft">团购折扣</td>
              <td class="ybox06td03bcenter">打折</td>
              <td class="ybox06td03bcenter">98.00</td>
              <td class="ybox06td03bcenter">0.00</td>
              <td class="ybox06td03bcenter">80</td>
              <td class="ybox06td03bcenter">0.80</td>
              <td class="ybox06td03bleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox2" id="checkbox" value="0.2" /></td>
              <td class="ybox06td02wcenter">9</td>
              <td class="ybox06td02wleft">万达会 </td>
              <td class="ybox06td02wcenter">打折</td>
              <td class="ybox06td02wcenter">99.00</td>
              <td class="ybox06td02wcenter">0.00</td>
              <td class="ybox06td02wcenter">100</td>
              <td class="ybox06td02wcenter">0.20</td>
              <td class="ybox06td02wleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox2" id="checkbox" value="0.8" /></td>
              <td class="ybox06td03bcenter">10</td>
              <td class="ybox06td03bleft">一次性付款</td>
              <td class="ybox06td03bcenter">打折</td>
              <td class="ybox06td03bcenter">98.00</td>
              <td class="ybox06td03bcenter">0.00</td>
              <td class="ybox06td03bcenter">80</td>
              <td class="ybox06td03bcenter">0.80</td>
              <td class="ybox06td03bleft">&nbsp;</td>
            </tr>
            <tr>
              <td class="ybox06td04hui">&nbsp;</td>
              <td class="ybox06td04hui">&nbsp;</td>
              <td class="ybox06td04hui">&nbsp;</td>
              <td class="ybox06td04hui">&nbsp;</td>
              <td class="ybox06td04hui">&nbsp;</td>
              <td class="ybox06td04hui">&nbsp;</td>
              <td class="ybox06td04hui"><strong>折扣率合计</strong></td>
              <td class="ybox06td04hui" id="td1">0</td>
              <td class="ybox06td04hui">&nbsp;</td>
            </tr>
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
        <td align="center"><a href="javascript:;" onclick="jump()"><img src="<%=basePath%>Admin/images/botton02.gif" width="95" height="34" /></a></td>
      </tr>
    </table>
  </div>
</div>
<script type="text/javascript">
	function calculate() {
		obj = document.getElementsByName("checkbox2");
	    check_val = 0;
	    for(k in obj){
	        if(obj[k].checked)
	            check_val = check_val + parseFloat(obj[k].value);
	    }
		document.getElementById("td1").innerHTML=check_val.toFixed(2);
	}
	function subtract() {
		obj = document.getElementsByName("checkbox2");
	    check_val = parseFloat(document.getElementById("td1").innerHTML);
	    for(k in obj){
	        if(obj[k].checked)
	            check_val = check_val - parseFloat(obj[k].value);
	    }
		document.getElementById("td1").innerHTML=check_val.toFixed(2);
	}
	function jump() {
		discount = parseFloat(document.getElementById("td1").innerHTML);
		//alert(discount);
		if(discount != 0)
			location.href="getpay.do?discount="+discount;
		else 
			if(confirm("未引入折扣，确定继续吗？")){
				alert(discount);
				location.href="getpay.do?discount="+discount;
			}
	}
</script>
</body>
</html>
