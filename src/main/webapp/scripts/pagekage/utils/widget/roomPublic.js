function check(json)
{
 
if (json.ChangeRoomReason == "") {
    $("#p").append("无")
}


if (parseInt(json.PlanTotalChangeF) < 0) {
    $("#PlanTotalChangeFB").css({ "color": "red" })
}


if (parseInt(json.IsDirectors) == 1) {
    $("#IsDirectors1").attr("checked", "checked");
    $("#IsDirectors0").attr("disabled", "disabled");

} else {
    $("#IsDirectors0").attr("checked", "checked");
    $("#IsDirectors1").attr("disabled", "disabled");
 }
if (parseInt(json.PlanTotalChangeF) < 0) {
    $("#PlanTotalChangeF").attr("src", "../../Images/NewImage/d01.gif")
}
else {
    
    $("#PlanTotalChangeF").attr("src", "../../Images/NewImage/d03.gif")
}


if (parseInt(json.PlanTotalChangeF) < 0 && json.DiscountExplain == '待审批') {
    $("#zhu").append("<dl><dt style='color:red'><strong>特殊说明：</strong></dt><dt><textarea  style='width:100%;' rows='5' cols='150' id='textarea'></textarea></dt></dl> ");
}

if (parseInt(json.PlanTotalChangeF) < 0 && json.DiscountExplain != '待审批') {
    $("#zhu").append(" <dl><dt style='color:red'><strong>特殊说明 ：&nbsp;</strong><label style=width:1000px><center>" + json.DiscountExplain + "</center></label></dt></dl>")
}


if (parseInt(json.TotalChange) < 0) {
    $("#TotalChange").css({ "color": "red" })
}
if (json.IsOrder == '1') {
    $("#c1").attr('checked', true)
}
if (json.IsContract == '1') {
    $("#c2").attr('checked', true)
}
if (json.ContractRecords == '1') {
    $("#c3").attr('checked', true)
}

    //定金
if (json.IsBargainMoney == '1') {
        $("#C11").attr('checked', true)
    }
    //首期
    if (json.IsFirstMoney == '1') {
        $("#C12").attr('checked', true)
    }
    //按揭
    if (json.IsMortgage == '1') {
        $("#C13").attr('checked', true)
    }
      //一次性
    if (json.IsDisposable == '1') {
        $("#C15").attr('checked', true)
    }




}