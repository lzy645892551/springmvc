<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
	组织部门管理
</title><link href="Styles/css.css" rel="stylesheet" type="text/css" /><link href="../Styles/ts_css.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery.js" type="text/javascript"></script>
    <script src="Scripts/jquery.hotkeys.js" type="text/javascript"></script>
    <script src="Scripts/jstree/jquery.jstree.js" type="text/javascript"></script>
    <script src="Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script src="Scripts/OrganizationsManager.js" type="text/javascript"></script>
</head>
<body style="overflow-x: hidden; background: #EFF3FF; width: 100%">
    <form method="post" action="OrganizationsManager.htm" id="form1">

 
<script type="text/javascript"> 
    var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
    function openwin() {
        
         showModalDialog("OrganizationsUpdateManager.htm","example04","dialogWidth:850px;dialogHeight:300px;dialogLeft:200px;dialogTop:150px;center: yes;help:yes;resizable:yes;status:yes")
     }
    
</script>
 
 

     <div style="background: #EFF3FF; width: 22%; float: left; overflow-y: auto;">
    <div id="tree" class="tree" style="background: #EFF3FF;">
    </div>
    </div>
    <div style="width: 75%; float: left; border: 0px solid #82AFE8; padding: 5px;">
        <div>
            <table width="100%">
                <tr>
                    <td width="8%">
                        组织名称：
                    </td>
                    <td width="30%" >
                        <input name="txtName" type="text" id="txtName" style="width:95%;" />
                    </td>
                    <td width="10%" >
                    <input type="button"  value="  "style="border-style: none; border-color: inherit; border-width: 0px; background-image:url('Images/search.gif'); width:100px; height:24px;"/>
                    </td>
                    <td align="right">
                        <a href="toAddOrganization.do"><input name="btnAdd" type="button" id="btnAdd" class="button" value="添加"  /></a>
                    </td>
                </tr>
            </table>
        </div>
        <table width="100%" class="tablist">
            <thead id="tablistHer">
                <tr>
					<th width="10%">
                       组织编号
                    </th>
                    <th width="10%">
                       组织名称
                    </th>
                    <th width="10%">
                       组织地址
                    </th>
                    <th width="10%">
                        组织电话
                    </th>
                    <th width="9%">
                        修改人
                    </th>
                    <th width="10%">
                        修改时间               
                    </th>
                    <th width="9%">
                        删除人
                    </th>
                    <th width="10%">
                        删除时间
                    </th>
                    <th width="10%">
                        删除状态
                    </th>
                    <th width="">
                        操作
                    </th>
                </tr>
            </thead>
            
            <tbody id="tab">
             <c:forEach var="listOrganization" items="${listOrganization}">   
                        <tr>
                        	<td width="10%">
                                ${listOrganization.organizationId}
                            </td>
                            <td width="10%">
                                ${listOrganization.organizationName}
                            </td>
                            <td width="10%">
                                ${listOrganization.organizationAddress}
                            </td>
                            <td width="10%">
                                ${listOrganization.organizationTel}
                            </td>
                            <td width="9%">
                                ${listOrganization.updateUser}
                            </td>
                            <td width="10%">
                            	<fmt:formatDate value="${listOrganization.updateTime}" pattern="yyyy-MM-dd  HH:mm:ss" type="both"/>
                            </td>
                            <td width="9%">
                                ${listOrganization.deleteUser}
                            </td>
                            <td width="10%">
                            	<fmt:formatDate value="${listOrganization.deleteTime}" pattern="yyyy-MM-dd  HH:mm:ss" type="both"/>
                            </td>
                            <td width="10%">
                                ${listOrganization.deleteState}
                            </td>
                            <td width="">
                                <%-- <a href="javascript:void(0);" onclick="openwin(${listOrganization.organizationId})">修改</a>
                                <a>删除</a> --%>
                                <a href="toUpdateOrganization.do?organizationId=${listOrganization.organizationId}">修改</a>
                                <a href="javascript:void(0)" onclick="aa('${listOrganization.organizationId}')">删除</a>
                            </td>
                        </tr>
             </c:forEach>       
            </tbody>
        </table>
        
        <script>
	     	function aa(organizationId){
	     		if(confirm("确定删除吗?")){
	     			location.href="deleteOrganization.do?organizationId="+organizationId;
	     		}
	     	}
    	</script>
    	
        <script type="text/javascript">
<!--
            var Ptr = document.getElementById("tab").getElementsByTagName("tr");
            function pageLoad() {
                for (i = 1; i < Ptr.length + 1; i++) {
                    Ptr[i - 1].className = (i % 2 > 0) ? "t1" : "t2";
                }
            }
            window.onload = pageLoad;
            for (var i = 0; i < Ptr.length; i++) {
                Ptr[i].onmouseover = function () {
                    this.tmpClass = this.className;
                    this.className = "t3";

                };
                Ptr[i].onmouseout = function () {
                    this.className = this.tmpClass;
                };
            }
//-->
        </script>
      <div id="AspNetPager1" class="anpager" style="width:100%;text-align:left;">
         <div align="left" class="anpager" style="width:60%;float:left;">
	     <a disabled="disabled" style="margin-right:10px;">首页</a><a disabled="disabled" style="margin-right:10px;">上一页</a><span class="cpb" style="margin-right:10px;">1</span><a disabled="disabled" style="margin-right:10px;">下一页</a><a disabled="disabled" style="margin-right:10px;">尾页</a>
         </div>
         <div class="anpager" style="width:40%;float:left;">
	    记录总数：<font color="blue"><b>3</b></font> 总页数：<font color="blue"><b>1</b></font> 当前页：<font color="red"><b>1</b></font>
         </div>
      </div>
    </div>
    <input type="hidden" name="hidParentUuid" id="hidParentUuid" />
    <input type="hidden" name="hidUuid" id="hidUuid" />
    <input type="hidden" name="hidCookUuid" id="hidCookUuid" value="100002" />
    <input type="hidden" id="hidNamePath" />
    <input type="hidden" name="hidfromSubmit" value="1"/>
    </form>
</body>
</html>





