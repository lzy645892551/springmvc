function AddSolveComplaint(oEvent, isDraft) {
    var solve = $.trim($("#txtSolveSituation").val());
    var solveTime = $.trim($("#txtsoveDate").val());
    var sovemoney = $.trim($("#txtsovemoney").val());
    var remarks = $.trim($("#txtRemarks").val());
    var complaintId = $.trim($("#hidComplaintId").val());
    if (isDraft == "0") {
        if (solveTime == "" || solveTime == null) {
            alert("实际处理完成时间不能为空");
            return false;
        }
        if (solve == "" || solve == null) {
            alert("处理情况不能为空");
            return false;
        }
        if (sovemoney != "" || sovemoney != null) {
            //^(([1-9]\d*)|0)(\.\d{2})?$
            var patrn = /^(0|[1-9]\d{0,15})(\.\d{0,2})?$/;
            if (!patrn.test(sovemoney)) {
                alert("费用输入格式不正确！");
                return false;
            }
        }
    }
    if (solve != "" || solve != null) {
        if (solve.length > 1000) {
            alert("处理情况输入超过有限长度,最多1000个字符");
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
        url: "SolveComplaint.aspx/AddSolveComplaint",
        data: "{solveSituation:'" + solve + "',solveTime:'" + solveTime + "',sovemoney:'" + sovemoney + "',remarks:'" + remarks + "',isDraft:'" + isDraft + "',complaintId:'" + complaintId + "'}",
        dataType: "json",
        success: callback,
        error: errorAlert
    });
}
function UpdateSolveComplaint(oEvent) {
    var solve = $.trim($("#txtSolveSituation").val());
    var solveTime = $.trim($("#txtsoveDate").val());
    var sovemoney = $.trim($("#txtsovemoney").val());
    var remarks = $.trim($("#txtRemarks").val());
    if (solveTime == "" || solveTime == null) {
        alert("实际处理完成时间不能为空");
        return false;
    }
    if (solve == "" || solve == null) {
        alert("处理情况不能为空");
        return false;
    }
    if (solve.length > 1000) {
        alert("处理情况输入超过有限长度,最多1000个字符");
        return false;
    }
    if (remarks.length > 500) {
        alert("备注输入超过有限长度,最多500个字符");
        return false;
    }
    var data = {
        solveSituation: solve,
        solveTime: solveTime,
        sovemoney: sovemoney,
        remarks: remarks,
        complaintId: $("#hidComplaintId").val()
    }
    //$(":button").attr("disabled", "disabled");
    setButtouDisable(oEvent.id);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "SolveComplaint.aspx/UpdateSolveComplaint",
        data: JSON.stringify(data),
        dataType: "json",
        success: callback,
        error: errorAlert
    });
} 