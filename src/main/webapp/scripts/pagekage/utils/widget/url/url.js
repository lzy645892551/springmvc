/*DHL url 处理类

*/

var URL = function (url) {

    this.ourl = url || window.location.href;
    this.href = "";//?前面部分
    this.params = {};//url参数对象
    this.pound  = "";//#及后面部分
    this.init();
}
//分析url,得到?前面存入this.href,参数解析为this.params对象，#号及后面存入this.pound 
URL.prototype.init = function () {


     
    var str = this.ourl;
    var index = str.indexOf("#");
    if (index > 0) {
        this.pound  = str.substr(index);
        str = str.substring(0, index);
    }
    index = str.indexOf("?");
    if (index > 0) {
        this.href = str.substring(0, index);
        str = str.substr(index + 1);
        var parts = str.split("&");
        for (var i = 0; i < parts.length; i++) {
            if (parts[i] != "") {
                var kv = parts[i].split("=");
                this.params[kv[0]] = kv[1];
            }
        }
    }
    else {
        this.href = this.ourl;
        this.params = {};
    }
}
//只是修改this.params
URL.prototype.set = function (key, val) {
    this.params[key] = val;
    return this;
}
//只是设置this.params
URL.prototype.remove = function (key) {
    this.params[key] = undefined;
    return this;
}
//根据三部分组成操作后的url
URL.prototype.getUrl = function () {

    var strurl = this.href;
    var objps = [];//这里用数组组织,再做join操作
    for (var k in this.params) {
        if (this.params[k]) {
            objps.push(k + "=" + this.params[k]);
        }
        else {
            objps.push(this.params[k]);
        }
    }
    if (objps.length > 0) {
        strurl += "?" + objps.join("&");
    }
    if (this.pound .length > 0) {
        strurl += this.pound ;
    }
    return strurl;
}
//得到参数值
URL.prototype.get = function (key) {
    return this.params[key];
}
