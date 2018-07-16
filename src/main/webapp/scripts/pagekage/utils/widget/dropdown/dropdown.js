/*
 * 下拉框数据绑定插件
 * CodeBy:Mr.Co
 * Date:2013/11/21
 * Version:1.0
*/
(function (win) {
    var _DropDown = function (opts) {
        this.settings = $.extend({
            container: $(),
            id: 'ddl' + parseInt(100000000 * Math.random()),
            className: '',
            dataKeyID: '' 

        }, opts);
    }
})(window);