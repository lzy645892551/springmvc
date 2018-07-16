/// <reference path="jquery-1.4.1-vsdoc.js" />
$(function () {
    $("#tree").jstree({
        "themes": {
            "theme": "classic",
            "dots": true,
            "icons": true
        },
        "plugins": ["themes", "json_data", "cookies", "ui", "types"],
        "json_data": {

            "data": [
	{ "data": "大连万达商业地产股份有限公司", "children": [{ "data": "商管公司", "state": "closed"}], "state": "open" },
	
]
	

        },
        rules: {
            type_attr: "rel",     //设置节点类型  
            valid_children: "Organization"  // 只有root节点才能作为顶级结点  
        },

        "types": {
            "valid_children": ["Organization"],
            "types": {
                "Organization": {
                    "valid_children": ["default", "Employee"],
                    "icon": {
                        "image": "../images/close.png"
                    }
                },
                "Employee": {
                    "valid_children": "none",
                    "icon": {
                        "image": "../images/role.gif"
                    }
                }
            }
        }
    }).bind("select_node.jstree", function (e, data) {
        var organizationId = $(data.rslt.obj.prevObject.parent().parent().parent()).attr("id");
        var organizationName = $(data.rslt.obj.prevObject.parent().parent().parent()).attr("name");
        var userId = data.rslt.obj.attr("id");
        var userName = data.rslt.obj.attr("name");
        $("#hidNamePath").val(userName);
        $("#hidParentUuid").val(userId);
        var cookuuid = $("#hidCookUuid").val();
        if (cookuuid != userId) {
            $("#form1").submit();
        }
    })
    var winHeight = $(window).height();
    $("#authorityClear").css({ "height": winHeight * 0.45 });
    $("#tree").css({ height: winHeight * 0.92 });
});

function openWin(url, uuid) {

    if (uuid== "" || uuid== null) {
       var puuid =$("#hidParentUuid").val();
       if (puuid == "" || puuid == null) {
           alert("请选择要添加的组织");
           return false;
        }
     }
    var url = '/Admin/' + url + '?uuid=' + uuid + '&parentUuid=' + $("#hidParentUuid").val() + '&namePath=' + encodeURIComponent($("#hidNamePath").val());
    var s = window.showModalDialog(url, '组织管理', "dialogWidth=860px;dialogHeight=300px;toolbar = no;status = no;scrollbars=no");
    if (s && s == 1) {
        {
            location.href = location.href + "?" + Math.random() + "&flag=0";
        }
    }
}