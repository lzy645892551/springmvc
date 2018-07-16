
function getPersonRole(value) {





    $.post("GradingComplaint.aspx?complaintid=000", { type: "GetSupervisionComplaintLeve", uuid: value }, function (data) {

        var items = data.split(";");
        $("#txtPersonRole").val(items[1]);
        $("#txtPersonRoleId").val(items[0]);
    });

    //    if (value == "692B94072F114C2299BACB35B4CB0499") {
    //        document.getElementById('txtPersonRole').value = "广场营运部经理";
    //    }
    //    else if (value == "18F3DD007B7C4F1B8B35B9943FCC957F") {
    //        document.getElementById('txtPersonRole').value = "广场营运副总";
    //    }
    //    else {
    //        document.getElementById('txtPersonRole').value = "广场总经理";
    //    }
}



function AddComplaints(isDraft,id) {

    var customerType = $("#selClientType").val();
    var complaintCount = $("#txtComplaintNumber").val();
    var complaintName = $("#txtComplainantName").val();

    var contactFirst = $("#txtPreferred").val();
    var contactOther = $("#txtOther").val();
    var email = $("#txtEmailAddress").val();



    var complaintSource = $("#drpComplaintSource").val();
    var complaintContent = $("#txtComplaintContent").val();
    var complaintNumber = "";
    var projectId = $("#hidProductId").val();
    var projectName = $("#txtRespectivePro").val();
    var hidComplaintId = $("#hidComplaintId").val();

    var txtBusinessName = $("#txtBusinessName").val();
    var drpBusinessType = $("#drpBusinessType").val();
    var txtComplaintRemark = $("#txtComplaintRemark").val();

    if (isDraft != 0) {


        if ($.trim($("#txtComplaintNumber").val()) == "") {
            alert("请输入投诉次数");
            $("#txtComplaintNumber").focus();
            return false;
        }
        if ($.trim($("#txtComplainantName").val()) == "") {
            alert("请输入投诉人姓名");
            $("#txtComplainantName").focus();
            return false;
        }

        if ($.trim($("#txtComplaintContent").val()) == "") {
            alert("请输入投诉内容");
            $("#txtComplaintContent").focus();
            return false;
        }
   
    }

    if ($.trim($("#txtRespectivePro").val()) == "") {
        alert("请选择所属项目");
        $("#txtRespectivePro").focus();
        return false;
    }

    if (complaintContent.length > 500) {
        alert("投诉内容不能大于500字符");
        $("#txtComplaintContent").focus();
        return false;
    }

    if (txtComplaintRemark.length > 500) {
        alert("备注不能大于500字符");
        $("#txtComplaintRemark").focus();
        return false;
    }

    if (complaintName.length > 200) {
        alert("投诉人姓名不能大于200字符");
        $("#complaintName").focus();
        return false;
    }

//    if (txtBusinessName.length > 200) {
//        alert("商户名称及编号不能大于200字符");
//        $("#txtBusinessName").focus();
//        return false;
//    }



    

    setButtouDisable(id);

    var data = "{customerType:'" + customerType + "',projectId:'" + projectId + "',projectName:'" + projectName + "',complaintCount:'" + complaintCount + "',complaintName:'" + complaintName + "',contactFirst:'" + contactFirst + "',contactOther:'" + contactOther + "',email:'" + email + "',complaintSource:'" + complaintSource + "',complaintContent:'" + complaintContent + "',isDraft:'" + isDraft + "',hidComplaintId:'" + hidComplaintId + "',txtComplaintRemark:'" + txtComplaintRemark + "',txtBusinessName:'" + txtBusinessName + "',drpBusinessType:'" + drpBusinessType + "'}";
  
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "HandleComplaint.aspx/AddComplain",
        data: data,
        dataType: "json",
        success: callback,
        error: errorAlert
    });
}
function UpdateComplaint(id) {


    var customerType = $("#selClientType").val();
    var complaintCount = $("#txtComplaintNumber").val();
    var complaintName = $("#txtComplainantName").val();

    var contactFirst = $("#txtPreferred").val();
    var contactOther = $("#txtOther").val();
    var email = $("#txtEmailAddress").val();



    var complaintSource = $("#drpComplaintSource").val();
    var complaintContent = $("#txtComplaintContent").val();
    var complaintNumber = "";
    var projectId = $("#hidProductId").val();
    var projectName = $("#txtRespectivePro").val();
    var hidComplaintId = $("#hidComplaintId").val();

    var txtComplaintRemark = $("#txtComplaintRemark").val();
    var txtBusinessName = $("#txtBusinessName").val();
    var drpBusinessType = $("#drpBusinessType").val();


    if (complaintContent.length > 500) {
        alert("投诉内容不能大于500字符");
        $("#txtComplaintContent").focus();
        return false;
    }

    if (txtComplaintRemark.length > 500) {
        alert("备注不能大于500字符");
        $("#txtComplaintRemark").focus();
        return false;
    }

    if ($.trim($("#txtRespectivePro").val()) == "") {
        alert("请选择所属项目");
        $("#txtRespectivePro").focus();
        return false;
    }

    if ($.trim($("#txtComplaintNumber").val()) == "") {
        alert("请输入投诉次数");
        $("#txtComplaintNumber").focus();
        return false;
    }
    if ($.trim($("#txtComplainantName").val()) == "") {
        alert("请输入投诉人姓名");
        $("#txtComplainantName").focus();
        return false;
    }
    //    if ($.trim($("#txtFeedbackTime").val()) == "") {
    //        alert("请选择计划反馈时间");
    //        //                $("#txtFeedbackTime").focus();
    //        return false;
    //    }
    if ($.trim($("#txtComplaintContent").val()) == "") {
        alert("请输入投诉内容");
        $("#txtComplaintContent").focus();
        return false;
    }

    if (complaintName.length > 200) {
        alert("投诉人姓名不能大于200字符");
        $("#complaintName").focus();
        return false;
    }

//    if (txtBusinessName.length > 200) {
//        alert("商户名称及编号不能大于200字符");
//        $("#txtBusinessName").focus();
//        return false;
//    }

    setButtouDisable(id);
    var data = "{customerType:'" + customerType + "',projectId:'" + projectId + "',projectName:'" + projectName + "',complaintCount:'" + complaintCount + "',complaintName:'" + complaintName + "',contactFirst:'" + contactFirst + "',contactOther:'" + contactOther + "',email:'" + email + "',complaintSource:'" + complaintSource + "',complaintContent:'" + complaintContent + "',hidComplaintId:'" + hidComplaintId + "',txtComplaintRemark:'" + txtComplaintRemark + "',txtBusinessName:'" + txtBusinessName + "',drpBusinessType:'" + drpBusinessType + "'}";
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "HandleComplaint.aspx/UpdateComplain",
        data: data,
        dataType: "json",
        success: callback,
        error: errorAlert
    });
}

