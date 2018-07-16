<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String xm = this.getServletContext().getInitParameter("path");
	String path1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+xm;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head>
<title>客户信息列表</title>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<%=path1%>/qt/yjs/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=path1%>/qt/yjs/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="<%=path1%>/qt/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path1%>/qt/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path1%>/qt/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path1%>/qt/css/component.css" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="<%=path1%>/scripts/pagekage/utils/widget/jqGrid/redmond/jquery-ui-1.8.2.custom.css" />
<link type="text/css" rel="stylesheet"
	href="<%=path1%>/scripts/pagekage/utils/widget/jqGrid/ui.jqgrid.css" />

<script type="text/javascript"
	src="<%=path1%>/scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=path1%>/scripts/pagekage/utils/widget/jqGrid/jquery.jqGrid.src.js"></script>
<script type="text/javascript"
	src="<%=path1%>/scripts/pagekage/utils/widget/jqGrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript"
	src="<%=path1%>/scripts/pagekage/utils/widget/jqGrid/jquery.jqGrid.min.js"></script>
<link rel="stylesheet" href="<%=path1%>/qt/ycss/bootstrap.min.css" />

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="<%=path1%>/qt/ycss/bootstrap-theme.min.css" />
<script type="text/javascript">
   function ajaxUpdate123(){
           var tfloor = $("#tunit_number").val();  //楼层数
           var  tunit_number= $("#tfloor").val();   //单元数
           if(tunit_number>2){
           $("#list4").attr("width","100%");
           }
           var $table = $("#lift");
           
           var tr="";
           for(var i=0;i<tunit_number;i++){
        	   tr=tr+"<tr ><td width='200px'> <input style='width:100%' value="+(i+1)+" type='text'  name='floor_number'></td></tr>";
           }
           $table.append($(tr));
           
           for(var a=0;a<tfloor;a++){
        	   $("#list4 tr:first").append("<td><input style='width: 100%' value="+String.fromCharCode(65+a)+" type='text' name='unit'/></td>");
        	   $("#list4 tr:gt(0)").append("<td><input style='width: 100%' type='text' value='2' name='hushu'/></td>");
           }
          
           $('#myModal').modal('hide');   
        
  } 
	function sendMassage(m) {
		  var floor_numbers = document.getElementsByName("floor_number");
		  var haoma = document.getElementsByName("haoma");
	    	var val = $("#lift tr").eq(m).children('td').each(function(){
	    	   $(this).children('span').eq(1).text(floor_numbers[m].value);
	    	  });
	    	var $trList = $("#lift");
	    	$trList.attr("width","100%");
	} 
	function sendMassageRow(h) {
		var row = "#row"+h;
		var va = $(row);
		var a=0;
	    $("#lift tr").each(function(){
	    	  $(this).children('td').eq(h+2).children("span").eq(2).text(va.val());
	     });
	    	var $trList = $("#lift");
	    	$trList.attr("cellpadding",0);
	} 
	
</script>
<script type="text/javascript">
function unique(arr) {
	  var result = [], hash = {};
	  for (var i = 0, elem; (elem = arr[i]) != null; i++) {
	    if (!hash[elem]) {
	      result.push(elem);
	      hash[elem] = true;
	    }
	  }
	  return result;
	}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
           
    return currentdate;
}
var right;
$(document).ready(function(){
	var SeachSql;
	var id;
    var str=window.location.href; //得到listclient的地址
    //alert("str"+str);
    var es=/id=/; 
    es.exec(str); //得到地址后面变量名称
    //alert("es--"+es.exec(str));
     right=RegExp.rightContext;//得到地址后面变量名称的值
    //alert("right-"+right);3
     
	  var SearchSql ="GROUP BY w.order_type,p.pay_type_name,customer_name";
			 $.ajax({
				 url:"../qt/build/selectById.do",
				 data:{'id':right},
				 success:function(data){
				 $('#myModal').modal('show');
				 }
			 });
			 
			 
/* 	var huxing = $("#huxing");
	 $.ajax({
		 url:"../qt/build/selectApartmentLayoutBySql.do",
		 data:{'id':right},
		 success:function(data){
		    for(var i =0;data.length;i++){
		   	huxing.append("<option value='"+data.rows[i].apartment_layout_id+"'>"+data.rows[i].apartment_layout+"</option>");
		    }
		 }
	 }); */
	
});

