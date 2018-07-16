<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link href="Styles/css.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery.js" type="text/javascript"></script>
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
			<div class="header_1">欢迎您，！系统管理员</div>
			<div class="header_2">
				<div class="header_2_exit">
					<%--<asp:ImageButton ID="imgBtnLogout" runat="server" ImageUrl="/images/exit.png" OnClick="imgBtnLogout_Click"
                    TabIndex="1000" />--%>
					<img src="images/exit.png" alt="退出" style="cursor: pointer" />
				</div>
			</div>
			<!-- <div class="menu">
				<div class="menu_button">
					<ul>
						<li class="menu_slts"><a href="#"> <img alt=""
								src="images/slts.png" border="0" id="imgHandle" /></a></li>
						<li><a href="../Default.html"> <img alt=""
								src="images/gzt_off.png" name="Image1" id="Image1" /></a></li>
						<li><a href="../Report/index.html"> <img alt=""
								src="images/tjfx_off.png" name="Image2" id="Image2" /></a></li>
						<li><a href="../Admin/index.htm"> <img alt=""
								src="images/xtgj_off.png" name="Image3" id="Image3" /></a></li>
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
									<li><a class="Menuhref s1" href="javascript:void(0);"
										target="iframeContext" id="4"> 销售管理 </a>
										<div id="ul4" style="display: none">
											<ul>
												<li runat="server" id="liOrganization"><a
													href="OrganizationsManager.htm" target="iframeContext">
														客户管理</a></li>
												<li runat="server" id="liEmployee"><a
													href="EmployeesManager.htm" target="iframeContext">
														接待管理</a></li>
											</ul>
										</div></li>
									<li><a class="Menuhref" href="javascript:void(0);" id="1"
										target="iframeContext">交易管理 </a>
										<div id="ul1" style="display: none">
											<ul>
												<li runat="server" id="liJobs"><a
													href="Admin/list.do" target="iframeContext"> 
														订单管理 </a></li>
												<li runat="server" id="liDataAuthority"><a
													href="hetong/list.do" target="iframeContext">
														合同管理</a></li>
												<li runat="server" id="liOperationAuthority"><a
													href="fukuan/list.do" target="iframeContext">
														付款方式管理</a></li>
												<li runat="server" id="liChangeRole"><a
													href="fangkuan/list.do" target="iframeContext">
														房款管理 </a></li>
												<li runat="server" id="liChangeRole"><a
													href="xiaoshou/list.do" target="iframeContext">
														销售机会管理 </a></li>
											</ul>
										</div></li>
									<li><a class="Menuhref" href="javascript:void(0);"
										target="iframeContext" id="2">审核维护</a>
										<div id="ul2" style="display: none">
											<ul>
												<li runat="server" id="liChangeRole"><a
													href="fangkuan/listlist.do" target="iframeContext">
														业务变更审核 </a></li>
											</ul>
										</div>
										
										</li>
									<li runat="server" id="liDictionary"><a class="Menuhref"
										href="DictionaryManager.htm" id="3" target="iframeContext">用户管理</a>
										<div id="ul3" style="display: none">
											<ul>
												<li runat="server" id="liHolidays"><a
													href="HolidayManager.htm" target="iframeContext">用户管理</a></li>
											</ul>
										</div>
									</li>
									<li><a class="Menuhref" href="javascript:void(0);"
										target="iframeContext" id="5">楼房管理</a>
										<div id="ul5" style="display: none">
											<ul>
												<li runat="server" id="liHolidays"><a
													href="HolidayManager.htm" target="iframeContext">
														开盘管理</a></li>
												<li runat="server" id="liWorkingTime"><a
													href="WorkingTimeManager.htm" target="iframeContext">
														户型管理</a></li>
												<li runat="server" id="liWarningTime"><a
													href="WarningTimeLimitManager.htm" target="iframeContext">
														用途管理</a></li>
												<li runat="server" id="liAlterRule"><a
													href="WarningRemindManager.htm" target="iframeContext">
														项目管理</a></li>
												<li runat="server" id="liWarningRule"><a
													href="WarningRuleManager.htm" target="iframeContext">
														楼栋管理</a></li>
												<li runat="server" id="liWarningRule"><a
													href="WarningRuleManager.htm" target="iframeContext">
														单元管理</a></li>
												<li runat="server" id="liWarningRule"><a
													href="WarningRuleManager.htm" target="iframeContext">
														房间管理</a></li>
											</ul>
										</div>
										
									</li>
								</ul>
							</div>
						</div>
					</td>
					<td class="swich"><img src="Images/swich.gif" width="10"
						height="25" id="imgJtd" style="cursor: pointer;" /></td>
					<td valign="top"><iframe id="iframeContext" src="welcome.htm"
							width="100%" height="790px" name="iframeContext" frameborder="0"></iframe>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
