
function getAllRowValue(grdId) {
    var betweenProductEvent = "!**!";
    var reg = /^(!\*\*!){1,}|(!\*\*!){1,}$/g;
    var tempCtrl = document.getElementById("<%=txtFormerProductInfo.ClientID %>");
    var tbl = document.getElementById(grdId);
    var hidId = document.getElementById('hidProductID');
    var hidName = document.getElementById('hidProductName');
    var hiduuid = document.getElementById('hiduuID');
    if (tbl != null) {
        for (var i = 1; i < tbl.rows.length; i++) {
            var check = tbl.rows[i].cells[0].children[0];
            if (check.checked) {
                var tblRow = check.parentNode.parentNode;
                hidName.value = tblRow.cells[2].innerHTML;
                hidId.value = tblRow.cells[1].innerHTML;
                var productResult = hidId.value + "#**#" + hidName.value;
                tempCtrl.value = tempCtrl.value.replace(productResult, "");
                tempCtrl.value = tempCtrl.value.replace(reg, "");
                tempCtrl.value += betweenProductEvent + productResult;
                window.returnValue = tempCtrl.value;
                page_Close();
                break;
            }
        }
    }

}

function SignCheck(cbox) {
    var obj = document.getElementsByTagName("input");
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].type == "checkbox") {
            obj[i].checked = false;
        }
        var sid = cbox.id;
        document.getElementById(sid).checked = true;
    }
}


function Page_NoClose() {
    if (window.event.keyCode == 13 || window.event.keyCode == 32) {
        window.event.keyCode = 9; method = "post"
    }
}

function getSelectTypeValue() {
    var selectValue = $("#selClientType").val();
    var str = selectValue;
}


