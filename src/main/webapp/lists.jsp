<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="scripts/jquery-1.7.2.js"></script>  
<title>Insert title here</title>  
<script type="text/javascript">  
    function ajaxGet(){  
       $.ajax({  
       data:"name="+$("#name").val()+"&password="+$("#password").val(),  
       type:"GET",  
       dataType: 'json',  
        url:"update.do",  
        error:function(data){  
            alert("出错了！！:"+data.msg);  
        },  
       success:function(data){  
          alert("success:"+data.msg);  
            $("#result").html(data.msg) ;  
        }  
        });  
    }  
    function ajaxPost(){  
        $.ajax({  
        data: {name:$("#name").val(),password:$("#password").val()},  
        type:"Post",  
        dataType: 'json',  
         url:"/springmvc/add.do",  
         error:function(data){  
             alert("出错了！！");  
         },  
        success:function(data){  
           alert("success:"+data.msg);  
             $("#result").html(data.msg) ;  
         }  
         });  
     } 
    function ajaxdelete(){  
        $.ajax({  
        data: {name:$("#name").val()},  
        type:"Post",  
        dataType: 'json',  
         url:"delete.do",  
         error:function(data){  
             alert("出错了！！");  
         },  
        success:function(data){  
        	 alert("success:"+data.msg);  
             $("#result").html(data.msg) ;  
         }  
         });  
     } 
    function ajaxselect(){  
        $.ajax({  
        data: {pageSize:10,pageIndex:1,SearchSql:""},  
        type:"Post",  
        dataType: 'json',  
         url:"select.do",  
         error:function(data){  
             alert("出错了！！");  
         },  
        success:function(data){  
           alert("success:"+data);  
             $("#result").html(data[0]);  
         }  
         });  
     } 
</script> 
<!-- script type="text/javascript"> 
$(function() {   
    getjson();   
});   
function getjson() {   
    $.ajax( {   
        type : "get",   
        url : "json.do",   
        dataType:"json",   
        success : function(msg) {   
            alert("Data Saved: " + msg.name+"--"+msg.staffName);   
        }   
    });   
}   
</script>   -->
<title>登陆页面</title>
</head>
<body>
	<input type="text" name="name" id ="name"/> <input type="password"	name="password" id ="password"/> 
	<input type="button" onclick="ajaxPost()"  value="添加"/>
	<input type="button" onclick="ajaxGet()"  value="修改"/>
	 <input type="button" onclick="ajaxdelete()"  value="删除"/> 
	    <input type="button" onclick="ajaxselect()"  value="查询"/>   
	    <div id ="result"></div>
</body>
</html>