function ajaxDelete(n) {
	var trs = $("#lift tr");
	if (n == '全部') {
		for (var i = 0; i < trs.length; i++) {
			var data = trs.eq(i).children();
			for (var j = 2; j < data.length; j++) {
				console.log($(data[j]).text());
				$(data[j]).find("input").remove();
					$(data[j]).append("<input type='checkbox' checked = true name='resour'>");
			}

		}
	} else if (n == '清空') {
		for (var i = 0; i < trs.length; i++) {
			var data = trs.eq(i).children();
			for (var j = 2; j < data.length; j++) {
				console.log($(data[j]).text());
				$(data[j]).find("input").remove();
					$(data[j]).append("<input type='checkbox' name='resour'>");
			}

		}
	} else {
		for (var i = 0; i < trs.length; i++) {
			var data = trs.eq(i).children();
			for (var j = 2; j < data.length; j++) {
				console.log($(data[j]).text());
				$(data[j]).find("input").remove();
				if (n == $(data[j]).text()) {
					$(data[j]).append("<input type='checkbox' checked = true name='resour'>");
				} else {
					$(data[j]).append("<input type='checkbox' name='resour'>");
				}

			}

		}
	}
}
function util(){
	var haoma = document.getElementsByName('haoma');
	for(var x=0 ;x<haoma.length;x++){
        if((haoma[x].value).length>1){
        	 haoma[x].value = haoma[x].value.substring(0,1);
        }			
}
	var floor_number = document.getElementsByName('floor_number');
	for(var y=0 ;y<floor_number.length;y++){
        if((floor_number[y].value).length>1){
        	floor_number[y].value = floor_number[y].value.substring(0,1);
        }			
}
}
function ajaxNumber(n) {
	var trs = $("#lift tr");
	if (n == '楼层+号码') {
		//util();
		for (var i = 0; i < trs.length; i++) {
			var data = trs.eq(i).children();
			for (var j = 2; j < data.length; j++) {
			$(data[j]).children('span').eq(0).hide();
			$(data[j]).children('span').eq(1).remove('span');
			$(data[j]).children('span').eq(2).remove('span');
			$(data[j]).children('span').eq(1).remove('span');
			$(data[j]).append("<span >"+(i+1)+"</span><span>"+(j-1)+"</span>");
			}
		
		}
	} else if (n == '号码+楼层') {
		//util();
		for (var i = 0; i < trs.length; i++) {
			var data = trs.eq(i).children();
			for (var j = 2; j < data.length; j++) {
			$(data[j]).children('span').eq(0).hide();
			$(data[j]).children('span').eq(1).remove('span');
			$(data[j]).children('span').eq(2).remove('span');
			$(data[j]).children('span').eq(1).remove('span');
			$(data[j]).append("<span>"+(j-1)+"</span><span >"+(i+1)+"</span>");
			}
		
		}
	} else {
		for (var i = 0; i < trs.length; i++) {
			var data = trs.eq(i).children();
			for (var j = 2; j < data.length; j++) {
				console.log($(data[j]).text());
				$(data[j]).find("input").remove();
				if (n == $(data[j]).text()) {
					$(data[j]).append("<input type='checkbox' checked = true name='resour'>");
				} else {
					$(data[j]).append("<input type='checkbox' name='resour'>");
				}

			}

		}
	}
}
</script>
<script type="text/javascript">  
    function ajaxInsert(){ 
    	var hushus = document.getElementsByName("hushu");
    	var unit = document.getElementsByName("unit");
    	var  tunit_number= $("#tfloor").val();   //单元数
    	var $list4 = $("#list4");
    	var haoma=0;
    	var haomatr="<tr><td>号码</td>";
    	var huxing = "<tr><td>户型</td>";
    	var $trList = $("#lift");
    	$trList.attr("width","100%");
       //修改单元是不一致
    	for(var b=0;b<hushus.length;b++){
    		var huval = hushus[b].value;
    		haoma = haoma+(parseInt(hushus[b].value));
    	}
    	for(var u=0;u<unit.length;u++){
    		$(unit[u]).parent().attr("colspan",hushus[u].value);
    	}
    
    	for(var h=0;h<haoma;h++){
    		haomatr = haomatr +"<td><input  type='text'  value="+(h+1)+" id=row"+h+" oninput=sendMassageRow("+h+") style='width: 100%' name='haoma'></td>"
    		huxing = huxing +"<td><select  style='width: 100%'  onchange='ajaxSelect(this.options[this.options.selectedIndex].text,"+(h+2)+")'><option value='两房两厅'>两房两厅</option><option value='三房两厅'>三房两厅</option><option value='三房一厅'>三房一厅</option></select></td>"
        
    	}
    	haomatr = haomatr+"</tr>";
    	$("#lift").empty();
        for (var i=0; i<tunit_number; i++) {
        	
         	var rowdan="<tr><td width='16.6%'> <input style='width:100%;height:100%' value="+(i+1)+" type='text' oninput=sendMassage("+i+") name='floor_number' ></td>";
         	for(var j=0;j < parseInt(haoma)+1; j++){
            	if(j==0){
        	       rowdan =rowdan+"<td  width='8.27%'><select  style='width: 100%'  onchange='ajaxSelectrow(this.options[this.options.selectedIndex].text,"+(i)+")'><option value='两房两厅'>两房两厅</option><option value='三房两厅'>三房两厅</option><option value='三房一厅'>三房一厅</option></select></td>";	
        		}else{
        			rowdan = rowdan+"<td width='"+(935/parseInt(haoma))+"px'><span>两房两厅</span></td>";	
        		}
            	
               }      
        	  rowdan =rowdan+"</tr>";	
        	$trList.append($(rowdan));
    	}
        var hushurow = $("#rowhushu").remove();;
    	  $list4.append($(haomatr));
    	  $list4.append($(huxing));
     } 
    function ajaxSelect(v,n){  
    	var str = "<span >"+v+"</span>"
    	 var te = "<input type='checkbox' checked='true' name='resour'>";
     	$("#lift tr").each(function(){
          var data = $(this).children('td').eq(n)
          for(var i =0;i<data.length;i++){
        	  if(data[i].lastChild.type=="checkbox"){
        		  if(data[i].lastChild.checked==true){
        		  $(data).eq(i).html(str);
                  $(data).eq(i).append($(te));
        		  }
        	  }else{
        		  $(data).eq(i).html(str);
        	  }
          }
        
        });
    } 
