//保存Cookie,setCookie("CurrentUserCookie", $("#username").val(), 300, "/", "", false);
function setCookie(name, value, expires, path, domain, secure) {
    var today = new Date();
    today.setTime(today.getTime());
    if (expires) {
        expires = expires * 1000 * 60 * 60 * 24;
    }
    var expires_date = new Date(today.getTime() + (expires));
    document.cookie = name + '=' + escape(value) + ((expires) ? ';expires=' + expires_date.toGMTString() : '') + ((path) ? ';path=' + path : '') + ((domain) ? ';domain=' + domain : '') + ((secure) ? ';secure' : '');
}
//读取Cookie
function getCookie(name) {     
    if (document.cookie.length > 0) {
        cookieStart = document.cookie.indexOf(name + "=")
        if (cookieStart != -1) {
            cookieStart = cookieStart + name.length + 1
            cookieEnd = document.cookie.indexOf(";", cookieStart)
            if (cookieEnd == -1) cookieEnd = document.cookie.length
            return unescape(document.cookie.substring(cookieStart, cookieEnd))
        }
    }
    return ""
}
function renderTime(data) {
    var da = eval('new ' + data.replace('/', '', 'g').replace('/', '', 'g'));
    var year = da.getFullYear();
    var month = da.getMonth() + 1;
    var day = da.getDate();
    var hours = da.getHours();
    var minutes = da.getMinutes();
    var seconds = da.getSeconds();
    return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds; //注意Js里面Date的月份是从0开始记
} 
//request
Request = {
    QueryString: function(item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
}
//字符串格式化
String.prototype.format = function () {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++) {
        var regexp = new RegExp('\\{' + i + '\\}', 'gi');
        formatted = formatted.replace(regexp, arguments[i]);
    }
    return formatted;
};
//字符串去掉空格
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
//字符串去掉左空格
String.prototype.ltrim = function () {
    return this.replace(/(^\s*)/g, "");
}
//字符串去掉右空格
String.prototype.rtrim = function () {
    return this.replace(/(\s*$)/g, "");
}
//guid
function newGuid() {
    var guid = "";
    for (var i = 1; i <= 32; i++) {
        var n = Math.floor(Math.random() * 16.0).toString(16);
        guid += n;
        if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
            guid += "-";
    }
    return guid;
}

function Searchid(datakey, type) {
    var dto = {
        "datakey": datakey, "type": type
    }
    var json = "0";
    try {
        $.ajax({
            url: "/HTML/WS/WorkflowWS.asmx/Searchid",
            type: "POST",
            dataType: "json",
            async: false,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(dto),
            success: function (data) {
                var jsonstring = JSON.parse(data.d);
                json = jsonstring.Success;
            }
        });
        return json;
    }
    catch (e) { return json; }

}

function geturlflow(sBusinessGUID, type) {
    var url = "";
    switch (type) {

        case '增减权益人':

            url = "../../HTML/workflow/ApprovalListView.aspx?ran=" + Math.random() + "&e=400&datakey=" + sBusinessGUID

            break;

        case "换房":

            url = "../../HTML/workflow/ApprovalListView.aspx?ran=" + Math.random() + "&e=300&datakey=" + sBusinessGUID

            break;

        case "退房":

            url = "../../HTML/workflow/ApprovalListView.aspx?ran=" + Math.random() + "&e=200&datakey=" + sBusinessGUID

            break;

        case "特例折扣":

            url = "../../HTML/workflow/ApprovalListView.aspx?ran=" + Math.random() + "&e=500&datakey=" + sBusinessGUID

            break;

        default:
            url = "../../HTML/workflow/ApprovalListView.aspx?ran=" + Math.random() + "&e=100&datakey=" + sBusinessGUID
    }
    return url;
}

//特殊字符过滤
function RemoveBad(strTemp) {
    strTemp = strTemp.replace("/", "").replace("<", "").replace(">", "").replace("?", "").replace("%", "")
                             .replace(";", "").replace("'", "").replace("+", "").replace("-", "").replace("&", "");
    return strTemp;
}

function disableEnter(event) {
    var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    if (keyCode == 13) {
        return false;
    }
}