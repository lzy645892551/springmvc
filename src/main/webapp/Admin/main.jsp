<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link href="${pageContext.request.contextPath}/Admin/Styles/css.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/Admin/Scripts/jquery.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
        $().ready(function () {
            $("#imgJtd").toggle(function () {
                $("#topleft").show();
            }, function () {
                $("#topleft").hide();
            });

            $(".Menuhref").click(function () {
                $(".box_leftMenu div").hide();
                $(".Menuhref").removeClass("s1");
                $("#ul" + this.id).show();
                $(this).addClass("s1");
            });


            $(".Menuhref a").click(function () {
                $(".Menuhref a").removeClass("box_leftMenuhover");

                $(this).addClass("box_leftMenuhover");
            });



        });
  
    </script>
<base href="<%=basePath%>">

<title>My JSP '1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div id="main">
		<div id="header">
			<div class="header_1">
				欢迎您！${name }</div>
			<div class="header_2">
				<div class="header_2_exit">
					<%--<asp:ImageButton ID="imgBtnLogout" runat="server" ImageUrl="/images/exit.png" OnClick="imgBtnLogout_Click"
                    TabIndex="1000" />--%>
					<img src="${pageContext.request.contextPath}/Admin/images/exit.png" alt="退出" style="cursor: pointer" />
				</div>
			</div>
			<!-- <div class="menu">
				<div class="menu_button">
					<ul>
						<li class="menu_slts"><a href="#"> <img alt=""
								src="./Admin/images/slts.png" border="0" id="imgHandle" /></a></li>
						<li><a href="../Default.html"> <img alt=""
								src="./Admin/images/gzt_off.png" name="Image1" id="Image1" /></a></li>
						<li><a href="../Report/index.html"> <img alt=""
								src="./Admin/images/tjfx_off.png" name="Image2" id="Image2" /></a></li>
						<li><a href="../Admin/index.htm"> <img alt=""
								src="./Admin/images/xtgj_off.png" name="Image3" id="Image3" /></a></li>
					</ul>
				</div>
			</div> -->
		</div>
		<div id="box_ny">
			<table width="100%" height="450px" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td width="150" valign="top" id="topleft">
						<div class="box_left">
							<div class="box_leftTitle">系统后台</div>
							<div class="box_leftMenu">
								<ul>
								  <c:forEach var="melist" items="${listMenu}">
									<li><a class="Menuhref" href="javascript:void(0);"
										target="iframeContext" id="${melist.menuId}">${melist.menuName }</a>
										<div id="ul${melist.menuId}" style="hight: 100%">
										<c:forEach var="slist" items="${melist.subMenu}">
											<ul>
												<li runat="server" ><a
													href="${slist.menuUrl}" target="iframeContext">${slist.menuName }</a>
										       </li>
											</ul>
									   </c:forEach>
										</div>
										</li>
								   </c:forEach>		
								</ul>
							</div>
						</div>
					</td>
					<td class="swich"><img src="./Admin/images/swich.gif" width="10"
						height="25" id="imgJtd" style="cursor: pointer;" /></td>
					<td valign="top"><iframe id="iframeContext" src="./Admin/welcome.jsp"
							width="100%" height="790px" name="iframeContext" frameborder="0"></iframe>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
