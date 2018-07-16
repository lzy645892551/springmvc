
function feedbackLoaded() {

    isFeedBack(false);
    changeUpgrade();

    if ($("#drpAcceptanceSecond").val() == "DB0E117D553C4B7DA10FDE57B8AF772E" && (parseInt(getCurrentState()) === 4 || $("#hidIsAdmins").val() == "1")) {
        $("#btnApprovalSecond").show();
        $("#btnApprovalTwoSecond").hide();

    }
    else {
        $("#btnApprovalSecond").hide();

    }

    var valTime = $("#hidTimeApproval").val();
    var txtTime = $("#txtProgramTimeSecond").val();
    var val = $("#drpAcceptanceSecond").val();

    if ($("#drpAcceptanceSecond").val() != "DB0E117D553C4B7DA10FDE57B8AF772E") {
        if (txtTime != null) {
            txtTime = txtTime.replace(/-/g, "/");

            var oDateTxtTime = new Date(txtTime);
            var oDateValTime = new Date(valTime);
            if (oDateTxtTime > oDateValTime) {
                $("#btnApprovalTwoSecond").show();
                $("#btnFeedbackIsDraftSecond").hide();
                $("#btnFeedbackSaveSecond").hide();

            }
            else {
                $("#btnApprovalTwoSecond").hide();
                $("#btnFeedbackIsDraftSecond").show();
                $("#btnFeedbackSaveSecond").show();

            }
        }
    }
    else {
        $("#btnFeedbackIsDraftSecond").show();
        $("#btnFeedbackSaveSecond").show();
    }

}

function isFeedBack(isSecond) {
    ///	<summary>
    ///反馈用户 判断是否需要二次反馈
    ///	</summary>
    var suffix = "";
    if (isSecond) {
        suffix = "Second";
    }

    //    //有方案或以一次反馈
    //    if (getCurrentState() == 4 || getCurrentState() == 5) {

    //    } else {

    //    }

    if ($("#drpIsFeedBack" + suffix).val() == "F5EBD345B2F840039F056887B8B42492") {
        $(".spFeedbackTime" + suffix).show();
        $("#spTimesText").hide();
        $("#spTimes").hide();
    } else {
        $(".spFeedbackTime" + suffix).hide();
        $("#spTimesText").show();
        $("#spTimes").show();
    }
}
function changeUpgrade(isSecond) {
    ///	<summary>
    ///改变用户满意度改变是否升级
    ///	</summary>
    var suffix = "";
    if (isSecond)
        suffix = "Second";
    var val = $("#drpAcceptance" + suffix).val();
    if (val == 'DB0E117D553C4B7DA10FDE57B8AF772E') {
        $("#drpIsUpgrade" + suffix).val(1);
        if (parseInt(getCurrentState()) === 4 || $("#hidIsAdmins").val() == "1") {
            $("#btnApproval" + suffix).show();
            $("#btnApprovalTwoSecond").hide();
            $("#btnFeedbackIsDraftSecond").show();
            $("#btnFeedbackSaveSecond").show();
        }

    }
    else {

        $("#drpIsUpgrade" + suffix).val(0);
        $("#btnApproval" + suffix).hide();
        var valTime = $("#hidTimeApproval").val();
        var txtTime = $("#txtProgramTimeSecond").val();
        var val = $("#drpAcceptanceSecond").val();
        if (txtTime != null) {
            txtTime = txtTime.replace(/-/g, "/");

            var oDateTxtTime = new Date(txtTime);
            var oDateValTime = new Date(valTime);
            if (oDateTxtTime > oDateValTime) {
                $("#btnApprovalTwoSecond").show();
                $("#btnApprovalSecond").hide();
                $("#btnFeedbackIsDraftSecond").hide();
                $("#btnFeedbackSaveSecond").hide();
            }
            else {

                $("#btnApprovalTwoSecond").hide();
                $("#btnFeedbackIsDraftSecond").show();
                $("#btnFeedbackSaveSecond").show();
            }
        }

    }
}
function changeTimeApproval() {
    var valTime = $("#hidTimeApproval").val();
    var txtTime = $("#txtProgramTimeSecond").val();
    var val = $("#drpAcceptanceSecond").val();
    if (txtTime != null) {
        txtTime = txtTime.replace(/-/g, "/");
        var oDateTxtTime = new Date(txtTime);
        var oDateValTime = new Date(valTime);
        $("#btnApprovalTwoSecond");
        if (val != 'DB0E117D553C4B7DA10FDE57B8AF772E') {
            if (oDateTxtTime > oDateValTime) {
                $("#btnApprovalTwoSecond").show();
                $("#btnApprovalSecond").hide();
                $("#btnFeedbackIsDraftSecond").hide();
                $("#btnFeedbackSaveSecond").hide();
            }
            else {

                $("#btnApprovalTwoSecond").hide();
                $("#btnFeedbackIsDraftSecond").show();
                $("#btnFeedbackSaveSecond").show();
            }
        }
    }

}

