<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
<link type="text/css" rel="stylesheet" href="scripts/pagekage/utils/widget/jqGrid/redmond/jquery-ui-1.8.2.custom.css"/>
<link type="text/css" rel="stylesheet" href="scripts/pagekage/utils/widget/jqGrid/ui.jqgrid.css"/> 
<script type="text/javascript" src="scripts/jquery-1.7.2.js"></script>
<script type="text/javascript" src="scripts/pagekage/utils/widget/jqGrid/jquery.jqGrid.src.js"></script>
<script type="text/javascript" src="scripts/pagekage/utils/widget/jqGrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="scripts/pagekage/utils/widget/jqGrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#list4").jqGrid({
        url:"http://localhost:8080/springmvc/select.do?pageSize=2&pageIndex=1&SearchSql=",
        datatype:"json", 
        mtype:"POST",
        height:420,
        //postData:"{pageSize:10,pageIndex:1,SearchSql:''}",
        autowidth:true,
       // colNames:['ID', '名称', 'qq','操作'],
       colNames:['ID', '名称','PASS'],
        colModel:[                 
{name:'id',index:'id', width:'20%',align:'center'},
{name:'name',index:'name', width:'35%', align:'center'},
{name:'password',index:'password', width:'45%', align:'center'}
//{name:'userName',index:'userName', width:'15%',align:'center'},
//{name:'QQ',index:'QQ', width:'20%', align:"center"},
//{name:'mobilePhone',index:'mobilePhone', width:'10%',align:"center", sortable:false}   
        ],
        rownumbers:true,
        //altRows:true,
        //sortname:'createDate',
        //sortorder:'asc',
        viewrecords: true,
        rowNum:2,
        rowList:[2,4,6],
        jsonReader:{
            id: "blackId",
            repeatitems : false
        },
        pager:$('#gridPager')
    });
});
</script>
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
         // alert("success:"+data.msg);  
    	   $("#list4").jqGrid('setGridParam',{ 
               datatype:'json', 
               postData:{'pageSize':10,'pageIndex':1,'Search':''}, // 发送数据   
               page:1 
           }).trigger("reloadGrid"); 
           
        }  
        });  
    }  
    function ajaxUpdate(){  
        $.ajax({  
        data:{name:escape($("#name").val()),password:$("#password").val()},  
        type:"GET",  
        dataType: 'json',  
         url:"update.do",  
         error:function(data){  
             alert("出错了！！:"+data.msg);  
         },  
        success:function(data){  
          // alert("success:"+data.msg);  
     	   $("#list4").jqGrid('setGridParam',{ 
                datatype:'json', 
                postData:{'pageSize':10,'pageIndex':1,'SearchSql':""}, // 发送数据   
                page:1 
            }).trigger("reloadGrid"); 
            
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
        	$("#list4").jqGrid('setGridParam',{ 
                datatype:'json', 
                postData:{'pageSize':10,'pageIndex':1,'SearchSql':""}, // 发送数据   
                page:1 
            }).trigger("reloadGrid"); 
          // alert("success:"+data.msg);  
            // $("#result").html(data.msg) ;  
         }  
         });  
     } 
    function ajaxdelete(){  
    	
        var id=$('#list4').jqGrid('getGridParam','selrow');
        if(id==null)
        	{
        	alert("请选择要删除的行");
        	return;
        	}
        var delname =$("#name").val();
        var rowData = $('#list4').jqGrid('getRowData',id);
        delname=rowData.name;


        $.ajax({  
        data: {name:delname},  
        type:"Post",  
        dataType: 'json',  
         url:"delete.do",  
         error:function(data){  
             alert("出错了！！");  
         },  
        success:function(data){  
        	$("#list4").jqGrid('setGridParam',{ 
                datatype:'json', 
                postData:{'pageSize':10,'pageIndex':1,'SearchSql':""}, // 发送数据   
                page:1 
            }).trigger("reloadGrid"); 
        	 //alert("success:"+data.msg);  
            // $("#result").html(data.msg) ;  
         }  
         });  
     } 
    function ajaxselect(){  
        /*$.ajax({  
        data: {pageSize:10,pageIndex:1,SearchSql:""},  
        type:"Post",  
        dataType: 'json',  
         url:"select.do",  
         error:function(data){  
             alert("出错了！！");  
         },  
        success:function(data){  
          // alert("success:"+data);  
            // $("#result").html(data[0]);
        }
        }); */
            if($("#name").val()!="" )
            	{
            	var SearchSql ="  where name like '%"+$("#name").val()+"%'";
        	$("#list4").jqGrid('setGridParam',{ 
                datatype:'json', 
                postData:{'Search':SearchSql,'pageSize':10,'pageIndex':1}, // 发送数据     //  where name like '%"+$("#name").val()+"%'
                page:1 
            }).trigger("reloadGrid"); 
            	}
            else {
            	$("#list4").jqGrid('setGridParam',{ 
                    datatype:'json'
                   // , postData:{'pageSize':10,'pageIndex':1,'Search':""}
            	//,  page:1 
                }).trigger("reloadGrid"); 
            }
     } 
</script> 
</head>
<body>
<input type="text" name="name" id ="name"/> <input type="password"	name="password" id ="password"/> 
	<input type="button" onclick="ajaxPost()"  value="添加"/>
	<input type="button" onclick="ajaxUpdate()"  value="修改"/>
	 <input type="button" onclick="ajaxdelete()"  value="删除"/> 
	    <input type="button" onclick="ajaxselect()"  value="查询"/>   

	    <div id ="result"></div>
<!-- jqGrid table list4 -->
	    <br/>
<table id="list4"></table>
<!-- jqGrid ��ҳ div gridPager -->
<div id="gridPager"></div>
<!-- {"page":"1","total":"2","records":"13",  
 "rows":[  
 {id:"1",cell:["1","polaris","男","polaris@gmail.com","772618379","18329382732","1985-10-2"]},  
 {id:"2",cell:["2","qw","女","zhangsan@163.com","272618382","15329382732","1986-10-12"]},  
 {id:"3",cell:["3","qwe","女","wangwu@yahoo.com","172635372","13329389832","1987-12-21"]},  
 {id:"4",cell:["4","qq","男","zhaoliu@sina.com","372618332","18929343731","1988-09-22"]}  
 ]  
 }  
 "rows":[  
 {id:"1",userName:"polaris",gender:"男",email:"polaris@gmail.com",QQ:"772618379",mobilePhone:"18329382732",birthday:"1985-10-2"]},  
 {id:"2",userName:"t",gender:"男",email:"xh.xu@163.com",QQ:"272618382",mobilePhone:"15329382732",birthday:"1986-10-12"]},  
 {id:"3",userName:"d",gender:"男",email:"wangwu@yahoo.com",QQ:"172635372",mobilePhone:"13329389832",birthday:"1987-12-21"]},  
 {id:"4",userName:"e",gender:"男",email:"zhaoliu@sina.com",QQ:"372618332",mobilePhone:"18929343731",birthday:"1988-09-22"]}  
 ]   -->

</body>
</html>