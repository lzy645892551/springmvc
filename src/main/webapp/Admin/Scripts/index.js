$(function () {
    subLoad(false, 0);
    handleImageShow();
});

function searchButtonClick(button) {
    $(".complaint_button a").removeClass("s2");
    $(button).addClass("s2");
}

function subLoad(button, id, bl) {
    $(".complaint_button a").removeClass("s2");
    if (!button)
        $(".complaint_button a:eq(0)").addClass("s2");
    if (button.toString() == "none")
        $(".complaint_button a:eq(3)").addClass("s2");
    else
        $(button).addClass("s2");

    if (bl == 1)
        EmptyCondition();

    $("#hidPageIndex").val(1);

    $("#hidIsSelect").val(bl == 2 ? 1 : 0)

    showLoading();
    $("#hidSubPageId").val(id);
    $("#hidSubContextUrl").val(urlArray[id] + " #main");

    getPageData(1);

}


function handleImageShow() {
    handleImageHide();
    if ($("#hidIsManager").val() == 0) {
        $("#imgHandle").show();
    }
}

function handleImageHide() {
    $("#imgHandle").hide();
}

var urlArray = new Array();
urlArray[0] = "/Business/EmployeeList.aspx";
urlArray[1] = "/Business/ApprovalList.aspx";
urlArray[2] = "/Business/list.aspx";
urlArray[3] = "/Report/ProcessSummary.aspx";


function load(index) {
    $("#Image1").attr("src", "../images/gzt_off.png");
    $("#Image2").attr("src", "../images/tjfx_off.png");
    $("#Image3").attr("src", "../images/xtgj_off.png");
    switch (index) {
        case 1:
            showLoading();
            handleImageHide()
            imgSrc = "../images/tjfx_on.png";
            $("#Image2").attr("src", "../images/tjfx_on.png");
            loadReport();
            break;
        case 2:
            $("#Image3").attr("src", "../images/xtgj_on.png");
            imgSrc = "../images/xtgj_on.png";
            if ($("#hidIsManager").val() == 1) {
                handleImageHide()
                showLoading();
                loadAdmin();
            } else {
                alert("您无权操作此模块！");
            }
            break;
        default:
            showLoading();
            loadList();
    }
}

function loadReport() {
    $("#context").load("Report/index.aspx #main", null, function () {
        hideLoading();
        $("#iframeContext").attr("height", winHeight * 0.76);

        $("#imgJtd").toggle(function () {
            $("#topleft").show();
        }, function () {
            $("#topleft").hide();
        });

        $(".box_leftMenu a").click(function () {

            $(".box_leftMenu a").removeClass("s1");

            $(this).addClass("s1");
        });
    });
}
var winHeight = $(window).height();
function loadAdmin() {
    $("#context").load("admin/index.aspx #main", null, function () {
        hideLoading();
        $("#iframeContext").attr("height", winHeight * 0.76);
        $("#imgJtd").toggle(function () {
            $("#topleft").hide();
        }, function () {
            $("#topleft").show();
        });

        $(".Menuhref").click(function () {
            $(".box_leftMenu div").hide();
            $(".Menuhref").removeClass("s1");
            $("#ul" + this.id).show();
            $(this).addClass("s1");
        });


        $("[id^=ul] a").click(function () {
            $("[id^=ul] a").removeClass("s2");
            $(this).addClass("s2");
        });



    });
}

function loadList() {
    $("#context").load("Business/index.aspx #main", null, function () {
        $("#Image1").attr("src", "../images/gzt_on.png");
        imgSrc = "../images/gzt_on.png";
        hideLoading();
        handleImageShow();
        $(document).keydown(function (e) {
            if (!e) e = window.event; //火狐中是 window.event
            if ((e.keyCode || e.which) == 13) {

                if ($("#hidKey").val() == 1) {

                    getPageData(1, 1);
                }
                else
                    btnPageIndex();
            }
        });

        $("#txtPage").click(function () {
            $("#hidKey").val(0);
        });
        $("#txtPage").change(function () {
            $("#hidKey").val(0);
        });
        $("#txtPage").focus(function () {
            $("#hidKey").val(0);
        });
        $("#divTj input,select").click(function () {

            $("#hidKey").val(1);
        });
        subLoad(false, 0);

        $("#hidIsSelect").val(0);
        showSelect();
        sc1();
        window.onscroll = sc1;
        window.onresize = sc1;
    });
}


function MM_openBrWindow(theURL, winName, features) { //v2.0
    window.open(theURL, winName, features);
}

function showSelect() {
    try {
        $("#divTj").hide();
        $("#imgJtd").toggle(function () {
            $("#divTj").fadeIn(800);
            this.src = "images/jt_t.png";
        }, function () {
            $("#divTj").fadeOut(800);
            this.src = "images/jt_d.png";
        });
    } catch (e) {

    }

}

