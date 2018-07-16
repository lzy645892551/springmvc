/**
 * @数据处理库
 * User: Mr.Co
 * Date: 13-5-27
 * Time: 下午1:53
 */
GLOBAL.Namespace('DataStore.DataHandle', function () {
    this.getData = function (args) {
        $.ajax({
            type: 'GET',
            url: args.url,
            async: args.async != undefined ? args.async : true,
            cache: false,
            data: 'postType=get&handler=' + args.handler + '&data=' + args.parame + '&debug=' + (args.debug != undefined && args.debug === true ? 1 : 0 ),
            success: function (result) {
                //result = result.toUpperCase();
                //result = result.replace(/\r\n/ig, '');                 
                while (result.match(/\r/) || result.match(/\n/)) {
                    result = result.replace(/\r/, '').replace(/\n/, '');
                }

                if (args.dataType && args.dataType.toLowerCase() == 'text') {
                    args.success(result);
                } else {
                    args.success(eval('(' + result + ')').data || eval('(' + result + ')') || result);
                }
            },
            error: function (err, e, a) {
                alert('温馨提示：您的网络不给力啊！一会儿再试试！');
            }
        });
    }

    this.postData = function (args) {
        var _resultData = args.resultData && args.resultData === true ? '&result=1' : '&result=0';        
        $.ajax({
            type: 'POST',
            url: args.url,
            async: args.async != undefined ? args.async : true,
            cache: false,
            data: 'postType=exec&handler=' + args.handler + '&data=' + args.parame + _resultData + '&debug=' + (args.debug != undefined && args.debug === true ? 1 : 0),
            success: function (result) {
                //result = result.toUpperCase();
                while (result.match(/\r/) || result.match(/\n/)) {
                    result = result.replace(/\r/, '').replace(/\n/, '');
                }
                if (args.dataType && args.dataType.toLowerCase() == 'text') {
                    args.success(result);
                } else {
                    args.success(eval('(' + result + ')').data || eval('(' + result + ')') || result);
                }
            },
            error: function (err, e, a) {
                alert('温馨提示：您的网络不给力啊！一会儿再试试！');
            }
        });
    }

    this.data = function (type, handler, fucid, dataParame, callFn, async) {
        var _parame = {
            url: '/service/main.ashx',
            handler: handler,
            parame: '{fucid:"' + fucid + '",data:"' + dataParame + '"}',
            async:async,
            success: callFn
        }
        switch(type.toLowerCase()){
            case 'get':
                this.getData(_parame);
                break;
            case 'post':
                this.postData(_parame);
                break;
        }
    }

    this.getJSONP = function (args) {
        $.ajax({
            type: 'GET',
            url: args.url,
            async: args.async != undefined ? args.async : true,
            cache: false,
            data: 'postType=get&handler=' + args.handler + '&data=' + args.parame,
            dataType: 'jsonp',
            jsonp: 'callback',
            success: function (result) {
                args.success(result);
            },
            error: function (err, e, a) {
                alert('温馨提示：您的网络不给力啊！一会儿再试试！');
            }
        });
    }

    this.postJSONP = function (args) {
        var _resultData = args.resultData && args.resultData === true ? '&result=1' : '&result=0';
        $.ajax({
            type: 'POST',
            url: args.url,
            async: args.async != undefined ? args.async : true,
            cache: false,
            data: 'postType=exec&handler=' + args.handler + '&data=' + args.parame + _resultData,
            dataType: 'jsonp',
            jsonp: 'callback',
            success: function (result) {
                args.success(result);
            },
            error: function (err, e, a) {
                alert('温馨提示：您的网络不给力啊！一会儿再试试！');
            }
        });
    }
});