function AddGradingComplaint(isDraft,isApproval,id) {
    var drpResponsibility = $("#drpResponsibility").val();
    var drpGradingReason = "";
    if ($.trim($("#drpResponsibility").val()) == "D375482D8ADD4D8B9D57E4B554FEB9FC") {
        drpGradingReason = $("#drpComplaintLevelChild").val();              //有效定级原因
    }
    else {
        drpGradingReason = $("#drpGradingReason").val();                     //无效定级原因
    }
    var drpComplaintSubjectChildId = $("#drpComplaintSubjectMainIdChild").val();
    var drpComplaintLevel = $("#drpComplaintLevel").val();
    var txtPersonRole = $("#txtPersonRole").val();
    var drpComplaintSubjectMainId = $("#drpComplaintSubjectMainId").val(); 
    var selGradingReasons = $("#drpComplaintLevelChild").val();
    var txtGradingDescription = $("#txtGradingDescription").val();
    var isDraft = isDraft;
    var hidComplaintId = $("#hidComplaintId").val();
    var txtGradingRemark = $("#txtGradingRemark").val();
    var hiddenPersonRole = $("#txtPersonRoleId").val();

    
    if (txtGradingDescription.length > 500) {
        alert("投诉内容不能大于500字符");
        $("#txtGradingDescription").focus();
        return false;
    }

    if (txtGradingRemark.length > 500) {
        alert("备注不能大于500字符");
        $("#txtGradingRemark").focus();
        return false;
    }


    setButtouDisable(id);

    var data = {
        responsibility: drpResponsibility,
        gradingReason: drpGradingReason,
        complaintSubjectChildId: drpComplaintSubjectChildId,
        complaintLevel: drpComplaintLevel,
        personRole: txtPersonRole,
        gradingReasons: selGradingReasons,
        gradingDescription: txtGradingDescription,
        isDraft: isDraft,
        hidComplaintId: hidComplaintId,
        txtGradingRemark: txtGradingRemark,
        hiddenPersonRole: hiddenPersonRole,
        drpComplaintSubjectMainId: drpComplaintSubjectMainId,
        isApproval:isApproval
    }


    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "GradingComplaint.aspx/AddGradingComplaint",
        dataType: "json",
        data: JSON.stringify(data),
        success: callback,
        error: errorAlert
    });

}

