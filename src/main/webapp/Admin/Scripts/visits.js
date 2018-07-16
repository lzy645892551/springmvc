/// <reference path="jquery-1.4.1-vsdoc.js" />

function isVisitsChick() {
    var visitsList = $('input:radio[name="isVisits"]:checked').val();
    //选择需要回访
    if (visitsList == "0") {
        $("#tr1").hide();
        $("#tr2").show();
        $("#tr3").show();
        $("#tr4").show();
        var customerSatisfied = $("#ddlcustomerSatisfied").find("option:selected").val();
        if (customerSatisfied == "9A22193370654FE6B60DBBB91BB7D461") {//不满意并关闭
            $("#btnVisitsSuspend").attr("disabled", "disabled")
            $("#btnVisitsSubmit").attr("disabled", "disabled");
        } else {
            //暂存
            $("#btnVisitsSuspend").removeAttr("disabled");
            //提交
            $("#btnVisitsSubmit").removeAttr("disabled");
        }
        
    } else {
        $("#tr1").show();
        $("#tr2").hide();
        $("#tr3").hide();
        $("#tr4").hide();
        var checkValue = $("#slVisitsReason").val();
        if (checkValue == "BD44920315CD4078B16FD70D8080E7C8") {
            $("#btnApproval").removeAttr("disabled");
            $("#btnVisitsSuspend").attr("disabled", "disabled")
            $("#btnVisitsSubmit").attr("disabled", "disabled");

        } else {
            $("#btnApproval").attr("disabled", "disabled");
            $("#btnVisitsSuspend").removeAttr("disabled");
            $("#btnVisitsSubmit").removeAttr("disabled");
        }
    }

}

//满意度选择，如果是不满意提示选择升级后的投诉级别：重大投诉
function ddlcustomerSatisfiedChick() {
    //var customerSatisfied = $("#ddlcustomerSatisfied").find("option:selected").text();
    var customerSatisfied = $("#ddlcustomerSatisfied").find("option:selected").val();
    if (customerSatisfied == "AAB5CD43427546B9998F6D43F6D47EF6") {//不满意并升级
        $("#isupgrade").show();
        $("#btnDissatApproval").hide();
        $("#btnVisitsSuspend").removeAttr("disabled");
        $("#btnVisitsSubmit").removeAttr("disabled");
    } else if (customerSatisfied == "9A22193370654FE6B60DBBB91BB7D461") {//不满意并关闭
        $("#btnDissatApproval").show();
        $("#isupgrade").hide();
        $("#btnVisitsSuspend").attr("disabled", "disabled")
        $("#btnVisitsSubmit").attr("disabled", "disabled");
    } else {
        $("#btnDissatApproval").hide();
        $("#isupgrade").hide();
        $("#btnVisitsSuspend").removeAttr("disabled");
        $("#btnVisitsSubmit").removeAttr("disabled");
    }
}

function slVisitsReasonChick() {
    var checkValue = $("#slVisitsReason").val();  //获取Select选择的Value
    //表示不方便回访是：回访原因为无联系方式
    if (checkValue == "21AC381626D14DF9BC5EBDE3C3A359F2") {
        $("#btnApproval").attr("disabled", "disabled");
        $("#btnVisitsSuspend").removeAttr("disabled");
        $("#btnVisitsSubmit").removeAttr("disabled");
    } else {
        $("#btnApproval").removeAttr("disabled");
        $("#btnVisitsSuspend").attr("disabled", "disabled")
        $("#btnVisitsSubmit").attr("disabled", "disabled");
    }
}

