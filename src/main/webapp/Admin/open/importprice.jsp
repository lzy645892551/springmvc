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
            <td class="ybox11td8"></td>
            <td class="ybox11td6"><a href="#">3、导入价格</a></td>
            <td class="ybox11td7"></td>
            <td class="ybox11td2"><a href="#">4、引入折扣方案</a></td>
            <td class="ybox11td3"></td>
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
            <dt><strong>【注】</strong>1、点击"下载价格模板"，填写房间价格。<br />
　　　2、点击"导入价格明细"，导入房间价格。</dt>
          </dl>
        </div>
          <div class="ybox07 margb2">
            <dl>
              <table border="0" cellspacing="0" cellpadding="0" class="ybox07table">
                <tr align="left">
                  <td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_4.gif" /></td>
                  <td><a href="javascript:;" onclick="pageExportPlus()">下载价格模板</a></td>
                  <td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif" /></td>
                  <td class="ybox07td1"><img src="<%=basePath%>Admin/images/op4_5.gif" /></td>
                  <td><a href="#">导入价格明细</a></td>
                  <td class="ybox07td2"><img src="<%=basePath%>Admin/images/op4_0.gif"  /></td>
                </tr>
              </table>
            </dl>
          </div>
	          <form action="pageExport.do" id="form2"  method="post" >
				<input type="hidden" name="list" id="str"  />
			  </form>
          <table id="playlistTable" width="100%" border="0" cellpadding="0" cellspacing="1" class="ybox06table">
                <tr>
                	  <td class="ybox06td01"><input type="checkbox" name="dcheck" id="checkbox" /></td>
	                  <td width="30" class="ybox06td01">序号</td>
	                  <td class="ybox06td01">项目</td>
	                  <td class="ybox06td01">房间</td>
	                  
	                  <c:if test="${open.priceType == 1 }">
							<td class="ybox06td01">建筑面积</td>
					  </c:if>
					  <c:if test="${open.priceType == 2 }">
							<td class="ybox06td01">套内面积</td>
					  </c:if>
					  
	                  <td class="ybox06td01">计价方式</td>
	                  
					  <c:if test="${open.priceType == 1 }">
							<td class="ybox06td01">建筑面积单价</td>
					  </c:if>
					  <c:if test="${open.priceType == 2 }">
							<td class="ybox06td01">套内面积单价</td>
					  </c:if>
	                  
	                  <td class="ybox06td01">总价</td>
                </tr>
                
                <c:forEach items="${roomList }" var="room" varStatus="i">
				<tr>
					<td class="ybox06td03bcenter"><input type="checkbox" name="mcheck" id="checkbox"
					value="${room.roomId }" /></td>
					<td class="ybox06td03bcenter">${i.count }</td>
					<td class="ybox06td03bleft">${open.project.projectName }</td>
					<td class="ybox06td03bleft">${room.roomCode }</td>
					
						<c:if test="${open.priceType == 1 }">
								<td class="ybox06td03bcenter">${room.buildUpArea }</td>
						  </c:if>
						  <c:if test="${open.priceType == 2 }">
								<td class="ybox06td03bcenter">${room.innerArea }</td>
						</c:if>
					
						<c:if test="${open.priceType == 1 }">
							<td class="ybox06td03bcenter">建筑面积</td>
						</c:if>
						<c:if test="${open.priceType == 2 }">
							<td class="ybox06td03bcenter">套内面积</td>
						</c:if>
					
						<c:if test="${open.priceType == 1 }">
							<td class="ybox06td03bcenter">${room.unitPrice }</td>
						</c:if>
						<c:if test="${open.priceType == 2 }">
							<td class="ybox06td03bcenter">${room.innerPrice }</td>
						</c:if>
						
						<c:if test="${open.priceType == 1 }">
							<td class="ybox06td03bcenter">${room.unitPrice*room.buildUpArea }</td>
						</c:if>
						<c:if test="${open.priceType == 2 }">
							<td class="ybox06td03bcenter">${room.innerPrice*room.innerArea }</td>
						</c:if>
					
					
					
					
				</tr>
				</c:forEach>
				
				
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
        <td align="center"><a href="getdiscount.do"><img src="<%=basePath%>Admin/images/botton02.gif" width="95" height="34" /></a></td>
      </tr>
    </table>
  </div>
