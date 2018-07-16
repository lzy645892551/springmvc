<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>项目添加管理</title>
    <base target="_self" />
    <link href="../Admin/Styles/css.css" rel="stylesheet" type="text/css" />
    <link href="../Admin/Styles/ts_css.css" rel="stylesheet" type="text/css" />
    <script src="../Admin/Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script src="../Admin/Scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="calendarJs/jquery-1.4.2.js"></script>
	<link rel="stylesheet" href="../Admin/calendarJs/jquery.datepick.css" type="text/css"></link>
	<script type="text/javascript" src="../Admin/calendarJs/jquery.datepick.js"></script>
	<script type="text/javascript" src="../Admin/calendarJs/jquery.datepick-zh-CN.js"></script>
    <script type="text/javascript" language="javascript">
	    $(document).ready(function(){
				//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
				$('#startTime').datepick({dateFormat: 'yy-mm-dd'}); 
				$('#endTime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
    
    	    
		$(document).ready(function(){  
		     var key=$("#selectUserName").val();
		     //根据值让option选中 
		     $("#txtLoginName option[value='"+key+"']").attr("selected","selected"); 
		}); 
    
    	function reback(){
    		location.href = "javascript:window.history.back(-1)";
    	}
    
        $(function () {
            if ($("#btnSubmit").val() == "提交") {
                if ($("#hidorganizationId").val() == "0") {
                    alert("请选择要添加的部门;window.close()");
                    return false;
                }
            }
            //            必填项验证
            //            $("#btnSubmit").click(function () {
            //                var pattern = new RegExp("[`~!@%#$^&*()=|{}':;',　\\[\\]<>/? \\.；：%……+￥（）【】‘”“'。，、？]");
            //                var firstName = $("#txtFirstName").val();
            //                if (firstName == "" || firstName == null) {
            //                    alert("请填写姓");
            //                    return false;
            //                }
            //                if (pattern.test(firstName)) {
            //                    alert("姓还有特殊字符");
            //                    return false;
            //                }
            //                if (firstName.length > 20) {
            //                    alert("姓输入长读不能超过25字符");
            //                    return false;
            //                }

            //                var lastName = $("#txtLastName").val();
            //                if (lastName == "" || lastName == null) {
            //                    alert("请填写名");
            //                    return false;
            //                }
            //                if (pattern.test(lastName)) {
            //                    alert("名中含有特殊字符");
            //                    return false;
            //                }
            //                if (lastName.length > 20) {
            //                    alert("名输入长度不能超过25个字符");
            //                    return false;
            //                }

            //                var loginName = $("#txtLoginName").val();
            //                if (loginName == "" || loginName == null) {
            //                    alert("请填写登录名");
            //                    return false;
            //                }
            //                if (pattern.test(loginName)) {
            //                    alert("登录名还有特殊字符");
            //                    return false;
            //                }

            //                if (!loginName.match(/^[a-zA-z0-9]*$/)) {
            //                    alert("登录名只能输入英文和数字");
            //                    return false;
            //                }
            //                if (loginName.length > 20) {
            //                    alert("登录名输入长度不能超过25给字符");
            //                    return false;
            //                }


            //                var password = $("#txtPassword").val();
            //                if ($("#btnSubmit").val() != "修改") {
            //                    if (password == "" || password == "") {
            //                        alert("请填写密码");
            //                        return false;
            //                    }
            //                }
            //                if (password.length > 0) {
            //                    if (password.length < 4 || password.length > 16) {
            //                        alert("密码长度必须在4-16个字符");
            //                        return false;
            //                    }
            //                }
            //                if (pattern.test(password)) {
            //                    alert("密码中还有特殊字符");
            //                    return false;
            //                }

            //                var mobilephone = $("#txtMobilePhone").val();
            //                if (mobilephone == "" || mobilephone == "") {
            //                    alert("请填写手机号码");
            //                    return false;
            //                }

            //                var patrn = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
            //                if (!patrn.exec(mobilephone)) {
            //                    alert("请填写正确的手机号码");
            //                    return false;
            //                }
            //                var email = $("#txtEmail").val();
            //                if (email == "" || email == null) {
            //                    alert("请填写Email地址");
            //                    return false;
            //                }
            //                var boemail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            //                if (!boemail.exec(email)) {
            //                    alert("请填写正确的邮箱地址");
            //                    return false;
            //                }
            //                var fax = $("#txtFax").val();
            //                if (fax.length > 0) {

            //                    var faxpatrn = /^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$/;
            //                    if (!faxpatrn.exec(fax)) {
            //                        alert("请输入正确的传真号码");
            //                        return false;
            //                    }
            //                }
            //                var telephone = $("#txtTelephone").val();
            //                if (telephone.length > 0) {
            //                    var partten = /^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$/;
            //                    if (!partten.test(telephone)) {
            //                        alert("请输入正确的固定电话号码");
            //                        return false;
            //                    }
            //                }
            //                var age = $("#txtAge").val();
            //                if (age.length > 0) {
            //                    var agepartten = /^[0-9]\d*$/;
            //                    if (!agepartten.exec(age)) {
            //                        alert("请输入正确的年龄");
            //                        return false;
            //                    }
            //                    if (age > 100 || age < 0) {
            //                        alert("请输入正确的年龄");
            //                        return false;
            //                    }
            //                }
            //                //邮政编码验证
            //                var PostCode = $("#txtPostCode").val();
            //                if (PostCode.length > 0) {
            //                    var patrn = /^[0-9]{6}$/;
            //                    if (!patrn.exec(PostCode)) {
            //                        alert("请输入正确的邮政编码");
            //                        return false;
            //                    }
            //                }
            //                var address = $("#txtAddress").val();
            //                if (address.length > 0) {
            //                    if (address.length > 200) {
            //                        alert("地址输入超过有限长度，最多200个字符");
            //                        return false;
            //                    }
            //                }
            //            });

        });
        function page_Close() {
            if (window.parent != null) {
                window.parent.close();
            }
            else {
                window.close();
            }
        }
    
</script>
        
</head>
<body>
    <form method="post" action="../project/projectAdd.do" id="form1">
    <input type = "hidden" name = "projectId" value = "${project.projectId}" />
    <input type = "hidden" name = "updateUser" value = "${name} " />
    <input type = "hidden" name = "selectUserName" value ="${project.createUserId}" id = "selectUserName"/>
    <div>
        <table border="0" cellpadding="2" cellspacing="2" class="table_list1">
            <tr height="80">
                <td width="10%" class="table_list1_style1">
                    <font class="red">*</font> 项目名称
                </td>
                <td width="20%" class="table_list1_style2">
                    <input name="projectName" type="text" value="${project.projectName}" maxlength="25" id="txtFirstName"
                        style="width: 90%;" />
                </td>
                 <td width="10%" class="table_list1_style1">
                    <font class="red">*</font> 项目负责人编号
                </td>
                <td width="20%" class="table_list1_style2">
                    <select name="createUserId"  maxlength="20" id="txtLoginName" style="width: 90%;" >
                    	<option value = "2">2</option>
                    	<option value = "1">1</option>
                    	<c:forEach items = "${userList}" var = "user">
                    		<option value = "${user.userId}">${user.userId}</option>
                    	</c:forEach>	
                    	
                    </select>
                </td>
            </tr>
            <tr height="80">
	                <td width="10%" class="table_list1_style1">
	                    <font class="red">*</font>开始时间
	                </td>
	                <td width="20%" class="table_list1_style2">
	                    <input name="startTime" type="text" value="${project.startTime}" maxlength="25" id="startTime"
	                        style="width: 90%;" />
	                </td>
	                <td width="10%"  class="table_list1_style1">
	                    <font class="red">*</font> 结束时间
	                </td>
	                <td width="20%" class="table_list1_style2">
	                     <input name="endTime" type="text" value="${project.endTime}" maxlength="25" id="endTime"
	                        style="width: 90%;" />
	                </td>
        	</tr>
            <tr height="80">
               
                <td width="10%" class="table_list1_style1">
                	    备注
                </td>
                <td colspan="5" width="20%" class="table_list1_style2">
                    <textarea name="remark" rows="2" cols="20" id="txtComment" style="width: 99%;">${project.remark}</textarea>
                </td>
            </tr>
        </table>
        <div  align="center">
            
                    <input type="submit" value = "提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
               
                     <input type="reset" value = "重置"/>&nbsp;&nbsp;&nbsp;&nbsp;
                
                     <input type="button" value = "取消" onclick = "reback()"/>
               
        </div>
    </div>
    <input type="hidden" name="hidorganizationId" id="hidorganizationId" />
    </form>
</body>
</html>
