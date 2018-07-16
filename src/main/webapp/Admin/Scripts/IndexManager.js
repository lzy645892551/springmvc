function openWin(url, id, height, width) {

    var url = '/Admin/' + url + '?uuid=' + id;
    var s = window.showModalDialog(url, '受理投诉', "dialogWidth=" + width + "px;dialogHeight=" + height + "px;toolbar = no;status = no;scrollbars=no");


    if (s && s == 1) {
        {
            location.href = location.href + "?" + Math.random();
        }
    }
}

function HolidayWin(url, date, id, height, width) {

    var url = '/Admin/' + url + '?uuid=' + id + '&date=' + date;
    var s = window.showModalDialog(url, '受理投诉', "dialogWidth=" + width + "px;dialogHeight=" + height + "px;toolbar = no;status = no;scrollbars=no");

    if (s && s == 1) {
        {
            location.href = location.href + "?" + Math.random();
        }
    }
}

function page_Close() {
    if (window.parent != null) {
        window.parent.close();
    }
    else {
        window.close();
    }
}

