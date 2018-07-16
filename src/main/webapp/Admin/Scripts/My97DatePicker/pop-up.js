  function alertinfo(id)
    {//显示弹出层
    var obj = document.getElementById(id);var W = screen.width;
    //取得屏幕分辨率宽度
    var H = screen.height;
    //取得屏幕分辨率高度
    var yScroll;
    //取滚动条高度
    if (self.pageYOffset)
     {
     yScroll = self.pageYOffset;
    } 
    else if (document.documentElement && document.documentElement.scrollTop)
    {yScroll = document.documentElement.scrollTop;}
     else if (document.body) {yScroll = document.body.scrollTop;}
     obj.style.marginLeft= (W/2 - 450) + "px";obj.style.top= (H/2 -90 - 285　+　yScroll) + "px";document.getElementById("bg").style.display="block";obj.style.display="block";var scrollstyle = scrolls();scrollstyle.style.overflowX = "hidden";scrollstyle.style.overflowY = "hidden";}
     function closediv(id){
     //关闭弹出层
     document.getElementById(id).style.display="none";document.getElementById("bg").style.display="none";var scrollstyle = scrolls();scrollstyle.style.overflowY = "auto";scrollstyle.style.overflowX = "hidden";}function scrolls(){
     //取浏览器类型
     var temp_h1 = document.body.clientHeight;var temp_h2 = document.documentElement.clientHeight;var isXhtml = (temp_h2<=temp_h1&&temp_h2!=0)?true:false;var htmlbody = isXhtml?document.documentElement:document.body;return htmlbody;}