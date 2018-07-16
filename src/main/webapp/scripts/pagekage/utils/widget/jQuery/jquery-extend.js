//添加tab标签扩展
//KANGJIAN 2011-09-21
//参数 name 标签名称,title 标签显示描述,selected 标签是否选中
//用法:  jQuery(document.body).AddTab([{ name:'ziliao', title: "合同资料", selected: true }, {name:'attach', title: "附件"}]);
//事件: 页面截获函数 Sys_TabSelectChange(选中的tab对象,可以获取到name和selected属性)
jQuery.fn.extend({
    AddTab: function (tabs) {
        var html = "<div id='mtbdiv' class='mtb'>";
        jQuery.each(tabs, function () {
            var clsnm = "mtb_";
            var tab = jQuery(this)[0];
            var isselected = (tab.selected == true);
            if (isselected) {
                clsnm = "mtb_sel_";
            }
            html += "<div class='mtb_tab' name='" + tab.name + "' selected=" + isselected + ">";
            html += "<div class=" + clsnm + "l ></div>";
            html += "<div class=" + clsnm + "m >" + tab.title + "</div>";
            html += "<div class=" + clsnm + "r ></div>";
            html += "</div>";
        });
        html + "</div>";
        html += "<div class='mtb_p'></div>";
        jQuery(this).html(html);
        jQuery(".mtb_tab").bind("click", function () {
            var isselect = jQuery(this).attr("selected");
            // 点击当前被选中的TAB 可以刷新当前TAB   zhangzhen 2011-11-05
            if (isselect == true) {

                jQuery(this).attr("selected", true);
                if (typeof Sys_TabSelectChange == "function")
                    Sys_TabSelectChange(jQuery(this)[0]);
            }
            //return;
            else {
                var isselecttab = jQuery(".mtb_tab[selected='true']");
                isselecttab.find("div").each(function () {
                    jQuery(this).attr("class", jQuery(this).attr("class").replace('sel_', ''));
                })
                isselecttab.attr("selected", false);
                jQuery(this).find("div").each(function () {
                    jQuery(this).attr("class", jQuery(this).attr("class").replace('mtb_', 'mtb_sel_'));
                })
                jQuery(this).attr("selected", true);
                if (typeof Sys_TabSelectChange == "function")
                    Sys_TabSelectChange(jQuery(this)[0]);
            }
        });
        jQuery(".mtb_tab[selected=true]").click();
    }
})