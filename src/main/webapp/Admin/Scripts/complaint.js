///处理投诉七大状态的URL地址数组
var urlArray = new Array();
urlArray[0] = "list.aspx"; //列表
urlArray[1] = "HandleComplaint.aspx";      //受理投诉
urlArray[2] = "GradingComplaint.aspx";     //投诉定级
urlArray[3] = "ComplaintDistribution.aspx"; //派发投诉
urlArray[4] = "Determine.aspx"; //确定方案
urlArray[5] = "Feedback.aspx"; //用户反馈
urlArray[6] = "SolveComplaint.aspx"; //处理投诉
urlArray[7] = "Visits.aspx"; //回访客户
$(function () {
    //加载等待提示
    var ajaxbg = $("#background,#progressBar");
    ajaxbg.hide();
    //    $(document).ajaxStart(function () {
    //        ajaxbg.show();/// <reference path="complaintDistribution.js" />

    //    }).ajaxStop(function () {
    //        ajaxbg.hide();
    //    });
});


function showWaringHis() {
    var dialogBox2 = new Dialog($("#waringHIs").html(), {
        "width": "600px",
        "title": "详细信息",
        'modal': true,
        "closeModal": false
    });

}

function showLoading() {
    var ajaxbg = $("#background,#progressBar");
    ajaxbg.show();
}

function hideLoading() {
    var ajaxbg = $("#background,#progressBar");
    ajaxbg.hide();
}

function SendSMS(state) {
    ///	<summary>
    ///发送短信
    ///	</summary>
    ///	<param name="currentstate" type="String">
    ///	当前所在页面的流程ID
    ///	</param>
    var id = $("#hidComplaintId").val();
    var data = {
        complaintId: id,
        processState: state,
        r: Math.random()
    };
    if (id)
        $.ajax({
            type: "POST",
            url: "SendMessages.ashx",
            data: data,
            success: function (r) { alert(r) },
            error: function () { alert("短信发送失败"); }
        });
}

function updateSetpState(complaintId, rs) {
    $.post("/Business/Complaint.aspx", { type: "SetpState", complaintid: complaintId }, function (data) {

        $("#hidCanFirstFeedback").val(data.split(',')[0]);
        $("#hidCanDistribute").val(data.split(',')[1]);

        if (!getCurrentState())
            setCurrentState(0);
        var state = parseInt(getCurrentState()) + 1;

        if (getCurrentState() < 4 && $("#spState").html() == "反馈客户") {
            state = state - 1;
        }

        setState(state == 1 ? 1 : state);
        setCurrentState(state);

        $("#hidComplaintId").val(rs[1].split(';')[1]);

        navigation($("#hidComplaintId").val(), state);
    });
}

function navigation(complaintId, currentstate, e) {
    ///	<summary>
    ///导航
    ///	</summary>
    ///	<param name="complaintId" type="String">
    ///	投诉编号
    ///	</param>
    ///	<param name="currentstate" type="String">
    ///	当前状态
    ///	</param>

    if (!complaintId)
        complaintId = $("#hidComplaintId").val();

    if (!complaintId && currentstate > 0) {
        return;
    }
    if (currentstate != 4) {
        if (getCurrentState() < currentstate) {
            return;
        }
    }
    else if (getCurrentState() == 0) {
        return;
    }
    else if (getCurrentState() <= 3) {

        if ($("#hidCanFirstFeedback").val() == 0) {
            return;
        }

    }

    if (getCurrentState() == 1 && currentstate == 4) {
        return;
    }

    //派发
    if (currentstate == 2) {
        if ($("#hidCanDistribute").val() == 0) {
            if (!e) {
                if ($("#hidCanFirstFeedback").val() == 1)
                    return navigation(complaintId, 4);
                else
                    return navigation(complaintId, 1);
            }
            return;

        }

    }



    var spState = $("#spState");
    switch (currentstate) {
        case 0:
            spState.html("受理投诉");
            break;
        case 1:
            spState.html("投诉定级");
            break;
        case 2:
            spState.html("派发投诉");
            break;
        case 3:
            spState.html("确定方案");
            break;
        case 4:
            spState.html("反馈客户");
            break;
        case 5:
            spState.html("处理投诉");
            break;
        case 6:
            spState.html("回访客户");
            break;
        case 7:
            spState.html("已完成");
            break;
        default:
            spState.html("");
            break;

    }


    var ajaxbg = $("#background,#progressBar");
    ajaxbg.show();
    var index = currentstate;
    if (currentstate != 7) {
        index = currentstate + 1;
    }
    $("#content").load(urlArray[index] + "?complaintid=" + complaintId + "&currentstate=" + currentstate + "&" + Math.random() + " #main",
    null,
    function () {
        setReadonly(currentstate);
        ajaxbg.hide();
        switch (index) {
            case 1:
                break;
            case 2:
                gradingLoad();
                break;
            case 3:
                loadComplaintDistribution();
                break;
            case 4:
                break;
            case 5:
                feedbackLoaded();
                break;
            case 6:
                break;
            case 7:
                break;
        }

        if ($("#hidIsErrorPage").val() == 1) {
            setCenter();

            $("#ErrorBody").html($("#content").html());
            $("#ComplaintBody").hide();
        }
        try {
            iFrameHeight();
        } catch (e) {

        }

    });
}


