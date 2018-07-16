
//解析所属项目ID和名称，返回一个Array
function parseSelectedHistoryBidd(IdNames) {
    var arr = new Array();
    var Ids = "", Names = "";

    if (IdNames && IdNames.length > 0) {
        var arrIdName = IdNames.split("!**!");
        if (arrIdName.length > 0) {
            for (var i = 0; i < arrIdName.length; i++) {
                var curIdName = arrIdName[i];
                if (curIdName.length > 0) {
                    var arrItem = curIdName.split("#**#");
                    if (arrItem.length > 0) {
                        if (Ids.length > 0)
                            Ids += ",";
                        if (Names.length > 0)
                            Names += "^";
                        Ids += arrItem[0];
                        Names += arrItem[1];
                    }
                }
            }
        }
    }
    arr[0] = Ids;
    arr[1] = Names;
    return arr;
}



function openSelectedProduct(preUrl, isCenter,isAdmin,pageindex) {
    var url = "SelectProject.aspx?isCenter=" + isCenter + "&isAdmin=" + isAdmin + "&pageindex=" + pageindex + "";
    if (preUrl != null && preUrl != "") {
        url = preUrl + url;
    }
    return openModeDialog(url, 620, 700);
}
function openModeDialog(url, height, width) {
    return window.showModalDialog(url, "dialogHeight: " + height + "px; dialogWidth: " + width + "px;edge: Raised; center: Yes; help: No; resizable: No; scrollbars:No");
}



function setValue(objId, value) {
    var obj = getObject(objId);
    if (obj)
        obj.value = value;
}

function getObject(objId) {
    return document.getElementById(objId);
}

function selectProduct() {

    var hidCenter = $("#hidCenter").val();
    var hidIsAdmin = $("#hidIsAdmin").val();
    var hidLogo = $("#hidLogo").val();
    var IdNames = openSelectedProduct('', hidCenter, hidIsAdmin, hidLogo);

    if (IdNames) {
        var arr = parseSelectedHistoryBidd(IdNames);

        if (arr && arr.length > 1) {
            var id = arr[0];
            var name = arr[1];

            setValue('hidProductId', id);
            setValue('hidProductName', name);
            setValue('txtRespectivePro', name.replace(/\^/g, '\n'));
        }
    }
}


function selectIndexProduct(isCenter, isAdmin) {
    var pageindex = 0;
    var hidIsAdmin = $("#hidIsAdmin").val();
    var hidIsCenter = $("#hidIsCenter").val();

    var IdNames = openSelectedProduct('../Business/', hidIsCenter, hidIsAdmin, pageindex);


    if (IdNames) {
        var arr = parseSelectedHistoryBidd(IdNames);

        if (arr && arr.length > 1) {
            var id = arr[0];
            var name = arr[1];

            setValue('hidProductId', id);
            setValue('hidProductName', name);
            setValue('txtRespectivePro', name.replace(/\^/g, '\n'));
        }
    }
}

function selectIndexProducts() {
    var pageindex = 0;
    var hidIsAdmin = "";
    var hidIsCenter = "";

    var IdNames = openSelectedProduct('../Business/', hidIsCenter, hidIsAdmin, pageindex);


    if (IdNames) {
        var arr = parseSelectedHistoryBidd(IdNames);

        if (arr && arr.length > 1) {
            var id = arr[0];
            var name = arr[1];

            setValue('hidProductId', id);
            setValue('hidProductName', name);
            setValue('txtRespectivePro', name.replace(/\^/g, '\n'));
        }
    }
}

function selectProductName(isCenter, isAdmin) {
    var pageindex = 0;
    var hidIsAdmin = "";
    var hidIsCenter = "";

    var IdNames = openSelectedProduct('../Business/', hidIsCenter, hidIsAdmin, pageindex);


    if (IdNames) {
        var arr = parseSelectedHistoryBidd(IdNames);

        if (arr && arr.length > 1) {
            var id = arr[0];
            var name = arr[1];

            setValue('hidProductIdSelect', id);
            setValue('', name);
            setValue('txtProjectSelect', name.replace(/\^/g, '\n'));
        }
    }
}



function getSelectValue() {
    var getSelectValue = $("#getSelectValue").val();
    setValue('hidProductIdSelect', getSelectValue);  
}