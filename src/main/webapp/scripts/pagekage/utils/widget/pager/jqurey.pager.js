(function ($) {
    $.fn.pager = function (option) {

        var options = $.extend(true, {
            currentPage: 1,
            pageSize: 10,
            rowCount: 0, //记录条数
            pageCount: 0,//总页数
            displayNum: 0,
            prev_text: "<",
            next_text: ">",
            frist_text: "<<",
            last_text: ">>",
            showPageIndexBox: true,
            customInfoHTML: "<font>共%pageCount%页，当前为第%currentPage%页，每页%pageSize%条</font>",
            callback: function (index) {
                console.log(index);
                return false;
            }
        }, option || {});
        if (!options.rowCount || options.rowCount < 1) {
            return;
        }
        options.pageCount = Math.ceil(options.rowCount / options.pageSize);

        //if (options.pageCount<options.displayNum)
        options.displayNum = options.pageCount < options.displayNum ? options.pageCount : options.displayNum;
        $("head").append('<link href="/SCRIPTS/pagekage/utils/widget/pager/jqurey.pager.css" rel="stylesheet" />');
        this.addClass("pagination");
        var $this = this;
        var regx = /%(\w*)%/g;
        //'<font>总共' + options.rowCount + '条　共 ' + options.pageCount + ' 页　　' + options.pageSize + ' 条/页</font>';

        function addPageItem() {
            var preNum = parseInt((options.displayNum - 1) / 2);
            var startNum = (options.currentPage < preNum ? 1 : options.pageCount - options.displayNum < options.currentPage ? options.pageCount - options.displayNum + 1 : options.currentPage - preNum) || 1;
            var html = options.customInfoHTML.replace(regx, function (rr, r) {
                return options[r];
            });;
            html += '   <span class="first">' + options.frist_text + '</span>';
            html += '   <span class="pre">' + options.prev_text + '</span>';
            for (var i = 0; i < options.displayNum ; i++) {
                html += '   <span' + (options.currentPage == (startNum + i) ? ' class="current_background"' : '') + '>' + (startNum + i).toString() + '</span>';
            }
            html += '   <span class="next">' + options.next_text + '</span>';
            html += '   <span class="last">' + options.last_text + '</span>';

            if (options.showPageIndexBox)
                html += '   <i>转到第</i><input type="text" maxlength="4"  size="4" class="pageIndex" /><i>页</i><b class="bntGoto">确定</b>';

            $this.html(html);

            if (options.showPageIndexBox) {
                $this.find(".bntGoto").on("click", function () {
                    options.currentPage = parseInt($this.find(".pageIndex").val());
                    addPageItem();
                });
                $this.find(".pageIndex").val(options.currentPage);
                $this.find(".pageIndex").on("change", function () {
                    if ($(this).val() > options.pageCount) {
                        $(this).val(options.pageCount);
                    } else {
                        $(this).val($(this).val().replace(/\D/g, ''));
                    }
                });
            }
        }

        addPageItem();

        $this.on("click", "span", function () {
            var $span = $(this);
            var pageIndex = 0;
            switch ($span.attr("class")) {
                case "first":
                    pageIndex = 1;
                    break;
                case "pre":
                    pageIndex = options.currentPage - 1;
                    break;
                case "next":
                    pageIndex = options.pageCount == options.currentPage ? 0 : options.currentPage + 1;
                    break;
                case "last":
                    pageIndex = options.pageCount;
                    break;
                case "omit":
                    break;
                default:
                    pageIndex = $span.html();
                    break;
            };

            if (pageIndex == 0)
                return;

            if (options.currentPage != pageIndex) {
                options.callback(pageIndex, 10);
                options.currentPage = pageIndex;
                addPageItem();
                //$this.find(".pageIndex").val(options.currentPage);
                //$this.find(".current_background").removeClass("current_background");
                //$this.find("span").each(function () {
                //    if ($(this).html() == pageIndex) {
                //        $(this).addClass("current_background");
                //        return false;
                //    }
                //});

            }
        })
    }
})(jQuery);

