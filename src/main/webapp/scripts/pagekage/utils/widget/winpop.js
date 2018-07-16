//关闭弹框
function PopClose() {
try
{
    jQuery(".tip_iframe").remove();
    jQuery(".tip_div").remove();
 }catch(ex){}
}
//打开弹框
function PopShow(info) {
    PopClose();
    var bd = jQuery(document.body);
    var position = bd.position();
    jQuery(document.body).append("<iframe class='tip_iframe' frameborder='0'></iframe><div class='tip_div' ><table class='tip_table'><tr><td colspan=2 class='tip_title'></td></tr><tr><td class='tip_img'></td><td class='tip_context'></td></tr><tr ><td class='tip_buttoms' colspan=2></td></tr></table></div>");
    jQuery(".tip_title").html(info.Title);
    jQuery(".tip_context").html(info.Tip);
    var iframeuqid = jQuery(".tip_iframe:last").attr("uniqueID");
    if (iframeuqid == undefined)
        iframeuqid = jQuery(".tip_iframe:last")[0].uniqueID;
    var dvuqid = jQuery(".tip_div:last").attr("uniqueID");
    if (dvuqid == undefined)
        dvuqid = jQuery(".tip_div:last")[0].uniqueID;
    if (typeof info.Pic != "undefined")
        jQuery(".tip_img").css("background-image", "url(../Themes/Default/Images/message/" + info.Pic + ")");
    else
        jQuery(".tip_img").hide();
    if (typeof info.Buttons == "undefined" || info.Pic =="Wait.gif")
        jQuery(".tip_buttoms").parent().hide();
    else {
        for (var i = 0; i < info.Buttons.length; i++) {
            var name = info.Buttons[i].Name;

            jQuery(".tip_buttoms").append("<input class='tip_buttom' type='button'  value='" + name + "'/>");
            jQuery(".tip_buttom[value='" + name + "']").bind("click", { ev: info.Buttons[i].Event, unq: [iframeuqid, dvuqid] },
            function (event) {
                if (typeof event.data.ev == "function") event.data.ev();
                jQuery(".tip_iframe").remove();
                jQuery(".tip_div").remove();
                //jQuery(this).find("iframe[uniqueID='" + event.data.unq[0] + "']").remove();
                //jQuery(this).find("div[uniqueID='" + event.data.unq[1] + "']").remove();
            });

        }
        if (typeof info.BeforeShowEv == "function")
            info.BeforeShowEv();
      }
    }
//页面验证
function SysVerify(fun) {
    var issuccess = true;
    if (typeof Page_ClientValidate == "function") {
        Page_ClientValidate();
        ValidatorUpdateIsValid();
        issuccess = Page_IsValid
    }
    if (typeof fun == "function")
        issuccess = issuccess && fun();
    return issuccess;
}


//等待提示
function SysWait(desc) {
    var tipinfo = { Pic: "Wait.gif", Title: "请等待...", Tip: desc };
    self.PopShow(tipinfo);
}
//提交等待
function SysSubmitWait(desc, verify) {
    var issuccess = SysVerify(verify);
    if(issuccess)
       SysWait(desc);
    return issuccess;
}

//确定是否后提交数据
function SysSubmitConfirm(bindobjid, desc, verify) {
    jQuery(document).ready(function () {
        var bt = jQuery("#" + bindobjid)[0]
        if (bt.disabled == true) return;
        var oldev = bt.onclick;
        bt.onclick = function () {
            var issuccess = true;
            if (typeof verify == "function") {
                issuccess = SysVerify(verify);
            }
            if (issuccess) {
                SysConfirm(desc, function () {
                    oldev();
                    SysWait("正在处理");
                })
            };
        };
    });
}
//确定弹出
function SysConfirm(desc, tevent,fevent) {
    var tipinfo = { Pic: "Remind.jpg", Title: "确定", Tip: desc, Buttons: [{ Name: "确定", Event: tevent }, { Name: "取消", Event: fevent}] };
    self.PopShow(tipinfo);

}
//弹出提示信息
function SysAlter(desc, even) {
    var ev = even;
    if (typeof even == "undefined") ev = function () { };
    var tipinfo = { Pic: "Remind.jpg", Title: "信息", Tip: desc, Buttons: [{ Name: "确定", Event: ev}] };
    self.PopShow(tipinfo);

}
//录入信息提示层
function SysInput(html, bts) {
    var tipinfo = { Title: "编辑录入",Tip:html, Buttons: bts };
    self.PopShow(tipinfo);
}

function Init() {
    
}
