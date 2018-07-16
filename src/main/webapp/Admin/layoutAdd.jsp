<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- saved from url=(0047)http://localhost:8080/EMIS/contractinfo_add.jsp -->
<html><!-- 类似百度搜索 开始--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"> 
.autocomplete{ 
border: 1px solid #9ACCFB; 
background-color: white; 
text-align: left; 
} 
.autocomplete li{ 
list-style-type: none; 
} 
.clickable { 
cursor: default; 
} 
.highlight { 
background-color: #9ACCFB; 
} 
</style> 
<script type="text/javascript" src="../Admin/secondCSS/jquery.js"></script> 
<script type="text/javascript"> 


 function layoutAdd(){
 		var apartmentLayoutId = document.getElementById("apartmentLayoutId").value;
		var apartmentLayout = document.getElementById("apartmentLayout").value;
		var updateUser = document.getElementById("updateUser").value;
	 	$.ajax({
				url : "../layout/layoutAddOrUpdate.do",
				data : {
					"apartmentLayoutId":apartmentLayoutId,
					"apartmentLayout" : apartmentLayout,
					"updateUser":updateUser,
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



$(function(){ 
//取得div层 
var $search = $('#search'); 
//取得输入框JQuery对象 
var $searchInput = $search.find('#projectmanager1'); 
//关闭浏览器提供给输入框的自动完成 
$searchInput.attr('autocomplete','off'); 
//创建自动完成的下拉列表，用于显示服务器返回的数据,插入在搜索按钮的后面，等显示的时候再调整位置 
var $autocomplete = $('<div class="autocomplete"></div>') 
.hide() 
.insertAfter('#projectmanager1'); 
//清空下拉列表的内容并且隐藏下拉列表区 
var clear = function(){ 
$autocomplete.empty().hide(); 
}; 
//注册事件，当输入框失去焦点的时候清空下拉列表并隐藏 
$searchInput.blur(function(){ 
setTimeout(clear,500); 
}); 
//下拉列表中高亮的项目的索引，当显示下拉列表项的时候，移动鼠标或者键盘的上下键就会移动高亮的项目，想百度搜索那样 
var selectedItem = null; 
//timeout的ID 
var timeoutid = null; 
//设置下拉项的高亮背景 
var setSelectedItem = function(item){ 
//更新索引变量 
selectedItem = item ; 
//按上下键是循环显示的，小于0就置成最大的值，大于最大值就置成0 
if(selectedItem < 0){ 
selectedItem = $autocomplete.find('li').length - 1; 
} 
else if(selectedItem > $autocomplete.find('li').length-1 ) { 
selectedItem = 0; 
} 
//首先移除其他列表项的高亮背景，然后再高亮当前索引的背景 
$autocomplete.find('li').removeClass('highlight') 
.eq(selectedItem).addClass('highlight'); 
}; 
var ajax_request = function(){ 
//ajax服务端通信 
$.ajax({ 
'url':'returnprojectmanager', //服务器的地址 
'data':{'projectmanager1':$searchInput.val()}, //参数 
'dataType':'json', //返回数据类型 
'type':'POST', //请求类型 
'success':function(data){ 
if(data.length) { 
//遍历data，添加到自动完成区 
$.each(data, function(index,term) { 
//创建li标签,添加到下拉列表中 
$('<li></li>').text(term).appendTo($autocomplete) 
.addClass('clickable') 
.hover(function(){ 
//下拉列表每一项的事件，鼠标移进去的操作 
$(this).siblings().removeClass('highlight'); 
$(this).addClass('highlight'); 
selectedItem = index; 
},function(){ 
//下拉列表每一项的事件，鼠标离开的操作 
$(this).removeClass('highlight'); 
//当鼠标离开时索引置-1，当作标记 
selectedItem = -1; 
}) 
.click(function(){ 
//鼠标单击下拉列表的这一项的话，就将这一项的值添加到输入框中 
$searchInput.val(term); 
//清空并隐藏下拉列表 
$autocomplete.empty().hide(); 
}); 
});//事件注册完毕 
//设置下拉列表的位置，然后显示下拉列表 
var ypos = $searchInput.position().top; 
var xpos = $searchInput.position().left; 
$autocomplete.css('width',$searchInput.css('width')); 
$autocomplete.css({'position':'relative','left':xpos + "px",'top':ypos +"px"}); 
setSelectedItem(0); 
//显示下拉列表 
$autocomplete.show(); 
} 
} 
}); 
}; 
//对输入框进行事件注册 
$searchInput 
.keyup(function(event) { 
//字母数字，退格，空格 
if(event.keyCode > 40 || event.keyCode == 8 || event.keyCode ==32) { 
//首先删除下拉列表中的信息 
$autocomplete.empty().hide(); 
clearTimeout(timeoutid); 
timeoutid = setTimeout(ajax_request,100); 
} 
else if(event.keyCode == 38){ 
//上 
//selectedItem = -1 代表鼠标离开 
if(selectedItem == -1){ 
setSelectedItem($autocomplete.find('li').length-1); 
} 
else { 
//索引减1 
setSelectedItem(selectedItem - 1); 
} 
event.preventDefault(); 
} 
else if(event.keyCode == 40) { 
//下 
//selectedItem = -1 代表鼠标离开 
if(selectedItem == -1){ 
setSelectedItem(0); 
} 
else { 
//索引加1 
setSelectedItem(selectedItem + 1); 
} 
event.preventDefault(); 
} 
}) 
.keypress(function(event){ 
//enter键 
if(event.keyCode == 13) { 
//列表为空或者鼠标离开导致当前没有索引值 
if($autocomplete.find('li').length == 0 || selectedItem == -1) { 
return; 
} 
$searchInput.val($autocomplete.find('li').eq(selectedItem).text()); 
$autocomplete.empty().hide(); 
event.preventDefault(); 
} 
}) 
.keydown(function(event){ 
//esc键 
if(event.keyCode == 27 ) { 
$autocomplete.empty().hide(); 
event.preventDefault(); 
} 
}); 
//注册窗口大小改变的事件，重新调整下拉列表的位置 
$(window).resize(function() { 
var ypos = $searchInput.position().top; 
var xpos = $searchInput.position().left; 
$autocomplete.css('width',$searchInput.css('width')); 
$autocomplete.css({'position':'relative','left':xpos + "px",'top':ypos +"px"}); 
}); 
}); 
</script> 
<!-- 类似百度搜索结束 -->

<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="Bookmark" href="http://localhost:8080/favicon.ico">
<link rel="Shortcut Icon" href="http://localhost:8080/favicon.ico">
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/H-ui.min.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/H-ui.admin.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/iconfont.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/icheck.css">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/skin.css" id="skin">
<link rel="stylesheet" type="text/css" href="../Admin/secondCSS/style.css">
<title>添加销售合同基本信息</title>
<script type="text/javascript">
function test(){
	      var contractlet = document.getElementById('contractlet1').value;
		  if(contractlet ==""){
			 document.form.contractlet1.focus();
           return false; 
		  }
		   var contractnum = document.getElementById('contractnum').value;
		  if(contractnum ==""){
			 document.form.contractnum.focus();
           return false; 
		  }
		   var grouper = document.getElementById('grouper1').value;
		  if(grouper ==""){
			 document.form.grouper1.focus();
           return false; 
		  }
		  var purchaser = document.getElementById('purchaser1').value;
		  if(purchaser ==""){
			 document.form.purchaser1.focus();
           return false; 
		  }
		  var clientshort = document.getElementById('clientshort1').value;
		  if(clientshort ==""){
			 document.form.clientshort1.focus();
           return false; 
		  }
		  var client = document.getElementById('client1').value;
		  if(client ==""){
			 document.form.client1.focus();
           return false; 
		  }
		  var spare = document.getElementById('spare1').value;
		  if(spare ==""){
			 document.form.spare1.focus();
           return false; 
		  }
		  var contracttotal = document.getElementById('contracttotal1').value;
		  if(contracttotal ==""){
			 document.form.contracttotal1.focus();
           return false; 
		  }
		  var signdate = document.getElementById('signdate1').value;
		  if(signdate ==""){
			 document.form.signdate1.focus();
           return false; 
		  }
		  var projectmanager = document.getElementById('projectmanager1').value;
		  if(projectmanager ==""){
			 document.form.projectmanager1.focus();
           return false; 
		  }
		  var area = document.getElementById('selArea').value;
		  if(area ==""){
			 document.form.selArea.focus();
           return false; 
		  }var province = document.getElementById('selProvince').value;
		  if(province ==""){
			 document.form.selProvince.focus();
           return false; 
		  }
         return true;
}
</script>   

<link rel="stylesheet" href="../Admin/secondCSS/layer.css" id="layui_layer_skinlayercss"><link href="../Admin/secondCSS/WdatePicker.css" rel="stylesheet" type="text/css"></head><body>
<article class="page-container">
	<form action="layout/layoutAddOrUpdate.do" name="form" method="post" class="form form-horizontal" id="form-member-add" onSubmit="return test()">
		<input type = "hidden" id = "updateUser" name = "updateUser" value = "${name}">
		<input type = "hidden" id = "apartmentLayoutId" name = "apartmentLayoutId"  value="${layout.apartmentLayoutId}">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>户型管理：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" style="width:350px;" value="${layout.apartmentLayout }" placeholder="" id="apartmentLayout" name="apartmentLayout">
			</div>
		</div>
		
	
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<a href = "javascript:;" onclick = "layoutAdd()"  class="btn btn-primary radius"> 提交 </a>
			</div>
		</div>
	
	</form>
</article>

<script type="text/javascript" src="../Admin/secondCSS/jquery.min.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/layer.js"></script>
<script type="text/javascript" src="../Admin/secondCSS/laypage.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/jquery.icheck.min.js"></script>
<script type="text/javascript" src="../Admin/secondCSS/WdatePicker.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/jquery.validate.min.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/validate-methods.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/messages_zh.min.js"></script>
<script type="text/javascript" src="../Admin/secondCSS/H-ui.js"></script><a href="javascript:void(0)" class="Hui-iconfont toTop" title="返回顶部" alt="返回顶部" style="display:none"></a> 
<script type="text/javascript" src="../Admin/secondCSS/H-ui.admin.js"></script> 
<script type="text/javascript" src="../Admin/secondCSS/jquery-ui.css"></script>
<script type="text/javascript" src="../Admin/secondCSS/jquery-ui.js"></script>

<!--/_footer /ä½ä¸ºå¬å±æ¨¡çåç¦»åºå»--> 

 
<script type="text/javascript">
$(document).ready(function(){  
		     var key=$("#selectProjectId").val();
		     //根据值让option选中 
		     $("#projectId option[value='"+key+"']").attr("selected","selected"); 
		}); 

function changeProvince( ){  
      //获取用户选择的区域 
     var area=document.form.selArea.value;   
     var newOption0,newOption1,newOption2,newOption3,newOption4,newOption5,newOption6;  
     switch(area){  
         //根据用户选择的区域动态创建省份下拉列表  
       case  "华东" :  
            newOption0= new Option("-------请选择省份-------","");
            newOption1= new Option("山东","山东");  
            newOption2= new Option("江苏","江苏"); 
            newOption3= new Option("安徽","安徽");
            newOption4= new Option("浙江","浙江");
			newOption5= new Option("福建","福建");
			newOption6= new Option("上海","上海");
            break;  
       case "华南" : 
            newOption0= new Option("-------请选择省份-------","");  
            newOption1= new Option("广东","广东");  
            newOption2= new Option("广西","广西"); 
            newOption3= new Option("海南","海南"); 			
            break;  
       case "华中" : 
            newOption0= new Option("-------请选择省份-------","");  
            newOption1= new Option("湖北","湖北");  
            newOption2= new Option("湖南","湖南");
            newOption3= new Option("河南","河南");
            newOption4= new Option("江西","江西");		   
            break;  
       case "华北" : 
           newOption0= new Option("-------请选择省份-------","");  
           newOption1= new Option("北京","北京");  
           newOption2= new Option("天津","天津");
           newOption3= new Option("河北","河北");
           newOption4= new Option("山西","山西");
           newOption5= new Option("内蒙古","内蒙古");		   
            break;  	
       case "西北" : 
           newOption0= new Option("-------请选择省份-------",""); 
           newOption1= new Option("宁夏","宁夏");  
           newOption2= new Option("新疆","新疆");
           newOption3= new Option("青海","青海");
           newOption4= new Option("陕西","陕西");
           newOption5= new Option("甘肃","甘肃");		   
            break;  
       case "西南" : 
           newOption0= new Option("-------请选择省份-------","");  
           newOption1= new Option("四川","四川");  
           newOption2= new Option("云南","云南");
           newOption3= new Option("贵州","贵州");
           newOption4= new Option("西藏","西藏");
           newOption5= new Option("重庆","重庆");		   
            break;  
       case "东北" : 
           newOption0= new Option("-------请选择省份-------","");
           newOption1= new Option("辽宁","辽宁");  
           newOption2= new Option("吉林","吉林");
           newOption3= new Option("黑龙江","黑龙江");		   
            break;  
       case "港澳台" :   
           newOption0= new Option("-------请选择省份-------","");
           newOption1= new Option("香港","香港");  
           newOption2= new Option("澳门","澳门");
           newOption3= new Option("台湾","台湾");		   
            break;  			
      }  
      //清除原有选项  
     document.form.selProvince.options.length=0;  
     //将选项添加到选项数组  
     document.form.selProvince.options.add(newOption0);
     document.form.selProvince.options.add(newOption1);  
     document.form.selProvince.options.add(newOption2);  
	 document.form.selProvince.options.add(newOption3);
	 document.form.selProvince.options.add(newOption4);
	 document.form.selProvince.options.add(newOption5);
	 document.form.selProvince.options.add(newOption6);
  }  
$(function(){ 
        //文本框失去焦点后 
       $('form :input').blur(function(){ 
            var $parent = $(this).parent(); 
            $parent.find(".formtips").remove(); 
            //验证合同字母编号
            if( $(this).is('#contractlet1') ){ 
               if( this.value==""  ){ 
                     var errorMsg ='不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
            //验证合同数字编号 
            if( $(this).is('#buildName') ){ 
                 if( this.value==""){ 
                       var errorMsg = '不能为空.';
                       $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
                   }else{ 
                        check(this.value);
                   function check(contractnum){
              $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"contractdetailnumcheck",
            //提交的数据
            data:{contractnum:contractnum},
            //返回数据的格式
            datatype: "text",//"xml", "html", "script", "json", "jsonp", "text".
            //在请求之前调用的函数
            //beforeSend:function(){$("#msg").html("logining");},
            //成功返回之后调用的函数             
            success:function(data){
            if(data=="此合同编号不存在"){
            	$parent.append('<span class="formtips onSuccess" style="color:green"></span>');
            }else{
           		$parent.append('<span class="formtips onError" style="color:red">'+data+'</span>');
           		}            
            }  ,
            //调用执行后调用的函数
            complete: function(XMLHttpRequest, textStatus){
            },
            //调用出错执行的函数
            error: function(){
                //请求出错处理
            }         
         });}}} 
            //验证销售单号 
            if( $(this).is('#salesorder1') ){ 
               if( isNaN(this.value)==true ){ 
                     var errorMsg = '必须为数字.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else if(this.value.length!=0){ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
            //验证集团 
            if( $(this).is('#roomCount') ){ 
               if( this.value==""  ){ 
                     var errorMsg = '不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
            //验证采购方
            if( $(this).is('#purchaser1') ){ 
               if( this.value==""  ){ 
                     var errorMsg = '不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{  
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
            //验证最终用户
            if( $(this).is('#floorCount') ){ 
                   if(this.value==""){ 
                       var errorMsg = '不能为空.'; 
                       $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
                   }else{ 
                       //$parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
                   		check(this.value);
                   		//alert(return check(this.value));
                   		function check(clientshort1){
   $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"contractinfocheck",
            //提交的数据
            data:{clientshort1:clientshort1},
            //返回数据的格式
            datatype: "text",//"xml", "html", "script", "json", "jsonp", "text".
            //在请求之前调用的函数
            //beforeSend:function(){$("#msg").html("logining");},
            //成功返回之后调用的函数             
            success:function(data){
            if(data=="有该最终用户"){
            	$parent.append('<span class="formtips onSuccess" style="color:green"></span>');
            }else{
           		$parent.append('<span class="formtips onError" style="color:red">'+data+'</span>');
           		}            
            }   ,
            //调用执行后调用的函数
            complete: function(XMLHttpRequest, textStatus){
            },
            //调用出错执行的函数
            error: function(){
                //请求出错处理
            }         
         });

  }
                   } 
            } 
            //验证客户 
            if( $(this).is('#client1') ){ 
               if( this.value=="" ){ 
                     var errorMsg = '不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
             //验证备件名称 
            if( $(this).is('#spare1') ){ 
               if( this.value=="" ){ 
                     var errorMsg = '不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            }
            //验证合同总额 
            if( $(this).is('#contracttotal1') ){ 
               if( this.value==""){ 
                     var errorMsg = '不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else if( isNaN(this.value)==true ){ 
                     var errorMsg = '必须为数字.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
            
            //验证签订日期
            if( $(this).is('#signdate1') ){ 
               if( this.value==""  ){ 
                     var errorMsg = '日期不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }
               else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               }
            } 
             //验证项目经理
            if( $(this).is('#projectmanager1') ){ 
               if( this.value==""  ){ 
                     var errorMsg = '不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
             //验证区域
            if( $(this).is('#selArea') ){ 
               if( this.value==""  ){ 
                     var errorMsg = '区域不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
             //验证省份
            if( $(this).is('#selProvince') ){ 
               if( this.value==""  ){ 
                     var errorMsg = '省份不能为空.'; 
                     $parent.append('<span class="formtips onError" style="color:red">'+errorMsg+'</span>'); 
               }else{ 
                     $parent.append('<span class="formtips onSuccess" style="color:green"></span>'); 
               } 
            } 
       });
      // .keyup(function(){ 
      //    $(this).triggerHandler("blur"); 
      // }).focus(function(){ 
      //      $(this).triggerHandler("blur"); 
      // });//end blur 
 
        
       //提交，最终验证。 
        $('#send').click(function(){ 
               $("form :input.required").trigger('blur'); 
               var numError = $('form .onError').length; 
               if(numError!=0){ 
                   return false;   
		  }else{
		  return true;}
               
       
        }); 
 
      
})






</script>


</body></html>