function imgClick(timeId) {
    $("#" + timeId).focus();
}

function openWin(complaintid, currentstate) {
    var state = parseInt(currentstate);
    var url = '/Business/Complaint.aspx?complaintid=' + complaintid + "&currentstate=" + state;
    var s = window.showModalDialog(url, '受理投诉', "dialogWidth=860px;dialogHeight=768px;toolbar = no;status = no;scrollbars=no");

    if (s) getPageData(1);
    //   EmptyCondition();
}




function openWinApproval(FlowInstanceUuid, FlowTaskUuid, complaintid) {


    var url = '/Business/Approval.aspx?FlowInstanceUuid=' + FlowInstanceUuid + "&FlowTaskUuid=" + FlowTaskUuid + "&complaintid=" + complaintid + "";
    var s = window.showModalDialog(url, '审批', "dialogWidth=860px;dialogHeight=300px;toolbar = no;status = no;scrollbars=no");

    if (s) {
        getPageData(1);
        loadApproval();
        try {

            $.post("/Business/EmployeeList.aspx", { type: "WaitingApprovalCount" }, function (data) {
                $("#spApprovalCount").html(data);

                $("#ApprovalListCount").val(data);
            });


        } catch (e) {

        }

    }
    //   EmptyCondition();
}

function EmptyCondition() {
    if ($("#hidProjectName").val() != "") {
        $("#txtRespectivePro").val($("#hidProjectName").val())
    }
    else {
        $("#txtRespectivePro").val("");
    }
    $("#txtPreferred").val("");
    $("#txtPreferred").val("");
    $("#drpComplaintLevelId").selectedIndex = 0;
    $("#drpState").selectedIndex = 0;
    $("#drpCustomerType").selectedIndex = 0;
    $("#txtComplaintContent").val("");
    $("#txtComplaintStartTime").val("");
    $("#txtComplaintOverTime").val("");
    $("#drpComplaintSource").selectedIndex = 0;
    $("#drpSolutionId").selectedIndex = 0;
    $("#hidIsSelect").val(0);
}

function SetCondition() {
    $("#txtRespectivePro").val($("#hidProductName").val());
    $("#txtComplaintStartTime").val($("#hidStartTime").val());
}


function showLoading() {
    var ajaxbg = $("#background,#progressBar");
    ajaxbg.show();
}

function hideLoading() {
    var ajaxbg = $("#background,#progressBar");
    ajaxbg.hide();
}

function getComplaintList() {

    //    if (!$("#listHeader").get(0)) {
    $("#context").load("Business/index.aspx #main", null, function () {
        $("#Image1").attr("src", "../images/gzt_on.png");
        imgSrc = "../images/gzt_on.png";
        hideLoading();
        handleImageShow();
        $(document).keydown(function (e) {
            if (!e) e = window.event; //火狐中是 window.event
            if ((e.keyCode || e.which) == 13) {

                if ($("#hidKey").val() == 1) {

                    getPageData(1, 1);
                }
                else
                    btnPageIndex();
            }
        });

        $("#txtPage").click(function () {
            $("#hidKey").val(0);
        });
        $("#txtPage").change(function () {
            $("#hidKey").val(0);
        });
        $("#txtPage").focus(function () {
            $("#hidKey").val(0);
        });
        $("#divTj input,select").click(function () {
            $("#hidKey").val(1);
        });

        setTimeout(GetPageList, 100)

        $("#hidIsSelect").val(0);
        showSelect();
        sc1();
        window.onscroll = sc1;
        window.onresize = sc1;
    });
    //    }
    //    else {
    //        GetPageList();
    //    }


}

function GetPageList() {
    var data = {
        type: "search",
        where: "",
        ProjectName: $("#txtRespectivePro").val() ? $("#txtRespectivePro").val() : "",
        ComplaintName: $("#txtComplainantName").val() ? $("#txtComplainantName").val() : "",
        ContactFirst: $("#txtPreferred").val() ? $("#txtPreferred").val() : "",
        ComplaintLevelId: $("#drpComplaintLevelId").val() ? $("#drpComplaintLevelId").val() : -1,
        CurrentState: $("#drpState").val() ? $("#drpState").val() : -1,
        CustomerType: $("#drpCustomerType").val() ? $("#drpCustomerType").val() : "-1",
        ComplaintContent: $("#txtComplaintContent").val() ? $("#txtComplaintContent").val() : "",
        CreateStartTime: $("#txtComplaintStartTime").val() ? $("#txtComplaintStartTime").val() : "",
        CreateOverTime: $("#txtComplaintOverTime").val() ? $("#txtComplaintOverTime").val() : "",
        ComplaintSource: $("#drpComplaintSource").val() ? $("#drpComplaintSource").val() : -1,
        SolutionId: $("#drpSolutionId").val() ? $("#drpSolutionId").val() : -1,
        isSelect: $("#hidIsSelect").val() ? $("#hidIsSelect").val() : 0,
        pageIndex: $("#hidPageIndex").val()
    }
    $("#temp").load("Business/List.aspx #main", data, function () {
        $("#listHeader").html($("#tableContent tr"));
        $("#temp").hide();
        hideLoading();
        page();
        setTrCss();
        $("#spApprovalCount").html($("#ApprovalListCount").val());
        $("#rpCount").html($("#EmployeeCount").val());
        if ($("#txtPage").val() <= 1)
            $("#txtPage").val(1);
    });
}