function getCurrentState() {
    return $("#hidComplaintState").val();
}

function setCurrentState(state) {
    $("#hidComplaintState").val(state);
}

function sendErrorMsg(result) {
    try {
        $.ajax({
            type: "post",
            url: "/ErrorPage.aspx",
            data: { isError: 1, msg: $("#ErrorSpan").html() },
            success: function () {
                $("#ErrorSpan").html("");
            }
        });
    } catch (e) {
    }


}

function errorAlert(result) {
    alert("网络异常，请稍后再试！");
    removeButtouDisable();
    $("#ErrorSpan").html(result.responseText);
    setTimeout(sendErrorMsg, 100);
}

function setButtouDisable(buttouId) {
    $("#" + buttouId).attr("disabled", "disabled");

    $("#hidButtouDisable").val("#" + buttouId);

}

function removeButtouDisable() {
    var btnDisable = $("#hidButtouDisable").val();
    if (btnDisable) {
        $(btnDisable).removeAttr("disabled");
        $("#hidButtouDisable").val("");
    }
}


function callback(result) {
    if (result) {
        var r = "";
        if (result.d) {
            r = result.d;
        }
        if (result.responseText) {
            {
                var error = JSON.parse(result.responseText);
                if (error.Message)
                    r = error.Message;
                if (error.d)
                    r = error.d;
            }
        }
        removeButtouDisable();

        if (r) {
            var rs = r.split(';StateFlow=');
            alert(rs[0]);
            window.returnValue = rs[0];
            if (r.indexOf("暂存") < 0) {
                if (r.indexOf("成功") >= 0) {
                    if (rs[1] && rs[1].split(';')[0] == "True") {
                        showLoading();
                        updateSetpState(rs[1].split(';')[1], rs);
                    }
                    else {
                        window.close();
                    }


                }
            }
        };
    }
}






function setState(state) {

    $(".process_button_now").removeClass("process_button_now").addClass("process_button_feature");
    $(".process_button_old").removeClass("process_button_old").addClass("process_button_feature");

    var lis = $(".process_button_feature");
    for (var i = 0; i <= state; i++) {
        $(lis[i]).removeClass("process_button_feature");
        if (state != i)
            $(lis[i]).addClass("process_button_old");
        else
            $(lis[i]).addClass("process_button_now");
    }

    //派发
    if ($("#hidCanDistribute").val() == 1) {
        $(lis[2]).removeClass("process_button_feature");
        $(lis[2]).addClass("process_button_old");
    } else {
        $(lis[2]).removeClass("process_button_old");
        $(lis[2]).addClass("process_button_feature");
    }
    //反馈
    if (state > 1 && $("#hidCanFirstFeedback").val() == 1 && state < 5) {
        $(lis[4]).removeClass("process_button_feature");
        $(lis[4]).addClass("process_button_old");
    }
    var imgs = $("#menu img");

    for (var j = 0; j < state; j++) {
        $(imgs[j]).attr("src", "../images/jt_n.png");
    }

    //    $("#menu a").parent().removeClass("process_button_now").addClass("process_button_old");
    //    $("#menu a").click(function () {
    //        if ($.trim($(this).parent().attr("class")) == "process_button_old") {

    //            $(this).parent().removeClass("process_button_feature")
    //                        .removeClass("process_button_old")
    //                        .addClass("process_button_now");
    //        }
    //    });


}

function datePicker() {
    ///<summary>
    ///日历控件
    ///</summary>
    WdatePicker({ readOnly: true, dateFmt: 'yyyy-MM-dd HH:mm' })
}

function imgClick(timeId) {
    $("#" + timeId).focus();
}


function openSelectEmployee(userId, userName, organizationId, organizationName, pid, jid) {
    ///	<summary>
    ///人员选择 带部门
    ///	</summary>
    ///	<param name="userId" type="String">
    ///	用户ID 控件的Id
    ///	</param>
    ///	<param name="userName" type="String">
    ///	用户名称控件的ID
    ///	</param>
    ///	<param name="organizationId" type="String">
    ///	部门Id控件的ID
    ///	</param>
    ///	<param name="organizationName" type="String">
    ///	部门名称控件的ID
    ///	</param>
    //"dialogHeight: " + height + "px; dialogWidth: " + width + "px;

    var queryString = "";
    if (pid) queryString = "?pid=" + pid;
    if (jid)
        queryString += "&jid=" + jid
    var s = window.showModalDialog("../Business/SelectEmployee.aspx" + queryString, document, "dialogHeight:500px;dialogWidth:390px;");
    if (s) {
        var items = s.split(";");
        if ($("#" + userId))
            $("#" + userId).val(items[0]);
        if ($("#" + userName))
            $("#" + userName).val(items[1]);
        if ($("#" + organizationId))
            $("#" + organizationId).val(items[2]);
        if ($("#" + organizationName))
            $("#" + organizationName).val(items[3]);
    }
}


