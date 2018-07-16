function AddApproval(oEvent, isType) {
    var content = $("#txtContent").val(); //

    var uuid = $("#Uuid").val(); //
    var flowAlias = $("#hidFlowAlias").val(); //
    if ($.trim(content) == "") {
        alert("请输入处理意见");
        $("#txtContent").focus();
        return false;
    }
    if (content.length > 1000) {
        alert("处理意见不能大于1000字符");
        $("#txtContent").focus();
        return false;
    }
    //$(":button").attr("disabled", "disabled");
    setButtouDisable(oEvent.id);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "Approval.aspx/AddApproval",
        data: "{Content:'" + content + "',isType:'" + isType + "',Uuid:'" + uuid + "',FlowAlias:'" + flowAlias + "'}",
        dataType: "json",
        success: callbackApp,
        error: errorAlert

    });
}

$("#floatList").hide();
$("#imgJtd1").toggle(function () {
    $("#floatList").toggle(600);
    this.src = "/images/float_s.png";
}, function () {
    $("#floatList").toggle(600);
    this.src = "/images/float_s1.png";
});


function loadApproval() {
    $("#floatList").load("/Business/ApprovalList.aspx?t=" + Math.random() + " #divTj1", '', function () {
      
    });
}




function callbackApp(result) {
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

            if (r.indexOf("成功") >= 0) {
              
                window.close();
            }


        };
    }
}

$(function () {


    loadApproval();
});

