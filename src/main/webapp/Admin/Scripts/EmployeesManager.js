$(function () {
    $("#tree").jstree({
        "themes": {
            "theme": "classic",
            "dots": true,
            "icons": true
        },
        "plugins": ["themes", "json_data", "cookies", "ui", "types", "search"],
        "json_data": {
            "data": [
	{ "data": "大连万达商业地产股份有限公司", "children": [{ "data": "商管公司", "state": "closed"}], "state": "open" },

]
        },
        "core": { "initially_open": ["100002"] }
        ,
        //                rules: {
        //                    type_attr: "rel",     //设置节点类型  
        //                    valid_children: "Organization"  // 只有root节点才能作为顶级结点  
        //                },
        "search": {
            "data": [
	{ "data": "大连万达商业地产股份有限公司", "children": [{ "data": "商管公司", "state": "closed"}], "state": "open" },

]
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
        $("#hidParentUuid").val(userId);
        var cookuuid = $("#hidCookUuid").val();
        if (cookuuid != userId) {
            $("#hidfromSubmit").val("1");
            $("#txtName").val("");
            $("#form1").submit();
        }
    });
    var winHeight = $(window).height();
    $("#authorityClear").css({ "height": winHeight * 0.45 });
    $("#tree").css({ height: winHeight * 0.92 });
    $(".cxlb_2").css({ height: winHeight * 0.92 });
});

function displayTree() {

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "EmployeesManager.aspx/FindOrganizationUuid",
        data: "{txtName:'" + $("#txtName").val() + "', txtLoginName:'" + $("#txtLoginName").val() + "',txtEmail:'" + $("#txtEmail").val() + "',txtPhone:'" + $("#txtPhone").val() + "'}",
        dataType: "json",
        success: function (result) {
            $("#hidorganizationUuid").val(result.d);
            alert(result.d);
            $("#tree").jstree("search", $("#txtName").val());
        },
        error: function () { alert("没有找到此人") }
    });
}

function openWin(url, uuid) {
    var url = '/Admin/' + url + '?uuid=' + uuid + '&parentUuid=' + $("#hidParentUuid").val();
    var s = window.showModalDialog(url, '人员添加修改', "dialogWidth=860px;dialogHeight=400px;toolbar = no;status = no;scrollbars=no");
    if (s && s == 1) {
        {
            location.href = location.href + "?" + Math.random()+"&flag=0";
        }
    }
}
