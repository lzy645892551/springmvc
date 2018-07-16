function OpenEmployeeTwo() {
    openSelectEmployee('userid', 'txtResponsiblePerson', 'organizationId', 'txtResponsibleDepartment', $("#hidProjectId").val());
}

//提交方法



function AddDetermine(oEvent,isDraft, isUpdate) {
    var programmeContent = $("#txtProgrammeContent").val(); //方案内容
    var processingTime = $("#txtProcessingTime").val(); //建议处理时间
    var responsiblePerson = $("#txtResponsiblePerson").val(); //责任人
    var responsibleDepartment = $("#txtResponsibleDepartment").val(); //责任部门
    var remarks = $("#txtRemarks").val(); //备注
    var hidComplaintId = $("#hidComplaintId").val(); //投诉表ID
    var userid = $("#userid").val(); //
    var departmentUuid = $("#organizationId").val(); //
    if (programmeContent.length > 500) {
        alert("方案内容不能大于500字符");
        $("#txtToResolve").focus();
        return false;
    }
    if (remarks.length > 500) {
        alert("备注不能大于500字符");
        $("#txtRemarks").focus();
        return false;
    }

    if (isDraft != 1) {
        if ($.trim($("#txtProgrammeContent").val()) == "") {
            alert("请输入方案内容");
            $("#txtProgrammeContent").focus();
            return false;
        }
        if ($.trim($("#txtProcessingTime").val()) == "") {
            alert("请输入建议处理时间");

            return false;
        }
        if ($.trim($("#txtResponsiblePerson").val()) == "") {
            alert("请输入责任人");
            $("#txtResponsiblePerson").focus();
            return false;
        }
    }
    //$(":button").attr("disabled", "disabled");
    setButtouDisable(oEvent.id);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "Determine.aspx/AddDetermine",
        data: "{txtProgrammeContent:'" + programmeContent + "',txtProcessingTime:'" + processingTime + "',txtResponsiblePerson:'" + responsiblePerson + "',txtResponsibleDepartment:'" + responsibleDepartment + "',txtRemarks:'" + remarks + "',isDraft:'" + isDraft + "',isUpdate:'" + isUpdate + "',hidComplaintId:'" + hidComplaintId + "',userid:'" + userid + "',departmentUuid:'" + departmentUuid + "'}",
        dataType: "json",
        success: callback,
        error: errorAlert
        
    });
}