function getPageData(i, isSelect, isGoTo) {
    if (isSelect && !isGoTo) {
        $("#hidPageIndex").val("1");
    }
    if (!isGoTo)
        $("#hidIsSelect").val(isSelect);
    if ($.trim($("#txtComplaintStartTime").val()) != "" && $.trim($("#txtComplaintOverTime").val()) != "") {
        if ($("#txtComplaintStartTime").val() > $("#txtComplaintOverTime").val()) {
            alert("开始时间不能大于结束时间");
            return false;
        }
    }
    $("#txtPage").val(i);

    hideLoading();

    var url = "Business/List.aspx #main";
    if ($("#hidSubContextUrl").val())
        url = $("#hidSubContextUrl").val();
    var data = {
        type: "search",
        where: "",
        ProjectName: $("#txtRespectivePro").val(),
        ComplaintName: $("#txtComplainantName").val(),
        ContactFirst: $("#txtPreferred").val(),
        ComplaintLevelId: $("#drpComplaintLevelId").val(),
        CurrentState: $("#drpState").val() ? $("#drpState").val() : -1,
        CustomerType: $("#drpCustomerType").val(),
        ComplaintContent: $("#txtComplaintContent").val(),
        CreateStartTime: $("#txtComplaintStartTime").val(),
        CreateOverTime: $("#txtComplaintOverTime").val() ? $("#txtComplaintOverTime").val() : "",
        ComplaintSource: $("#drpComplaintSource").val(),
        SolutionId: $("#drpSolutionId").val() ? $("#drpSolutionId").val() : -1,
        isSelect: $("#hidIsSelect").val(),
        pageIndex: $("#hidPageIndex").val()
    }
    showLoading();

    if ($("#hidSubPageId").val() == 2) {
        //首页
        if ($("#hidIsListPage").val() == 0) {
            getComplaintList();
            $("#hidIsListPage").val(1);

        } else {
            GetPageList();
        }
    }
    else {
        $("#hidIsListPage").val(0);
        $("#subContext").load(url, data, function () {
            hideLoading();
            page();
            setTrCss();
            SetCondition();
            showSelect();
            if ($("#hidIsSelect").val() == 1) {
                $("#divTj").show();
            }
            if ($("#hidSubPageId").val() == 0) {
                $("#spApprovalCount").html($("#hidApprovalListCount").val());
                $("#rpCount").html($("#hidEmployeeCount").val());
                $("#ApprovalListCount").val($("#hidApprovalListCount").val());
                $("#EmployeeCount").val($("#hidEmployeeCount").val());
            }
        });
    }
}


function setTrCss() {

    if (document.getElementById("listHeader")) {

        var Ptr = document.getElementById("listHeader").getElementsByTagName("tr");
        for (i = 1; i < Ptr.length + 1; i++) {
            Ptr[i - 1].className = (i % 2 > 0) ? "t1" : "t2";
        }
        for (var i = 0; i < Ptr.length; i++) {
            Ptr[i].onmouseover = function () {
                this.tmpClass = this.className;
                this.className = "t3";
            };
            Ptr[i].onmouseout = function () {
                this.className = this.tmpClass;
            };
        }
    }
}

