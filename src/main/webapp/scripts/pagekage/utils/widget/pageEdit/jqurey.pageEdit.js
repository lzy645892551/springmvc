(function ($) {
    $.fn.pageEdit = function (isEdit) {
        if (!isEdit) {
            function createLabel(value) {
                return $("<label class='pageEditLabel'></label>").html(value);
            }
            this.find("input[type != 'button'][type != 'submit']").each(function (index, ele) {
                var type = $(this).attr("type").toLowerCase();
                if (type == "hidden" || $(this).attr('show') == 'show') return;
                $(this).addClass("pageEditInput");
                if (type == "radio" || type == "checkbox") {
                    if (this.checked) {
                        $(this).after(createLabel(this.value));
                    }
                } else {
                    $(this).after(createLabel(this.value));
                }
            });
            this.find("textarea").each(function () {
                if ($(this).attr('show') == 'show') return;
                $(this).after(createLabel(this.value)).addClass("pageEditInput");
            });
            this.find("select").each(function (index, ele) {
                if ($(this).attr('show') == 'show') return;
                $(this).after(createLabel(this.value)).addClass("pageEditInput");
            });
            $(".pageEditInput").hide();
        } else {
            $(".pageEditLabel").remove();
            $(".pageEditInput").show().removeClass("pageEditInput");
        }
    }


    $.fn.disabledFrom = function (isDisabled, selectors) {
        if (selectors && selectors.length) {
            for (var i = 0; i < selectors.length; i++) {
                if ($(selectors[i]).length > 0) {
                    $(selectors[i]).each(function (i, e) { dissableEle(e, isDisabled); })
                }
            }
        } else {
            this.find("input[type != 'button'][type != 'submit']").each(function (i, e) { dissableEle(e, isDisabled) });
            this.find("textarea").each(function (i, e) { dissableEle(e, isDisabled) });
            this.find("select").each(function (i, e) { dissableEle(e, isDisabled) });
        }

        function dissableEle(ele, isDisabled) {
            var tag = ele.tagName.toLowerCase();
            var type = $(ele).attr("type") && $(ele).attr("type").toLowerCase();
            if (tag == "input" && type != "radio" && type != "checkbox") {
                if (isDisabled) {
                    $(ele).attr("readonly", "readonly");
                } else {
                    $(ele).removeAttr("readonly");
                }
            } else {
                if (isDisabled) {
                    $(ele).attr("disabled", "disabled");
                } else {
                    $(ele).removeAttr("disabled");
                }
            }
        }
    }


})(jQuery);