function UpdateGradingComplaint(id) {
    var drpResponsibility = $("#drpResponsibility").val();
    var drpGradingReason = "";
    if ($.trim($("#drpResponsibility").val()) == "D375482D8ADD4D8B9D57E4B554FEB9FC") {
        drpGradingReason = $("#drpComplaintLevelChild").val();              //有效定级原因
    }
    else {
        drpGradingReason = $("#drpGradingReason").val();                     //无效定级原因
    }
    var drpComplaintSubjectChildId = $("#drpComplaintSubjectMainIdChild").val();
    var drpComplaintLevel = $("#drpComplaintLevel").val();
    var txtPersonRole = $("#txtPersonRole").val();
    var drpComplaintSubjectMainId = $("#drpComplaintSubjectMainId").val();
    var selGradingReasons = $("#drpComplaintLevelChild").val();
    var txtGradingDescription = $("#txtGradingDescription").val();
    var hidComplaintId = $("#hidComplaintId").val();
    var txtGradingRemark = $("#txtGradingRemark").val();
    var hiddenPersonRole = $("#txtPersonRoleId").val();

    var hidGradingId = $("#hidGradingId").val();
    if (txtGradingDescription.length > 500) {
        alert("投诉内容不能大于500字符");
        $("#txtGradingDescription").focus();
        return false;
    }

    if (txtGradingRemark.length > 500) {
        alert("备注不能大于500字符");
        $("#txtGradingRemark").focus();
        return false;
    }

    setButtouDisable(id);

    var data = {
        responsibility: drpResponsibility,
        gradingReason: drpGradingReason,
        complaintSubjectChildId: drpComplaintSubjectChildId,
        complaintLevel: drpComplaintLevel,
        personRole: txtPersonRole,
        gradingReasons: selGradingReasons,
        gradingDescription: txtGradingDescription,
        hidComplaintId: hidComplaintId,
        txtGradingRemark: txtGradingRemark,
        hiddenPersonRole: hiddenPersonRole,
        drpComplaintSubjectMainId: drpComplaintSubjectMainId,
        hidGradingId: hidGradingId
    }

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "GradingComplaint.aspx/UpdateGradingComplaint",
        dataType: "json",
        data: JSON.stringify(data),
        success: callback,
        error: errorAlert
    });

}



