/*
 * 获取或设置表单中的值
 * CodeBy:Mr.Co
 * Date:2014/06/06
 */
(function ($) {
    var returnValue = [],
        checkboxName = [],
        existGroupName = {};

    var getData = function(childrens) {
        $.each(childrens, function () {
            switch (this.tagName.toLowerCase()) {
                case "input":
                    processInput(this);
                    break;
                case "textarea":
                    if ($(this).attr('class') != 'ke-edit-textarea') {
                        returnValue.push(encodeURIComponent(encodeURIComponent($(this).val())));
                    }
                    break;
                case "select":
                    returnValue.push(encodeURIComponent(this.value));
                    break;
                default:
                    if (this.children.length > 0) {
                        getData(this.children);
                    }
                    break;

            }
        });
    }

    var processInput = function(input) {
        var $input = $(input),
            _name = $input.attr('name');
        var nodetype = $input.attr("type").toLowerCase();

        if (nodetype != "button" && nodetype != "submit") {
            if ((nodetype == "radio" || nodetype == "checkbox")) {
                if (input.checked) {
                    if (nodetype == "radio") {
                        returnValue.push(encodeURIComponent($input.val()));
                    } else {
                        var tempValue = [];
                        if (!existGroupName[_name]) {
                            $("input:checkbox[name='" + _name + "']").each(function (index, item) {
                                if (item.checked) {
                                    tempValue.push(encodeURIComponent($(item).val()));
                                }
                            });

                            existGroupName[_name] = _name;
                            returnValue.push(tempValue.join("/"));
                        }
                    }
                }
                else if (nodetype == "checkbox") {
                    if (!existGroupName[_name]) {

                        var tempValue = [];

                        $("input:checkbox[name='" + _name + "']").each(function (index, item) {
                            if (item.checked) {
                                tempValue.push(encodeURIComponent($(item).val()));
                            }
                        });

                        existGroupName[_name] = _name;

                        returnValue.push(tempValue.length > 1 ? tempValue.join("/") : tempValue.length == 1 ? tempValue.join('') : '');
                    }
                }
            } else {
                returnValue.push(encodeURIComponent($input.val()));
            }
        }
    }

    $.fn.getValue = function () {
        returnValue = [], checkboxName = [];
        getData(this.get(0).children);
        existGroupName = {};
        return encodeURIComponent(returnValue.join(","));
    }

    $.fn.setValue = function (model) {
        var _existGroupName = {},
            _this = this;       
        
        var setInputValue = function (name,val) {
            var _$this = $(this),
                _type = _$this.attr('type');

            if (_type == 'checkbox' || _type == 'radio') {

                if (_existGroupName[name])
                    return;
                else {
                    $(_this).find('input[type=' + _type + ']').each(function () {
                        var _$this = $(this);
                        if (_$this.val() == val)
                            _$this.attr('checked', 'checked');
                        else
                            _$this.removeAttr('checked');
                    });
                    _existGroupName[name] = name;
                }                
            }
            
            if(_type == 'text'){
                _$this.val(val);
            }
        }

        for (var key in model) {
            var _$input = $(_this).find('input[name=' + key + ']'),
                _$textarea = $(_this).find('textarea[name=' + key + ']'),
                _$select = $(_this).find('select[name=' + key + ']');

            if (_$input.size() > 0) {
                _$input.each(function () {
                    setInputValue.call(this, key, model[key]);
                });
            }

            if (_$textarea.size() > 0) {
                _$textarea.val(model[key]);
            }

            if (_$select.size() > 0) {
                _$select.eq(0).children('option[value=' + model[key] + ']').attr('selected', 'selected');
            }
        }
    }
})(jQuery);