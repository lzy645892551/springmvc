<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>万达营销流程管理系统</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
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
        <td class="ybox10td1"><a href="#"><img src="images/op8_1.gif" width="28" height="54" /></a></td>
        <td><table border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td class="ybox11td1"></td>
            <td class="ybox11td2"><a href="#">1、填写基本信息</a></td>
            <td class="ybox11td8"></td>
            <td class="ybox11td6"><a href="#">2、选择房间</a></td>
            <td class="ybox11td7"></td>
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
        <td class="ybox10td1"><a href="#"><img src="images/op8_2.gif" width="28" height="54" /></a></td>
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
            <dt> <strong>【注】</strong>只能包含未开过盘的房间，系统将自动过滤。 </dt>
          </dl>
        </div>
          <div class="ybox07 margb2">
            
      <dl><table border="0" cellspacing="0" cellpadding="0" class="ybox07table">
              <tr align="left">
                <td class="ybox07td1"><img src="images/op4_1.gif" /></td>
                <td><a href="#">添加房间</a></td>
                <td class="ybox07td2"><img src="images/op4_0.gif" /></td>
                <td class="ybox07td1"><img src="images/op4_2.gif" /></td>
                <td><a href="#">移除选中房间</a></td>
                <td class="ybox07td2"><img src="images/op4_0.gif"  /></td>
                <td class="ybox07td1"><img src="images/op4_3.gif" /></td>
                <td><a href="#">移除所有房间</a></td>
                <td class="ybox07td2"><img src="images/op4_0.gif" /></td>
              </tr>
          </table></dl></div><table width="100%" border="0" cellpadding="0" cellspacing="1" class="ybox06table">
                <tr>
                  <td class="ybox06td01"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td width="30" class="ybox06td01">序号</td>
                  <td class="ybox06td01">项目</td>
                  <td class="ybox06td01">房间</td>
                  <td class="ybox06td01">建筑面积</td>
                  <td class="ybox06td01">套内面积</td>
                  <td class="ybox06td01">计价方式</td>
                  <td class="ybox06td01">建筑面积单价</td>
                  <td class="ybox06td01">套内面积单价</td>
                  <td class="ybox06td01">标准总价</td>
                </tr>
                <tr>
                  <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td02wcenter">1</td>
                  <td class="ybox06td02wleft">银川西夏万达广场 </td>
                  <td class="ybox06td02wleft">城市商业街-1-101 </td>
                  <td class="ybox06td02wcenter">162.74 </td>
                  <td class="ybox06td02wcenter">154.38 </td>
                  <td class="ybox06td02wcenter">建筑面积</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td03bcenter">2</td>
                  <td class="ybox06td03bleft">银川西夏万达广场 </td>
                  <td class="ybox06td03bleft">城市商业街-1-102</td>
                  <td class="ybox06td03bcenter">135.34</td>
                  <td class="ybox06td03bcenter">128.39</td>
                  <td class="ybox06td03bcenter">建筑面积</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td02wcenter">3</td>
                  <td class="ybox06td02wleft">银川西夏万达广场 </td>
                  <td class="ybox06td02wleft">城市商业街-1-103 </td>
                  <td class="ybox06td02wcenter">20.33</td>
                  <td class="ybox06td02wcenter">19.29</td>
                  <td class="ybox06td02wcenter">建筑面积</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td03bcenter">4</td>
                  <td class="ybox06td03bleft">银川西夏万达广场 </td>
                  <td class="ybox06td03bleft">城市商业街-1-104</td>
                  <td class="ybox06td03bcenter">94.26</td>
                  <td class="ybox06td03bcenter">89.42</td>
                  <td class="ybox06td03bcenter">建筑面积</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td02wcenter">5</td>
                  <td class="ybox06td02wleft">银川西夏万达广场 </td>
                  <td class="ybox06td02wleft">城市商业街-1-105 </td>
                  <td class="ybox06td02wcenter">98.48</td>
                  <td class="ybox06td02wcenter">93.42</td>
                  <td class="ybox06td02wcenter">建筑面积</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td03bcenter">6</td>
                  <td class="ybox06td03bleft">银川西夏万达广场 </td>
                  <td class="ybox06td03bleft">城市商业街-1-106</td>
                  <td class="ybox06td03bcenter">83.88</td>
                  <td class="ybox06td03bcenter">79.58</td>
                  <td class="ybox06td03bcenter">建筑面积</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td02wcenter">7</td>
                  <td class="ybox06td02wleft">银川西夏万达广场 </td>
                  <td class="ybox06td02wleft">城市商业街-1-107 </td>
                  <td class="ybox06td02wcenter">141.45</td>
                  <td class="ybox06td02wcenter">134.19</td>
                  <td class="ybox06td02wcenter">建筑面积</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td03bcenter">8</td>
                  <td class="ybox06td03bleft">银川西夏万达广场 </td>
                  <td class="ybox06td03bleft">城市商业街-1-108</td>
                  <td class="ybox06td03bcenter">31.87</td>
                  <td class="ybox06td03bcenter">30.23</td>
                  <td class="ybox06td03bcenter">建筑面积</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td02wcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td02wcenter">9</td>
                  <td class="ybox06td02wleft">银川西夏万达广场 </td>
                  <td class="ybox06td02wleft">城市商业街-1-109 </td>
                  <td class="ybox06td02wcenter">110.36</td>
                  <td class="ybox06td02wcenter">104.66</td>
                  <td class="ybox06td02wcenter">建筑面积</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                  <td class="ybox06td02wcenter">0.00</td>
                </tr>
                <tr>
                  <td class="ybox06td03bcenter"><input type="checkbox" name="checkbox" id="checkbox" /></td>
                  <td class="ybox06td03bcenter">10</td>
                  <td class="ybox06td03bleft">银川西夏万达广场 </td>
                  <td class="ybox06td03bleft">城市商业街-1-110</td>
                  <td class="ybox06td03bcenter">83.94</td>
                  <td class="ybox06td03bcenter">79.64</td>
                  <td class="ybox06td03bcenter">建筑面积</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
                  <td class="ybox06td03bcenter">0.00</td>
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
        <td height="60" align="center"><a href="#"><img src="images/botton01.gif" width="95" height="34" /></a></td>
        <td align="center"><a href="#"><img src="images/botton02.gif" width="95" height="34" /></a></td>
      </tr>
    </table>
  </div>
</div>
</body>
</html>