function AddVisits(oEvent, isDraft, isApproval) {
    var visitsvalues = $('input:radio[name="isVisits"]:checked').val();
    var checkText = $("#slVisitsReason").find("option:selected").val();
    var customerSatisfied = $("#ddlcustomerSatisfied").find("option:selected").val();
    var visitsContent = $.trim($("#VisitsContent").val());
    var soveDate = $("#txtsoveDate").val();
    var remarks = $.trim($("#txtremarks").val());
    var complaintId = $("#hidComplaintId").val();
    if (isDraft == "0") {
        if (visitsvalues == "0") {
            checkText = "";
            if (soveDate == "" || soveDate == null) {
                alert("回访时间不能为空!");
                return false;
            }
            if (visitsContent == "" || visitsContent == null) {
                alert("回访内容不能为空!");
                return false;
            }
            checkText = "";
        } else {
            customerSatisfied = "";
            visitsContent = "";
            soveDate = "";
        }
    } else {
        if (isApproval != 0) {
            if (visitsvalues == "0") {
                checkText = "";
                if (soveDate == "" || soveDate == null) {
                    alert("回访时间不能为空!");
                    return false;
                }
                if (visitsContent == "" || visitsContent == null) {
                    alert("回访内容不能为空!");
                    return false;
                }
                checkText = "";
            } else {
                customerSatisfied = "";
                visitsContent = "";
                soveDate = "";
            }
        } else {
            if (visitsvalues == "1") {
                customerSatisfied = "";
                visitsContent = "";
                soveDate = "";
            } else {
                checkText = "";
            }
        }
        
    }
    if (visitsContent != "" || visitsContent != null) {
        if (visitsContent.length > 1000) {
            alert("回访内容超过有限长度,最多1000个字符");
            return false;
        }
    }
    if (remarks != "" || remarks != null) {
        if (remarks.length > 500) {
            alert("备注输入超过有限长度,最多500个字符");
            return false;
        }
    }
    setButtouDisable(oEvent.id);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "Visits.aspx/AddVisits",
        data: "{visitsReason:'" + checkText + "', handleState:'" + 1 + "',customerSatisfied:'" + customerSatisfied + "',visitsContent:'" + visitsContent + "',visitsTime:'" + soveDate + "',remarks:'" + remarks + "',isDraft:'" + isDraft + "',complaintId:'" + complaintId + "',isApproval:'" + isApproval + "'}",
        dataType: "json",
        success: callback,
        error: errorAlert
    });
}
function UpdateWithVisit(oEvent) {
    var visitsvalues = $('input:radio[name="isVisits"]:checked').val();
    var checkText = $("#slVisitsReason").find("option:selected").val();
    var customerSatisfied = $("#ddlcustomerSatisfied").find("option:selected").val();
    var visitsContent = $.trim($("#VisitsContent").val());
    var sovetime = $("#txtsoveDate").val();
    var remarks = $.trim($("#txtremarks").val());
    var complaintId = $("#hidComplaintId").val();
    if (visitsvalues == "0") {
        checkText = "";
        if (sovetime == "" || sovetime == null) {
            alert("回访时间不能为空!");
            return false;
        }
        if (visitsContent == "" || visitsContent == null) {
            alert("回访内容不能为空!");
            return false;
        }
        checkText = "";
    } else {
        customerSatisfied = "";
        visitsContent = "";
        soveDate = "";
    }
    if (visitsContent != "" || visitsContent != null) {
        if (visitsContent.length > 1000) {
            alert("回访内容超过有限长度,最多1000个字符");
            return false;
        }
    }
    if (remarks != "" || remarks != null) {
        if (remarks.length > 500) {
            alert("备注输入超过有限长度,最多500个字符");
            return false;
        }
    }
    //$(":button").attr("disabled", "disabled");
    setButtouDisable(oEvent.id);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "Visits.aspx/UpdateWithVisit",
        data: "{visitsReason:'" + checkText + "', handleState:'" + 1 + "',customerSatisfied:'" + customerSatisfied + "',visitsContent:'" + visitsContent + "',visitsTime:'" + sovetime + "',remarks:'" + remarks + "',complaintId:'" + complaintId + "'}",
        dataType: "json",
        success: callback,
        error: errorAlert
    });
}

function btnApprovalSumit() {

}