function setReadonly(currentstate) {
    //    if ($("#hidComplaintState").val() != currentstate) {
    //        $("input").attr("readonly", "readonly");
    //        $("select").attr("disabled", "disabled");
    //    }
}


function setSubjectMain(subjectData, subjectMainId) {
    ///	<summary>
    ///二级联动方法
    ///	</summary>
    ///	<param name="subjectData" type="String">
    ///	父类表数据源
    ///	</param>
    ///	<param name="subjectMainId" type="String">
    ///	父类列表ID
    ///	</param>
    for (var i = 0; i < subjectData.length; i++) {
        var xValue = subjectData[i].Uuid;
        var xText = subjectData[i].Value;
        var option = new Option(xText, xValue);
        document.getElementById(subjectMainId).add(option);
    }
    setChild(subjectData[0].Uuid, subjectMainId + "Child", subjectData);

}
function setChild(value, childId, subjectData) {
    ///	<summary>
    ///二级联动方法
    ///	</summary>
    ///	<param name="value" type="String">
    ///	父类选中的值
    ///	</summary>
    ///	<param name="childId" type="String">
    ///	子类表数据源
    ///	</param>
    ///	<param name="subjectData" type="String">
    ///	子类列表ID
    ///	</param>

    document.getElementById(childId).options.length = 0;
    for (var i = 0; i < subjectData.length; i++) {
        if (subjectData[i].Uuid == value) {
            var Childs = subjectData[i].Childs;
            for (var j = 0; j < Childs.length; j++) {
                var xValue = Childs[j].Uuid;
                var xText = Childs[j].Value;
                var option = new Option(xText, xValue);
                document.getElementById(childId).add(option);
            }
        }
    }
}

function load(state) {
    $(function () {
        navigationUrl(state);
        setCurrentState(state);
        setState(state);
    });
}


function page_Close() {
    if (window.parent != null) {
        window.parent.close();
    }
    else {
        window.close();
    }
}

function SetWinHeight(obj) {
    var win = obj;
    if (document.getElementById) {
        if (win && !window.opera) {
            if (win.contentDocument && win.contentDocument.body.offsetHeight)
                win.height = win.contentDocument.body.offsetHeight;
            else if (win.Document && win.Document.body.scrollHeight)
                win.height = win.Document.body.scrollHeight;
        }
    }
}

function iFrameHeight() {
    var ifm = document.getElementById("fileUpLoadIframe");
    if (ifm) {
        var subWeb = document.frames ? document.frames["fileUpLoadIframe"].document : ifm.contentDocument;
        if (ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight + 20;
        }
    }
}

function getSelectTypeValue() {
    var selectValue = $("#selClientType").val();
    if (selectValue == "F1CB5B74E53842E5B08864FFE30B01EB") {
        //        document.getElementById('txtBusinessName').value = "";
        document.getElementById('spanbusinessNameDiv').style.display = "none";
        document.getElementById('txtBusinessNameDiv').style.display = "none";
        document.getElementById('spanBusinessType').style.display = "none";
        document.getElementById('drpBusinessTypeDiv').style.display = "none";

    }
    else if (selectValue == '74CD12115BE14904ABCF461428A46703') {
        document.getElementById('spanbusinessNameDiv').style.display = "none";
        document.getElementById('txtBusinessNameDiv').style.display = "none";
        document.getElementById('spanBusinessType').style.display = "none";
        document.getElementById('drpBusinessTypeDiv').style.display = "none";
    }
    else {
        //        document.getElementById('businessNamePanel').style.display = "";
        document.getElementById('drpBusinessTypePanel').style.display = "";
        document.getElementById('businessNamePanel').style.display = "";
        document.getElementById('txtBusinessNamePanel').style.display = "";
        document.getElementById('businessTypePanel').style.display = "";
        document.getElementById('spanbusinessNameDiv').style.display = "";
        document.getElementById('txtBusinessNameDiv').style.display = "";
        document.getElementById('spanBusinessType').style.display = "";
        document.getElementById('drpBusinessTypeDiv').style.display = "";

        //        document.getElementById('spanbusinessNameDiv').style.display = "";
        //        document.getElementById('gradingReasonChildDiv').style.display = "";
    }
}





 