</script>
<script type="text/javascript">
    function ajaxSelectrow(v,m){
      var str = "<span >"+v+"</span>"
     	var $datalen = $("#lift tr").eq(m).children('td');
        var te = "<input type='checkbox' checked='true' name='resour'>";
     	for(var i=2;i<$datalen.size();i++){
     		if($datalen[i].lastChild.type=="checkbox"){
     		if($datalen[i].lastChild.checked==true){
     			$datalen.eq(i).html(str);
     	    	$datalen.eq(i).append($(te));
     			  }
     		}else{
     			$datalen.eq(i).html(str);
     		}
        	
     	}
    }
    function arrayToJson(o) {
        var r = [];
        if (typeof o == "string") return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
        if (typeof o == "object") {
          if (!o.sort) {
            for (var i in o)
              r.push(i + ":" + arrayToJson(o[i]));
            if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
              r.push("toString:" + o.toString.toString());
            }
            r = "{" + r.join() + "}";
          } else {
            for (var i = 0; i < o.length; i++) {
              r.push(arrayToJson(o[i]));
            }
            r = "[" + r.join() + "]";
          }
          return r;
        }
        return o.toString();
      }
   function roomBase (){
	
		
		var trs = $("#lift tr");
		var trslist = $("#list4 tr").eq(0).children();
		var buildarr=new Array(trslist.size()+1);
		var abc;
		for(var x=0;x<trslist.size();x++){
			var colspanval = trslist.eq(x).attr('colspan');
			for(var y=0;y<colspanval;y++){
				abc++
				buildarr.push(trslist.eq(x).children().val());
			}
		}
		var aabbba=null;
		
		var arr=new Array();
		for (var i = 0; i < trs.length; i++) {
			var object = new Object();  
			var data = trs.eq(i).children();			
				for (var j = 2; j < data.length; j++) {
					var huxing = $(data[j]).children('span').eq(0).text();
					var f1 = $(data[j]).children('span').eq(1).text();
					var f2 = $(data[j]).children('span').eq(2).text();
					var number= f1+""+f2;
					object.huxing=huxing;
					object.number=number;
					object.lid=right;
					object.unit = buildarr[j-2];
					object.floor=i;
					arr.push(object);
				}
				
				
		}
		 $.ajax({
			// url:"../qt/build/addRoomredis.do",
			 url:"../qt/build/mysql/addRoomredis.do",
			  type:"POST",
		      dataType: "json",
		      contentType:"application/json",
		      data:JSON.stringify(arr),
			 success:function(data){
				 window.location.href='../ht/selectAll';
			 }
		 });
			
   } 
    
