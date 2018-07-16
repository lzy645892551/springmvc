/*
* 表单验证
* Date:2011-03-10
* Author:Mr.Co
* LastUpdateDate:2011-06-28

【***********Input表单属性***********】
HTML:
例：<input id='txt_1' type="text" ver='number' message='正确提示信息' error='错误提示信息' checkInput='是否支持验证 ture or false' maxVal='文本框最大字符长度' minVal='文本框最小字符长度' />
【提示：请务必给每个input加上一个唯一ID,缺少ID将会造成提示错误】

ver属性：
用于区分验证类型，相关参数值有
number      验证必须为阿拉伯数字
moblie      验证手机号码
phone       验证电话号码(地区号-电话号-分机号)
phoneNot-   验证电话号码(地区号电话号分机号)不带-
allphone    验证必须为手机号码或者电话号码
email       验证电子邮件
password    验证密码,当验证类型为password的同时还有一个passwordStatus属性，该属性为显示当前设置的密码的强度,调用方式为passwordStatus='show'
postnumber  验证邮政编码
date        验证日期
website     验证网址
file        验证文件上传
        
在不设置ver属性时默认只验证是否为空、最大字符长度、最小字符长度

message属性：
文本框获取焦点时提示信息

error属性：
文本框输入值验证错误时提示错误信息

checkInput属性：
文本框是否验证属性，如文本框未设置该属性，将不验证任何条件，默认为false
相关参数有
true        验证相关信息
false       不验证任何信息

maxVal属性：
文本框最大字符长度,数字值

minVal属性:
    文本框最小字符长度，数字值

maxNum属性:
    验证输入的数字必须大于该值

minNum属性：
验证输入的数字必须小于该值

controlToVerify属性：
1.该属性出现在密码确认时使用，第二个密码框里写该属性，保证第一次输入与第二次输入一致
2.该属性出现在两个文本框输入值验证不能为相同的情况下写该属性，保证第一次输入跟第二次输入的不能为一致
例1：<input id='txtPwd1' type='password'/>
<input id='txtPwd2' type='password' controlToVerify='txtPwd1'/>

例2：<input id='txt1' type='text' versame='true'/>
<input id='txt2' type='text' ver='number' versame='true' controlToVerify='txt1' error='必须为数字' sameerror='不能与上一个输入值相同'/>

    passwordStatus属性:
该属性为显示当前设置的密码的强度,调用方式为passwordStatus='show'

checkUrl属性:
    该属性为异步请求地址验证,ajax方式后台验证,后台返回值格式为 "(true or false)|提示信息" 以|分隔

exts属性：
该属性为文件上传时使用，调用方式为 <input type='file' exts='jpg,gif,png'/>

tipPosition属性：
该属性为信息提示框的左边距大小，必须为数字，在已有的左距离增加

【********************Form表单属性********************】
lock属性      true或false调用方式<form lock='true'>设置为true时提交表单将锁屏，一般锁屏适用于表单中带有文件上传功能
*/
(function ($) {
    $.fn.formVerify = function (options) {
        var _this = this;
        /*验证当前页面中是否引用了Jquery类库*/
        if (typeof $ == 'undefined') { alert('message:页面中未找到jquery类库包！表单验证将无法正常运行！'); return; }

        /* 简单的数据填充*/
        String.prototype.reportData = function (data) {
            return this.replace(/(\{(.*?)\})/g, function (a, b, c) {
                return data[c];
            });
        }

        /* 获取对象坐标 （修正后）*/
        function getObjPosition($obj) {

            //var _left = $obj.attr('tipPosition') ? ($obj.offset().left + $obj.width() + parseInt($obj.css('paddingLeft')) + 5) + parseInt($obj.attr('tipPosition')) : ($obj.offset().left + $obj.width() + parseInt($obj.css('paddingLeft')) + 5),
            //     _top = $obj.offset().top - 40;
            //return {
            //    left: _left - 6,
            //    top: _top
            //}
            var pos = $obj.offset();
            pos.left += $obj.width();
            pos.top -= 40;

            if (pos.left == 0) {
                //console.log("id :" + $obj.attr("id"));
                //console.log("tipWidth :" + $obj.width());
                //console.log("pos.left :" + pos.left);

            }

            return pos;
        }

        /*设置信息提示样式*/
        var setTipStyle = function ($obj, className, msg, type) {
            var _objID = $obj.attr('id'),
                _errorMsgID = '#error_tip_dialog_' + _objID,                
            _msgBox =
            "<div id='error_tip_dialog_{ID}' class='{className}_tip_dialog'>" +
                            "<b class='{className}_tip_dialog_left_side'></b>" +
                            "<div class='{className}_tip_msg'>{msg}</div>" +
                            "<b class='{className}_tip_dialog_right_side'></b>" +
             "</div>";
            
            if (!_objID) {
                alert("要验证的表单元素 缺少ID 属性");
                $obj.css("border", "3px solid red");
            }

            $(_errorMsgID).remove();
            var data = {
                ID: _objID,
                className: className == 'focus_on' ? 'ok' : 'error',
                msg: msg
            };
            
            if (className != '' && msg != "") {
                _msgBox = _msgBox.reportData(data);
                $(document.body).append(_msgBox);
                var $errorTip = $(_errorMsgID);
                setErrorTipPosition($errorTip, $obj, false);
            }

        }

        /*dhl 设置 tip的位置 及方向*/
        function setErrorTipPosition($errorTip, $obj, isMove) {
            if ($obj.length == 0) {
                return;
            }
            var tipWidth = 0;
            if ($errorTip.attr("tipWidth")) {
                tipWidth = parseInt($errorTip.attr("tipWidth"));
            } else {
                tipWidth = $errorTip.width();
                $errorTip.attr("tipWidth", tipWidth);
            }
            $errorTip.css("width", tipWidth);
            var className = $errorTip.attr("class");

            var pos = getObjPosition($obj);
            $errorTip.css(pos);

            $errorTip.removeClass();

            if (pos.left == 0) {
                //console.log("--------" + $obj.attr("id"));
                //console.log("tipWidth :" + tipWidth);
                //console.log("pos.left :" + pos.left);
                //console.log("val :" + $obj.val());
                // $obj.val("aaaaaaaaaaaaaaaa");//("background-color", "#000");

            }
            //console.log("pos.left +tipWidth :" +( tipWidth + pos.left));
            //console.log("body width :" + $(document.body).width());
            //console.log("diff:" +( pos.left + tipWidth - $(document.body).width()));

            ///超出屏幕 使用 反向样式
            if (pos.left + tipWidth > $(document.body).width()) {
                $errorTip.addClass(className.replace("_tip_dialog", "_tip_dialog"));
                pos.left = pos.left - tipWidth - 20;

            } else {
                $errorTip.addClass(className.replace("_tip_dialog", "_tip_dialog"));
            }
            if (isMove) {
                $errorTip.animate(pos);
            }
            else {
                $errorTip.css(pos);
            }
        }

        /*设置验证等待图标*/
        var setLoadingStyle = function (obj) {
            var loading = '<div id="verLoding" style="width:16px; height:16px; background:url(/Content/imgs/loadinfo.net.gif) no-repeat; left:' + (obj.offset().left + obj.width() + 30 + parseInt(obj.css('paddingLeft'))) + 'px; top:' + (obj.offset().top + 5) + 'px; position:absolute; z-index:999; " title="验证中,请稍候...."></div>';
            $(loading).appendTo(document.body);
        }

        /*定位到页面中的第一个错误位置*/
        var errorPosition = function () {
            if ($('.error').size() < 1) return;
            $(window).scrollTop($('.error').eq(0).offset().top);
        }

        /*验证当前文本框与指定的文本框的值是否一致*/
        var checkSameVal = function (obj, error) {
            var same = obj.attr('versame') ? obj.attr('versame') : '',
                vsControl = obj.attr('controlToVerify') ? $('#' + obj.attr('controlToVerify')) : null,
                    checkState = false;

            if (same != '' && vsControl == null) { return checkState; }
            if (same != '' && vsControl != null) {
                if (obj.val() == '' && vsControl.val() == '') {
                    return true;
                }
                if (obj.val() == vsControl.val()) {
                    setTipStyle(obj, 'error', error, 'error');
                    checkState = true;
                } else {
                    setTipStyle(obj, '', '', '');
                    checkState = false;
                }
            }
            return checkState;
        }

        /*验证文本框值*/
        var verifyVal = function (args) {
          
            var reg = args.reg
            if (args.checkInput == 'false' && args.val == '') return;
            if (args.checkInput == 'true' && args.val == '') {
                setTipStyle(args.object, 'error', '必填项', 'error');
                return;
            }
            else if (args.maxVal != undefined && args.val.length > args.maxVal) {
                setTipStyle(args.object, 'error', '字符长度请在' + args.maxVal + '位以内!', 'error');
                return;
            }
            else if (args.maxVals != undefined && args.val.length > args.maxVals) {
                setTipStyle(args.object, 'error', '电话长度请在' + args.maxVals + '位!', 'error');
                return;
            }
            else if (args.minVals != undefined && args.val.length < args.minVals) {
                setTipStyle(args.object, 'error', '电话长度请在' + args.minVals + '位!', 'error');
                return;
            }
            else if (args.minVal != undefined && args.val.length < args.minVal) {
                setTipStyle(args.object, 'error', '字符长度不得小于' + args.minVal + '位!', 'error');
                return;
            }

            else if (args.maxNum && parseFloat(args.val) > parseFloat(args.maxNum)) {
                setTipStyle(args.object, 'error', '该值不能大于' + args.maxNum, 'error');
                return;
            }
            else if (args.minNum && parseFloat(args.val) < parseFloat(args.minNum)) {
                setTipStyle(args.object, 'error', '该值不能小于于' + args.minNum, 'error');
                return;
            }
            else if (args.checkInput == 'true' && args.verifyId != undefined && !args.object.attr('versame') && args.val != $('#' + args.verifyId).val()) {
                setTipStyle(args.object, 'error', '两次密码不一致，请重新输入！', 'error');
                return;
            }
            else if (reg != undefined && !reg.test(args.val)) {
                setTipStyle(args.object, 'error', args.error, 'error');
                return false;
            }
            else if (args.checkUrl != undefined && args.checkUrl != '') {
                // && args.object.attr('verSuccess') == undefined
                var _url = args.checkUrl;
                var _resultVal = '';
                $.ajax({
                    type: 'GET',
                    url: _url,
                    data: "v=" + args.val,
                    async: true,
                    cache: false,
                    error: function () { throw new Error("异步验证地址" + _url + '异常！'); },
                    beforeSend: function () { setLoadingStyle(args.object); },
                    success: function (val) {
                        _resultVal = val;
                        $('#verLoding').remove();

                        if (_resultVal.split('|').length == 2 && _resultVal.split('|')[0] == 'false') {
                            setTipStyle(args.object, 'error', _resultVal.split('|')[1], 'error');
                        } else if (_resultVal.split('|').length == 2 && _resultVal.split('|')[0] == 'true') {
                            setTipStyle(args.object, 'ok_tip', _resultVal.split('|')[1], 'ok_tip');
                            args.object.attr('verSuccess', 'true');
                        } else if (_resultVal != '') {
                            setTipStyle(args.object, 'error', '系统繁忙！请稍候重试!', 'error');
                        }
                    }
                });
            }
            else if (args.exts != undefined && args.exts != '') {
                var _exts = args.exts.split(','),
                    _ext = args.object.val() != '' ? args.object.val().split('.')[1] : '',
                    _isExt = false;
                for (var i = 0; i < _exts.length; i++) {
                    if (_ext.toLowerCase() == _exts[i].toLowerCase()) {
                        _isExt = true;
                        break;
                    } else {
                        _isExt = false;
                    }
                }
                if (!_isExt) {
                    setTipStyle(args.object, 'error', '您上传的文件格式不正确！可上传格式有 (' + args.exts + ')', 'error');
                } else {
                    setTipStyle(args.object, '', '', '');
                }
            }
            else {
                if (!checkSameVal(args.object, args.sameError)) {
                    setTipStyle(args.object, '', '', '');
                    return true;
                }
                return false;
            }
        }

        /*绑定text控件相关验证Event*/
        //[checkInput=true],textarea[checkInput=false]
        $(_this).find('input,textarea')
            .unbind("focus")
            .unbind("blur")
            .unbind("keyup")
            .live('focus', function () {
                //if ($(this).is("[type=text]")) {
                //    //var _txtbox_father = $(this).parent(),
                //    //    _txtbox_father_class = _txtbox_father.attr('class');

                //    //if (_txtbox_father_class.indexOf('error') > -1) {
                //    //    _txtbox_father.attr('class', 'form_row error_on');
                //    //} else {
                //    //    _txtbox_father.attr('class', 'form_row focus_on');
                //    //}
                //}
                if (!$(this).attr('checkInput')) { return; }
                setTipStyle($(this), 'focus_on', $(this).attr('message'), '');
            })
            .live('blur', function () {
                //if ($(this).is("[type=text]")) {
                //    //$(this).parent().attr('class', 'form_row');
                //}
                if (!$(this).attr('checkInput')) { return; }
                var ver = $(this).attr('ver') || '',
                    message = $(this).attr('message') || '',
                    error = $(this).attr('error') || '',
                    checkInput = ($(this).attr('checkInput') || 'false').toLowerCase(),
                    checkUrl = $(this).attr('checkUrl'),
                    val = $(this).val() || '',
                    verifyId = $(this).attr('controlToVerify'),
                    maxVal = $(this).attr('maxVal'),
                    minVal = $(this).attr('minVal'),
                    maxVals = $(this).attr('maxVals'),
                    minVals = $(this).attr('minVals'),
                    maxNum = $(this).attr('maxNum'),
                    minNum = $(this).attr('minNum'),
                    exts = $(this).attr('exts'),
                    sameError = $(this).attr('sameError'),
                    args = { object: $(this), ver: ver, message: message, error: error, sameError: sameError, checkInput: checkInput, val: val, verifyId: verifyId, maxVal: maxVal, maxVals: maxVals, minVal: minVal, minVals: minVals, maxNum: maxNum, minNum: minNum, checkUrl: checkUrl, exts: exts };

                /*20130418 dhl 在ver参数中直接使用正则表达式ver是正则*/
                var regWord = new RegExp(/^[\w-]+$/g);
                if (!regWord.test(ver) && ver != '') {
                    args.reg = new RegExp(ver);
                    verifyVal(args);
                    return;
                }
                /*20130418 end------------------------------------*/

                //console.log("预设正则检测")
                switch (ver.toLowerCase()) {
                    case 'number':
                        args.reg = /^-?[0-9]*(\.\d*)?$|^-?d^(\.\d*)?$/;//只允许输入小数＼整数＼负整数＼零   /^[\d]+$/; 整数
                        verifyVal(args);
                        break;
                    case 'moblie':
                        args.reg = /^1[3-9]\d{9}$/;
                        verifyVal(args);
                        break;
                    case 'phone':
                        args.reg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
                        if (!verifyVal(args)) {
                            args.reg = /(\d{1,4}-)(\d{1,4}-)(\d{1,4})$/;
                            verifyVal(args);
                        }
                        break;
                    case 'phonenot-':
                        args.reg = /^(([0\+]\d{2,3})?(0\d{2,3}))(\d{7,8})(-(\d{3,}))?$/;
                        if (!verifyVal(args)) {
                            args.reg = /(\d{1,4}-)(\d{1,4}-)(\d{1,4})$/;
                            if (!verifyVal(args)) {
                                args.reg = /^1[3-9]\d{9}$/;
                                verifyVal(args);
                            }
                        }
                        break;
                    case 'allphone':
                        args.reg = /^1[3-9]\d{9}$/;
                        if (!verifyVal(args)) {
                            args.reg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
                            if (!verifyVal(args)) {
                                args.reg = /(\d{1,4}-)(\d{1,4}-)(\d{1,4})$/;
                                verifyVal(args);
                            }
                        }
                        break;
                    case 'freephone':
                        args.reg = /(\d{1,4}-)(\d{1,4}-)(\d{1,4})$/;
                        verifyVal(args);
                        break;
                    case 'email':
                        args.reg = /^[a-zA-Z0-9_\-.]{1,}@[a-zA-Z0-9_\-]{1,}\.[a-zA-Z0-9_\-.]{1,}$/;
                        verifyVal(args);
                        break;
                    case 'password':
                        verifyVal(args);
                        break;
                    case 'postnumber':
                        args.reg = /^[0-9]{6}$/;
                        verifyVal(args);
                        break;
                    case 'date':
                        args.reg = /^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[0-9])|([1-2][0-3]))\:([0-5]?[0-9])((\s)|(\:([0-5]?[0-9])))))?$/;
                        verifyVal(args);
                        break;
                    case 'website':
                        //args.reg = /(http[s]?|ftp):\/\/[^\/\.]+?\..+\w$/i;
                        args.reg = /[^\/\.]+?\..+\w$/i;
                        verifyVal(args);
                        break;
                    case 'file':
                        verifyVal(args);
                        break;
                    case 'domain':
                        args.reg = /^[a-zA-Z0-9-]{1,}$/;
                        verifyVal(args);
                        break;
                    case 'childdomain':
                        args.reg = /^[a-zA-Z0-9]*\.[a-zA-Z0-9]*\.[a-zA-Z0-9]{2,5}$/;
                        verifyVal(args);
                        break;
                    case 'char':
                        args.reg = /^[a-zA-Z0-9_ ]{1,}$/;
                        verifyVal(args);
                        break;
                    default:
                        verifyVal(args);
                        break;
                }
            })
            .live('keyup', function () {
                if (!$(this).attr('checkInput')) { return; }
                var ver = $(this).attr('ver') || '',
                    status = $(this).attr('passwordStatus') || '';
                /*验证是否存在指定的字符串*/
                var verfiy = function (reg, val) {
                    val = val.split('');
                    for (var i = 0; i < val.length; i++) {
                        if (reg.exec(val[i])) return 1;
                    }
                    return 0;
                }
                /*当input文本框ver属性值为password并且要显示密码强度状态时*/
                if (ver.toLowerCase() == 'password' && status.toLowerCase() == 'show') {
                    /*未输入值的时候删除状态提示*/
                    if ($(this).val() == '') { $('#divPwdStatus').remove(); return; }
                    /*验证正则*/
                    var number = /^[0-9]$/,
                        letter = /^[a-z]|[A-Z]$/,
                        special = /^[^A-Za-z0-9]$/,
                    /*密码状态class、密码状态等级、状态条宽度*/
                        statusClass = '',
                        statusLevel = '',
                        statusWidth = '0',
                    /*密码强度数字*/
                        count = verfiy(number, $(this).val()) + verfiy(letter, $(this).val()) + verfiy(special, $(this).val());

                    if ($(this).val().length < 6) {
                        statusClass = 'orange';
                        statusLevel = '弱';
                        statusWidth = 100 / 3;
                    }
                    else if ($(this).val().length > 6 && count == 1) {
                        statusClass = 'blue';
                        statusLevel = '中';
                        statusWidth = 100 / 2;
                    }
                    else if ($(this).val().length < 6 && count > 2) {
                        statusClass = 'blue';
                        statusLevel = '中';
                        statusWidth = 100 / 2;
                    }
                    else if (count <= 1) {
                        statusClass = 'orange';
                        statusLevel = '弱';
                        statusWidth = 100 / 3;
                    }
                    else if (count == 2) {
                        statusClass = 'blue';
                        statusLevel = '中';
                        statusWidth = 100 / 2;
                    }
                    else if (count == 3) {
                        statusClass = 'green';
                        statusLevel = '强';
                        statusWidth = 100 / 1;
                    }
                    var status = '<div id="divPwdStatus" class="extra_tip"><span class="pwdStatus">密码强度：</span><span class="statusBar ' + statusClass + '" title="提示：数字、字母、符号组合密码较强"><span class="' + statusClass + '" style="width:' + statusWidth + '%"></span></span><span>' + statusLevel + '</span></div>';
                    $('#divPwdStatus').remove();
                    $(this).after(status);
                }
            });

        /*dhl 绑定select控件相关验证Event*/
        $(_this).find('select[checkInput=true]').bind('focus', function () {
            setTipStyle($(this), 'focus_on', $(this).attr('message'), '');
        }).bind('blur', function () {
            if (parseInt($(this).val()) == -1) {
                setTipStyle($(this), 'error', $(this).attr('error'), 'error');
            }
            else {
                setTipStyle($(this), '', '', '');
            }
        }).bind('change', function () {
            if (parseInt($(this).val()) == -1) {
                setTipStyle($(this), 'error', $(this).attr('error'), 'error');
            }
            else {
                setTipStyle($(this), '', '', '');
            }
        })

        /*dhl 页面resize tip 位置*/
        try {
            var resizeTimer = null;
            $(window).resize(function () {
                if (resizeTimer) {
                    clearTimeout(resizeTimer);
                }
                resizeTimer = setTimeout(function () {

                    $("div[id^='error_tip_dialog_']").each(function (i, n) {

                        var arr = $(n).attr("id").split("_");
                        var id = arr[arr.length - 1];
                        var $obj = $("#" + id);

                        if ($obj.attr('tipPosition')) {
                            return;
                        }
                        setErrorTipPosition($(n), $obj, true);
                    });

                }, 100);
            });
        } catch (e) { }


        /*锁定层*/
        var createLayer = function () {
            var _bodyH = $(window).height() < $(document.body).height() ? $(document.body).height() : $(window).height(),
                _bodyW = $(window).width(),
                _top = ($(window).height() - 10) / 2,
                _left = (_bodyW - 136) / 2,
                _layer = '<div style="background-color: #ccc; opacity: 0.8; filter:Alpha(Opacity=80); height:' + _bodyH + 'px; width:' + _bodyW + 'px; position:absolute; z-index:9999; top:0px; left:0px; bottom:0px; right:0px;"></div>',
                _pressBar = '<div style="background:url(/Content/imgs/upload-loading.gif) no-repeat; width:136px; height:10px; position:absolute; left:' + _left + 'px; top:' + _top + 'px; z-index:10000;" title="数据提交中,请稍候........"></div>';
            $(document.body).append(_layer).append(_pressBar);
            $(window).scrollTop(0);
        }

        /*表单提交*/
        // 20130417 添加判断 是否返回全局检测函数 （当前页面 多form情况）
        if (options.isReturnCheckFn == true) {
            return function () {
                var errorState = false;
                $(_this).find('input[checkInput=true],textarea[checkInput=true],select[checkInput=true]').each(function (i, n) {
                    $(this).blur();
                });
                errorState = $('.error_tip_dialog').size() > 0;
                if (errorState == 0) {
                    errorState = $('.error_tip_right_dialog').size() > 0;
                }
                if (!errorState &&
                    $(_this).attr('lock') != undefined &&
                    $(_this).attr('lock').toLowerCase() == 'true') {
                    createLayer();
                }
                //errorPosition();
                return !errorState;
            };
        }
        else {
            $('form').submit(function () {
                var errorState = false;
                $(this).find('input[checkInput=true],textarea[checkInput=true],select[checkInput=true]').each(function () {
                    $(this).blur();
                });
                errorState = $('.error_tip_dialog').size() > 0;
                if (!errorState && $(this).attr('lock') != undefined && $(this).attr('lock').toLowerCase() == 'true') {
                    createLayer();
                }
                //errorPosition();
                return !errorState;
            });
        }
    };
})(jQuery);