function getResponsibility() {
    var responsibility = document.getElementById("drpResponsibility");
    var result = responsibility[responsibility.selectedIndex].text;
    
    if (result == "有效投诉") {
        document.getElementById('gradingReasonMainDiv').style.display = "none";
        document.getElementById('gradingReasonChildDiv').style.display = "none";
        document.getElementById('complaintSubjectMainDiv').style.display = "";
        document.getElementById('complaintSubjectChildDiv').style.display = "";
        document.getElementById('sel').style.display = "";
        document.getElementById('selTwo').style.display = "";
        document.getElementById('btnSave').style.display = "";
        document.getElementById('btnIsDraftSecond').style.display = "";
   
    }
    else {
        document.getElementById('complaintSubjectMainDiv').style.display = "none";
        document.getElementById('complaintSubjectChildDiv').style.display = "none";
        document.getElementById('gradingReasonMainDiv').style.display = "";
        document.getElementById('gradingReasonChildDiv').style.display = "";
        document.getElementById('sel').style.display = "none";
        document.getElementById('selTwo').style.display = "none";
        document.getElementById('btnSave').style.display = "none";
        document.getElementById('btnIsDraftSecond').style.display = "none";

    }
}

function IsCheckType(files) {
    var myReg = /^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.exe|.EXE|.sql|.cs|.cdm|.aspx|.dll|.msi)$/;
    if (myReg.test(files.value)) {
        if (files.value != '') {
            alert("不能上传非法文件");
            files.outerHTML = files.outerHTML.replace(files.value, "");
            return false;
        }
    }
    else {
        return true;
    }
}

var data4;
function gradingLoad() {

    var customerType = $("#hidCustomerType").val();
    
    if (customerType == "02852278989C43A1BA019486F242D48E") {
        setSubjectMain(data, "drpComplaintSubjectMainId");
        data4 = data;
    }
    else if (customerType == '74CD12115BE14904ABCF461428A46703') {
        setSubjectMain(da3, "drpComplaintSubjectMainId");
        data4 = da3;
    }
    else {
        setSubjectMain(da2, "drpComplaintSubjectMainId");
        data4 = da2;
    }
    
    setSubjectMain(da1, "drpComplaintLevel");
    var csm = $("#hidComplaintSubjectMainIdChild").val();
    for (var i = 0; i < data4.length; i++) {
        var chiilds = data4[i].Childs;
        for (var j = 0; j < chiilds.length; j++) {
            if (chiilds[j].Uuid == csm) {
                $("#drpComplaintSubjectMainId").val(data4[i].Uuid);
                setChild(data4[i].Uuid, "drpComplaintSubjectMainIdChild", data4);
                $("#drpComplaintSubjectMainIdChild").val(csm);
            }
        }


        if ($("#hidScript").val() == 1) getResponsibility();
    }

    var cml = $("#hidComplaintLevelChild").val();
    for (var i = 0; i < da1.length; i++) {
        var cmlids = da1[i].Childs;
        for (var j = 0; j < cmlids.length; j++) {
            if (cmlids[j].Uuid == cml) {
                $("#drpComplaintLevel").val(da1[i].Uuid);
                setChild(da1[i].Uuid, "drpComplaintLevelChild", da1);
                $("#drpComplaintLevelChild").val(cml);
            }
        }
    }

    var complaintlevel = $("#hidComplaintLevel").val();
    if ($.trim($("#hidComplaintLevel").val()) != "" && $.trim($("#hidComplaintLevelChild").val()) == "") {
        $("#drpComplaintLevel").val(complaintlevel);
    }
}

function getSelectValue() {
    var selectValue = $("#selClientType").val();
    var str = selectValue;
}



//function Approval(oEvent) {

//    var hidComplaintId = $("#hidComplaintId").val(); //投诉表ID



//    setButtouDisable(oEvent.id);
//    $.ajax({
//        type: "POST",
//        contentType: "application/json",
//        url: "GradingComplaint.aspx/Approval",
//        data: "{hidComplaintId:'" + hidComplaintId + "'}",
//        dataType: "json",
//        success: callback,
//        error: errorAlert

//    });
//}


