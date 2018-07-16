
function showMessage() {
    var dialogBox2 = new Dialog($("#errorMessage").html(), {
        "width": "600px",
        "title": "详细信息",
        'modal': true,
        "closeModal": false
    });
}

function toDefaultPage() {
    if ($("#hidIsBusiness").val() == 1) {
        page_Close();
    } else {
        location.href = "/default.aspx";
    }
}
function scall() {
    try {
        document.getElementById("Javascript.Div2").style.top = (document.documentElement.scrollTop + (document.documentElement.clientHeight - document.getElementById("Javascript.Div2").offsetHeight) / 2) + "px";
        document.getElementById("Javascript.Div2").style.left = (document.documentElement.scrollLeft + (document.documentElement.clientWidth - document.getElementById("Javascript.Div2").offsetWidth) / 2) + "px";
    } catch (e) {

    }
}

function setCenter() {
    $(function () {
        window.onscroll = scall;
        window.onresize = scall;
        window.onload = scall;
        scall();
    });
}

$(function () {
    scall();
});
