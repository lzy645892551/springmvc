document.writeln("<link rel=\"stylesheet\" href=\"../../Css\/css/css.css\" type=\"text\/css\" \/>");


jQuery(document).ready(function () {
    if (window.opener) {
        //弹出窗口模式
        var objwin = window.opener;
        if (window.name == "printworkflow") {
            //并且是由打印按钮发起的页面
            var odata = document.createElement("span");
            odata.innerHTML = objwin.document.getElementById("workflowtable").innerHTML;
            document.body.appendChild(odata);
            //  $(".tbox04").removeClass("tbox04").addClass("tbox05");
            //  $(".up").removeClass("up").addClass("down");
            // $(".hidden").removeClass("hidden");
            $(".printingdisplay").hide();

            $("#table2").hide();
            $("#HidTable3").css("width", "100%");
            $("#ullist img").hide(); //隐藏审批附件删除按钮
            $("a").attr('href', 'javascript:void(0)'); //隐藏审批附件下载功能
            $("a").css("color", "Black");
            $("a").attr('onclick', 'javascript:void(0)'); //隐藏审批附件下载功能
            $("a").click(function (event) {
                event.preventDefault();  // 如果<a>定义了 target="_blank“ 需要这句来阻止打开新页面         
            });
            $("#trbutton1").css("display", "none");
            $("#trbutton").css("display", "none");
            $("#trtop1").css("display", "none");
            $("#trtop").css("display", "none");
            $("#toptable").css("margin-top", "17px");
            $(".hide").css("display", "none");
            $("input:checked").replaceWith("<input type='checkbox' checked disabled>");

        }
    }
});