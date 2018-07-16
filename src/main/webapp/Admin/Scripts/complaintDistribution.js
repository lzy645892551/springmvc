function loadComplaintDistribution() {
    if ($("#selSolutionId").val() == "12C5F7DF8304462BB2321A6E9C3A2E30") {
        $("#remind").html("注意: 提交后，自动发送短信给地方公司人员");
        $("#selTwo").hide();
        $("#sel").show();
        $("#isNone").show();

    }
    else if ($("#selSolutionId").val() == "1A01E6B56CD64661A84362A6A48600A0") {

        $("#remind").html("注意：提交后，自动发送短信给业务人员");
        $("#selTwo").hide();
        $("#sel").show();
        $("#isNone").show();
    }
    else {
        $("#remind").html("");
        $("#sel").hide();
        $("#selTwo").show();
        $("#isNone").hide();
    }
}


function OpenEmployees() {
    openSelectEmployee('userid', 'txtBusinessName', 'organizationId', 'txtBusinessDepName', $("#hidProjectId").val(), $("#hidJobsId").val());
}




//提交方法
function AddComplaintDistribution(oEvent,isDraft, isUpdate) {

    var solutionId = $("#selSolutionId").val(); //解决方式
    var businessName = $("#txtBusinessName").val(); //业务人员
    var businessDepName = $("#txtBusinessDepName").val(); //业务部门
    var toResolve = $("#txtToResolve").val(); //解决方法
    var remarks = $("#txtRemarks").val(); //备注
    var hidComplaintId = $("#hidComplaintId").val(); //投诉表ID

    var businessId = $("#userid").val(); //业务人员ID
    var businessDepId = $("#organizationId").val(); //业务部门ID
    var userid = $("#userid").val(); //业务部门ID
    if (toResolve.length > 500) {
        alert("解决方式不能大于500字符");
        $("#txtToResolve").focus();
        return false;
    }
    if (remarks.length > 500) {
        alert("备注不能大于500字符");
        $("#txtRemarks").focus();
        return false;
    }
    if (isDraft != 1) {
        if ($("#selSolutionId").val() == "1A01E6B56CD64661A84362A6A48600A0") {
            if ($.trim($("#txtBusinessName").val()) == "") {
                alert("请输入业务人员。");
                $("#txtBusinessName").focus();
                return false;
            }
        }
        if ($("#selSolutionId").val() == "12C5F7DF8304462BB2321A6E9C3A2E30") {
            if ($.trim($("#txtBusinessName").val()) == "") {
                alert("请输入地方公司人员。");
                $("#txtBusinessName").focus();
                return false;
            }
        }
        if ($("#selSolutionId").val() == "4AA59ACA5D574E3FA5D150868649132C") {
            if ($.trim(toResolve) == "") {
                alert("请输入解决方法");
                $("#txtToResolve").focus();
                return false;
            }
        }
    }
    //$(":button").attr("disabled", "disabled");
    setButtouDisable(oEvent.id);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "ComplaintDistribution.aspx/AddComplaintDistribution",
        data: "{txtSolutionId:'" + solutionId + "',txtBusinessName:'" + businessName + "',txtBusinessDepName:'" + businessDepName + "',txtToResolve:'" + toResolve + "',txtRemarks:'" + remarks + "',isDraft:'" + isDraft + "',isUpdate:'" + isUpdate + "',hidComplaintId:'" + hidComplaintId + "',businessId:'" + businessId + "',businessDepId:'" + businessDepId + "',userid:'" + userid + "'}",
        dataType: "json",
        success: callback,
        error: errorAlert
    });
}
//列表选项
function Selecteds() {
    if ($("#selSolutionId ").val() == "1A01E6B56CD64661A84362A6A48600A0") {

        $("#businessName").html("业务人员：");
        $("#businessDep").html("业务部门：");
        $("#remind").html("注意：提交后，自动发送短信给业务人员");
        $("#sel").show();
        $("#selTwo").hide();
        $("#isNone").show();
    }
    else if ($("#selSolutionId ").val() == "12C5F7DF8304462BB2321A6E9C3A2E30") {

        $("#businessName").html("地方公司人员：");
        $("#businessDep").html("地方公司部门：");
        $("#remind").html("注意: 提交后，自动发送短信给地方公司人员");
        $("#sel").show();
        $("#selTwo").hide();
        $("#isNone").show();

    }
    else if ($("#selSolutionId ").val() == "4AA59ACA5D574E3FA5D150868649132C") {
        $("#remind").html("");
        $("#sel").hide();
        $("#selTwo").show();
        $("#isNone").hide();
    }
}