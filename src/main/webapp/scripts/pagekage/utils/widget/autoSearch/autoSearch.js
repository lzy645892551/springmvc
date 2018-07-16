/**
 * 智能检索
 * User: KeZhong
 * Date: 14/06/06
 * Time: 上午10:20
 * Version:1.0
 */
(function ($) {
    var search = function (settings) {
        var opts = $.extend({
            isLoad: false,
            keyBoxMove: false,
            fucID: 'testSearch_select',
            url: '/service/main.ashx'
        }, settings),
             $cur = this;

        var createKeyBox = function (id, width, left, top) {
            var _boxID = 'searchKeyBox_' + id,
                 _boxHtml = '<div id="' + _boxID + '" class="search_key_box" style="width:' + width + 'px;left:' + left + 'px; top:' + top + 'px;">加载中....</div>';

            if ($('#' + _boxID).size() > 0) return $('#' + _boxID).html('加载中....').show();
            $(document.body).append(_boxHtml);
            return $('#' + _boxID);
        }


        $('div.search_key_box').live('mouseover', function () {
            opts.keyBoxMove = true;
        }).live('mouseout', function (e) {
            opts.keyBoxMove = false;
            var $cur = $(this);
            setTimeout(function () {
                if (opts.keyBoxMove === false) {
                    $cur.hide();
                }
            }, 200);
        });

        $('div.search_key_box a').live('mouseover', function (e) {
            opts.keyBoxMove = true;
        }).live('mouseout', function () {
            opts.keyBoxMove = false;
            var $cur = $(this).parent();
            setTimeout(function () {
                if (opts.keyBoxMove === false) {
                    $cur.hide();
                }
            }, 200);
        });

        var selecteHandler = function (id, $txt, text) {
            $txt.val(text);
            $('#searchKeyBox_' + id).hide();
        }

        var searchCount,
            keyupHandler = function (e) {
                var _$cur = $(this),
                    _id = _$cur.attr('id'),
                    _height = _$cur.height() + 3,
                    _width = _$cur.width(),
                    _offset = _$cur.offset(),
                    _left = _offset.left,
                    _top = _offset.top,
                    $keyBox,
                    _keyHtml = '';

                $('#searchKeyBox_' + _id).hide();

                if (/^\s*$/.test(_$cur.val()) || searchCount) return;

                searchCount = setTimeout(function () {
                    $.ajax({
                        type: 'GET',
                        url: opts.url,
                        data: 'postType=get&handler=data&data={fucid:"' + opts.fucID + '",data:"' + escape(_$cur.val()) + '"}&debug=0',
                        cache: false,
                        dataType: 'json',
                        beforeSend: function () {
                            //$keyBox.html('智能检索中..');
                        },
                        success: function (data) {

                            searchCount = false;

                            //var data = [{ID:'1',Name:'张三'},{ID:'1',Name:'张三'},{ID:'1',Name:'张三'},{ID:'1',Name:'张三'}];                     
                            data = data.data;

                            for (var i = 0, _count = data.length; i < _count; i++) {
                                _keyHtml += '<a class="search_key" href="javascript:void(0)" idx="' + data[i].ID + '">' + data[i].Name + '</a>';
                            }

                            if (_keyHtml == '') return;

                            $keyBox = createKeyBox(_id, _width, _left, _top + _height);

                            $keyBox.html(_keyHtml).show().children('a').bind('click', function () {
                                selecteHandler(_id, _$cur, $(this).text());
                            });

                            if ($keyBox.height() >= 200) {
                                $keyBox.addClass('max_height');
                            } else {
                                $keyBox.removeClass('max_height');
                            }
                        },
                        error: function () {

                        }
                    });
                }, 300);
            }

        $cur.bind('keyup', keyupHandler);
    }
    $.fn.AutoSearch = search;
})(jQuery)