</script>
</head>
<body>
	<div id="gridPager"></div>
	<div class="yboxwidth boxcenter ybox01" style="width: 100%">
		<div class="ybox09" style="width: 110%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td style="padding-left: 30px">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr valign="top">
								<td class="ybox11td5"></td>
								<td class="ybox11td6" style="width:100%">生成房间</td>
								<td class="ybox11td7"></td>
								<td class="ybox11td2"></td>
								<td class="ybox11td3"></td>
								<td class="ybox11td2"></td>
								<td class="ybox11td3"></td>
								<td class="ybox11td2"></td>
								<td class="ybox11td4"></td>
								<td class="ybox11td4"></td>
								<td class="ybox11td4"></td>
								<td class="ybox11td4"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

		<div class="ybox02" style="width:110%">
			<table width="1235px" border="0" cellspacing="0" cellpadding="0"
				class="margb4">
				<tr>
					<td class="ybox03td1"></td>
					<td class="ybox03td2"></td>
					<td class="ybox03td3"></td>
				</tr>
				<tr>
					<td class="ybox03td4"></td>
					<td class="ybox03td5">

						<div class="ybox07 margb2">

							<dl>
								<table border="0" cellspacing="0" cellpadding="0"
									class="ybox07table" width="100%">
									<tr align="left">
										<td class="ybox07td1"><img src="images/op4_1.gif" /></td>
										<td><span style="cursor: pointer;" onclick="ajaxInsert()">生成房间</span></td>
										<td class="ybox07td2" width="10px"><img
											src="images/op4_0.gif" /></td>
										<td class="ybox07td1"><img src="images/op4_3.gif" /></td>
										<td><span style="cursor: pointer;">户型&nbsp;&nbsp;<select id="huxing"
												onchange="ajaxDelete(this.options[this.options.selectedIndex].text)">
													  <option value='清空'>清空</option>
													<option value='全部'>全部</option>
													<option value='两房两厅'>两房两厅</option>
													<option value='三房两厅'>三房两厅</option>
													<option value='三房一厅'>三房一厅</option>
											</select></span></td>
												<td class="ybox07td2"><img src="images/op4_0.gif" /></td>
											<td class="ybox07td1"><img src="images/op4_5.gif" /></td>
											<td><span style="cursor: pointer;">房间号码生成规则&nbsp;&nbsp;<select
												onchange="ajaxNumber(this.options[this.options.selectedIndex].text)">
													 <option value='号码+楼层'>号码+楼层</option>
													<option value='楼层+号码'>楼层+号码</option>
												
											</select></span></td>
											<td class="ybox07td1"><img src="images/op4_6.gif" /></td>
										<td><span style="cursor: pointer;" onclick="roomBase()">确认提交</span></td>
										<td class="ybox07td2" width="45%"><img
											src="images/op4_0.gif" /></td>
											
										<td class="ybox07td2"></td>
										<td class="ybox07td2"></td>
										<td class="ybox07td2"></td>
										<td class="ybox07td1"></td>
										<td></td>
										<!-- gotoaddreceive() -->
										<td class="ybox07td2"></td>

									</tr>
								</table>
							</dl>
						</div>
						<table width="1235px" border="1" cellpadding="0" cellspacing="1"
							class="ybox06table" id="list4">
							<tr>
								<td width="200px" rowspan="4">楼层名称</td>
								<td width="100px">单元</td>
							</tr>
							<tr id="rowhushu">
								<td width="100px">户数</td>
							</tr>
						</table>

						<table id="lift" border="1">

						</table>
				</tr>
				<tr>
					<td class="ybox03td7"></td>
					<td class="ybox03td8"></td>
					<td class="ybox03td9"></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="height: 400px; width: 420px">
				<div class="modal-header" style="background: #438eb9;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">设置楼层数，单元数</h4>
				</div>
				<!--  <div class="col-sm-10">
     验证码： <input type="text" class="form-control" id="role_name" placeholder="role_name"/>
    </div>
 -->            
				<span class="input input--haruki">
				<input class="input__field input__field--haruki" type="text" id="tfloor" />
					<label class="input__label input__label--haruki" for="input-1">
						<span class="input__label-content input__label-content--haruki"
						id="floor">楼层数</span>
				</label>
				</span> <span class="input input--haruki"> <input
					class="input__field input__field--haruki" type="text"
					id="tunit_number" /> <label
					class="input__label input__label--haruki" for="input-1">
					 <span
						class="input__label-content input__label-content--haruki"
						id="unit_number">单元数</span>
				</label>
				</span>


				<div class="modal-footer">
					<input type="button" onclick="ajaxUpdate123()" value="　确　认 　"
						class="btn btn-success" />
					<button type="button" class="btn btn-success"
						onclick="sendMassage()">&nbsp;取&nbsp;&nbsp;消&nbsp;</button>
				</div>


			</div>
		</div>
	</div>
</body>
</html>