function page() {

    var rowCount = $("#hidRowCount").val();

    var pageSize = $("#hidPageSize").val();
    var pageIndex = $("#hidPageIndex").val();
    var pageCount = rowCount / pageSize;



    pageCount = parseInt(pageCount.toString().split(".")[0]);
    if (rowCount % pageSize > 0) {
        pageCount = pageCount + 1;
    }

    if (pageCount && pageCount > 0) {
        $("#spRowCount").html(pageCount);
        $("#error").hide();
    }
    else {
        $("#error").show();
        $("#spRowCount").html(0);
    }

    //    $(  "#spRowCount").html(pageCount);
    $("#pageSee").html(pageIndex);
    var pageFirst = $("#pageFirst");
    var pageUp = $("#pageUp");
    var pageDown = $("#pageDown");
    var pageLast = $("#pageLast");

    if (pageCount == 1 || pageCount == 0) {
        pageFirst.removeAttr("href");
        pageUp.removeAttr("href");
        pageDown.removeAttr("href");
        pageLast.removeAttr("href");
        $("#imgPageFirst").attr("src", "images/first_off.png");
        $("#imgPageUp").attr("src", "images/pageUp_off.png");
        $("#imgPageDown").attr("src", "images/pageDown_off.png");
        $("#imgPageLast").attr("src", "images/last_off.png");
    } else if (pageCount > pageIndex && pageIndex == 1) {
        pageFirst.removeAttr("href");
        pageUp.removeAttr("href");
        $("#imgPageFirst").attr("src", "images/first_off.png");
        $("#imgPageUp").attr("src", "images/pageUp_off.png");
        $("#imgPageDown").attr("src", "images/pageDown_on.png");
        $("#imgPageLast").attr("src", "images/last_on.png");

        pageDown.attr("href", "javascript:void(0)");
        pageLast.attr("href", "javascript:void(0)");
    } else if (pageIndex > 1 && pageCount <= pageIndex) {

        pageFirst.attr("href", "javascript:void(0)");
        pageUp.attr("href", "javascript:void(0)");

        pageDown.removeAttr("href");
        pageLast.removeAttr("href");
        $("#imgPageFirst").attr("src", "images/first_on.png");
        $("#imgPageUp").attr("src", "images/pageUp_on.png");
        $("#imgPageDown").attr("src", "images/pageDown_off.png");
        $("#imgPageLast").attr("src", "images/last_off.png");

    }

    else {
        pageDown.attr("href", "javascript:void(0)");
        pageLast.attr("href", "javascript:void(0)");
        pageFirst.attr("href", "javascript:void(0)");
        pageUp.attr("href", "javascript:void(0)");
        $("#imgPageFirst").attr("src", "images/first_on.png");
        $("#imgPageUp").attr("src", "images/pageUp_on.png");
        $("#imgPageDown").attr("src", "images/pageDown_on.png");
        $("#imgPageLast").attr("src", "images/last_on.png");

    }

    //    document.getElementById("selPage").options.length = 0;
    //    for (var i = 1; i <= pageCount; i++) {
    //        var xValue = i;
    //        var xText = i;
    //        var option = new Option(xText, xValue);

    //        document.getElementById("selPage").add(option);
    //    }
    //    $("#selPage").val($("#hidPageIndex").val());




}
function btnPageIndex() {

    var page = $("#txtPage").val();
    if (page > 0 && page <= parseInt($("#spRowCount").html())) {
        $("#hidPageIndex").val(page);
        getPageData(page, 0, true);
    }
    //getPageData(page, 0);


}


function checkPageIndex(obj) {
    obj.value = obj.value.replace(/[^\d\.]/g, '');

    if (parseInt(obj.value) > parseInt($("#spRowCount").html())) {
        obj.value = $("#spRowCount").html();
    }

    if (obj.value == 0) {
        obj.value = 1;
    }
}


function setPager(flag) {
    var page = 1;
    switch (flag) {

        case "First": if ($("#hidPageIndex").val() == 1) return; page = 1;
            break;
        case "Up": page = parseInt($("#hidPageIndex").val()) - 1;
            break;
        case "Down": page = parseInt($("#hidPageIndex").val()) + 1
            break;
        case "Last": page = parseInt($("#spRowCount").html());
            if (parseInt($("#spRowCount").html()) == $("#hidPageIndex").val()) return;
            break;

    }

    if (page > 0 && page <= parseInt($("#spRowCount").html())) {
        $("#hidPageIndex").val(page);
        getPageData(page);
    }
}

function sc1() {
    try {

        if (document.getElementById("Javascript.Div1")) {
            document.getElementById("Javascript.Div1").style.top = (document.documentElement.scrollTop + document.documentElement.clientHeight
            - document.getElementById("Javascript.Div1").offsetHeight) + "px";
            document.getElementById("Javascript.Div1").style.left = (document.documentElement.scrollLeft + document.documentElement.clientWidth
            - document.getElementById("Javascript.Div1").offsetWidth) + "px";
        }
    } catch (e) {

    }

}



var imgSrc = "";
function swapImage(id, path) {
    var img = $("#" + id);
    imgSrc = img.attr("src");
    img.attr("src", path);
}

function swapImgRestore(id) {
    var img = $("#" + id);
    img.attr("src", imgSrc);
}


function openProcessDetail(InstanceID) {
    var url = "Report/ProcessDetail.aspx?InstanceID=" + InstanceID + "";
    return openModelDialog(url, 230, 600);
}
function openModelDialog(url, height, width) {
    return window.showModalDialog(url, '', "dialogWidth=" + width + "px;dialogHeight=" + height
                 + "px;toolbar = no;status = no;scrollbars=no;center: Yes");

}