</div>
<script type="text/javascript">
function pageExport() {
				
				var j = 0;
				var arr = new Array();
				var selectarr = document.getElementsByName("mcheck");
				for (var i = 0; i < selectarr.length; i++) {
					if (selectarr[i].checked) {
						var id = selectarr[i].value;
		
						var unitId = id;
						var projectName = document.getElementById(id + "projectName").innerHTML;
						var buildName = document.getElementById(id + "buildName").innerHTML;
						var unitCode = document.getElementById(id + "unitCode").innerHTML;
						var roomCount = document.getElementById(id + "roomCount").innerHTML;
						var updateUser = document.getElementById(id + "updateUser").innerHTML;
						var updateTime = document.getElementById(id + "updateTime").innerHTML;
						
						var bean = new BjdBean(unitId, projectName, buildName, 
							unitCode, roomCount, updateUser, updateTime)
						arr[j] = bean;
						j++;
					}
				}
				document.getElementById("str").value = JSON.stringify(arr);
				document.getElementById("form2").submit();
			}
			function BjdBean(unitId, projectName, buildName, unitCode, roomCount, updateUser, updateTime) {
				this.unitId = unitId;
				this.projectName = projectName;
				this.buildName = buildName;
				this.unitCode = unitCode;
				this.roomCount = roomCount;
				this.updateUser = updateUser;
				this.updateTime = updateTime;
			}
			
			
function pageExportPlus() {
	var PayObj =  
        {  
          proName:"",    
          roomCode:"",  
          area:""  ,
          priceType:"",
          price:"",
          total:"",
        }
	var a = JSON.parse('{"title":"","data":[]}');

	 //封装底部表格中的数据
	var rows = document.getElementById("playlistTable").rows.length; //获得行数(包括thead)
	var colums = document.getElementById("playlistTable").rows[0].cells.length; //获得列数 
	
	  if(rows > 1){//
	    for (var i = 1; i < rows; i++) { //每行 从第二行开始因为第一行是表格的标题
	        var PayObj = new Object();//这里一定要new新的对象，要不然保存的都是一样的数据；都是最后一行的数据
	        //var priceType = document.getElementById("playlistTable").rows[i].cells[5].innerHTML;
	        
	        //公共数据
	        PayObj.proName = document.getElementById("playlistTable").rows[i].cells[2].innerHTML;
	        PayObj.roomCode = document.getElementById("playlistTable").rows[i].cells[3].innerHTML;
	        PayObj.area = document.getElementById("playlistTable").rows[i].cells[4].innerHTML;
	        PayObj.priceType = document.getElementById("playlistTable").rows[i].cells[5].innerHTML;
	        PayObj.price = document.getElementById("playlistTable").rows[i].cells[6].innerHTML;
	        PayObj.total = document.getElementById("playlistTable").rows[i].cells[7].innerHTML;
	    
	        a.data.push(PayObj);//向JSON数组添加JSON对象的方法；很关键
	      }
	
	      ///格式化数据
	     
	     document.getElementById("str").value = JSON.stringify(a);//这一行很关键
		 document.getElementById("form2").submit();
	
	     //异步提交数据
	
	      /* $.ajax({
             url: "${applicationScope.rootpath}contract/savePayOffInforOfAll.action",
             type: "post",
             data: {'param':obj},//参数
             datatype: "json",
             success: function (data) {
                 var obj = eval("(" + data + ")");
                 if (obj.success) {
                     mini.unmask();
                     alert(obj.message);
                     
                     location.reload();
                 }
                 else {
                     mini.unmask();
                     alert(obj.message);
                 }
             }
         }); */
	}
}
</script>
</body>
</html>