function feedbackApproval(obj) {
    ///	<summary>
    ///异常结束的审批
    ///	</summary>
    feedback(obj, -1, true, true, false);

}

function feedbackTwoApproval(obj) {
    ///	<summary>
    ///延迟处理的审批
    ///	</summary>
    var txtContent = $("#txtContentSecond").val();
    if (!txtContent || $.trim(txtContent).length < 1) {
        alert("请输入反馈内容");
        $("#txtContentSecond").focus();
        return;
    }
    if (txtContent.length > 500) {
        alert("反馈内容不能超过500字符");
        return;
    }
    feedback(obj, -2, true, false, true);

}

function changeFeedBack(isSecond) {
    ///	<summary>
    ///用户选择升级后 控制二次反馈不可用
    ///	</summary>
    var suffix = "";
    if (isSecond) {
        suffix = "Second";
    }
    var drpIsFeedBack = $("#drpIsFeedBack" + suffix);
    if ($("#drpIsUpgrade" + suffix).val() == 1) {
        // drpIsFeedBack.attr("disabled", "disabled");
    }
    else {
        // drpIsFeedBack.removeAttr("disabled");

    }
}

function feedback(oEvent, state, isSecond, isApproval, isTwoApproval) {
    ///	<summary>
    ///反馈用户
    ///	</summary>
    ///	</param>
    ///	<param name="state" type="String">
    ///	状态 0 ：暂存  1：提交 2 修改  -1  中止  
    ///	</param>

    var suffix = "";
    if (isSecond) {
        suffix = "Second";
    }
    var drpAcceptance = $("#drpAcceptance" + suffix).val();
    var txtProgramTime = $("#txtProgramTime" + suffix).val();
    var drpIsFeedBack = $("#drpIsFeedBack" + suffix).val() == "F5EBD345B2F840039F056887B8B42492";
    var txtFeedbackTime = $("#txtFeedbackTime" + suffix).val();
    var txtContent = $("#txtContent" + suffix).val();
    var txtRemarks = $("#txtRemarks" + suffix).val();
    var hidFeedbackId = $("#hidFeedbackId" + suffix).val();
    var createTime = $("#hidCreateTime" + suffix).val();
    var isFlowApproval = isApproval ? true : false;
    var isFlowTwoApproval = isTwoApproval ? true : false;
    var drpIsUpgrade = $("#drpIsUpgrade" + suffix).val();

    if (txtContent.length > 500) {
        alert("反馈内容不能超过500字符");
        return;
    }
    if (txtRemarks.length > 500) {
        alert("备注不能超过500字符");
        return;
    }
    if (state > 0) {
        //验证
        if ($("#drpIsFeedBack").val() != "F5EBD345B2F840039F056887B8B42492") {
            if (!txtProgramTime || $.trim(txtProgramTime).length < 1) {
                alert("请输入计划处理完成时间");
                // $("#txtProgramTime" + suffix).focus();
                return;
            }
        }
        if (drpIsFeedBack) {
            if (!txtFeedbackTime || $.trim(txtFeedbackTime).length < 1) {
                alert("请输入二次反馈时间");
                //  $("#txtFeedbackTime" + suffix).focus();
                return;
            }
        }
        if (!txtContent || $.trim(txtContent).length < 1) {
            alert("请输入反馈内容");
            $("#txtContent" + suffix).focus();
            return;
        }

        if (isSecond)
            if (getCurrentState() < 4) {
                alert("该投诉还没确定方案不能继续操作！");
                return;
            }
    }

    if (state == 2) {
        if (!hidFeedbackId) {
            alert("请先提交反馈信息！");
            return;
        }
    }

    if (!isSecond && getCurrentState() < 4) {
        drpIsFeedBack = true;
    }

    if (isSecond) {
        txtFeedbackTime = "";
    }

    var data = {
        acceptance: drpAcceptance,
        programTime: txtProgramTime,
        isFeedBack: drpIsFeedBack,
        feedbackTime: txtFeedbackTime,
        content: txtContent,
        remark: txtRemarks,
        complaintId: $("#hidComplaintId").val(),
        submitState: state,
        isDraft: state == 0 ? true : false,
        feedbackId: hidFeedbackId,
        isFlowApproval: isFlowApproval,
        feedbackType: isSecond ? 2 : 1,
        isUpgrade: drpIsUpgrade,
        currentState: $("#hidComplaintState").val(),
        isFlowTwoApproval: isFlowTwoApproval
    }
    setButtouDisable(oEvent.id);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "Feedback.aspx/Modify",
        dataType: "json",
        data: JSON.stringify(data),
        success: callback,
        error: errorAlert
    });
}

