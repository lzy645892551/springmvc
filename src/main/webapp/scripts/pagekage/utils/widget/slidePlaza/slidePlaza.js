/**
 * 广场选择
 * User: Mr.Co
 * Date: 13-5-30
 * Time: 下午4:59
 */
(function(w){
    var plazaThis;
    var slidePlaza = function(){
        this.opts = {
            cityBox:$('ul#cityBox'),
            areaBox:$('ul#areaBox')
        }
        this.setValue = {
            city:{
                id:0,
                name:''
            },
            area:{
                id:0,
                name:''
            }
        }
        this.DataSource = (function(){
            return [
                {id:1,city:'北京区',area:[
                    {id:1,area:'西单万达广场'},
                    {id:2,area:'北京CBD万达广场'},
                    {id:3,area:'北京石景山万达广场'},
                    {id:4,area:'天通苑万达广场'},
                    {id:5,area:'五棵松万达广场'},
                    {id:6,area:'昌平万达广场'}
                ]},
                {id:2,city:'重庆区',area:[
                    {id:7,area:'洋人街万达广场'},
                    {id:8,area:'解放碑万达广场'},
                    {id:9,area:'菜园坝万达广场'},
                    {id:10,area:'江津万达广场'},
                    {id:11,area:'沙坪坝万达广场'},
                    {id:12,area:'杨家坪万达广场'}
                ]},
                {id:3,city:'上海区',area:[
                    {id:13,area:'美人鱼万达广场'},
                    {id:14,area:'阿海万达广场'},
                    {id:15,area:'积极万达广场'},
                    {id:16,area:'浦东万达广场'},
                    {id:17,area:'新区万达广场'},
                    {id:18,area:'开发区万达广场'}
                ]},
                {id:4,city:'广州区',area:[
                    {id:19,area:'肥西万达广场'},
                    {id:20,area:'牛逼万达广场'},
                    {id:21,area:'你妹万达广场'},
                    {id:22,area:'戏剧万达广场'},
                    {id:23,area:'广发万达广场'},
                    {id:24,area:'你景山万达广场'}
                ]},
                {id:5,city:'大连区',area:[
                    {id:25,area:'它爹万达广场'},
                    {id:26,area:'哈哈万达广场'},
                    {id:27,area:'草拟吗万达广场'},
                    {id:28,area:'奶奶万达广场'},
                    {id:29,area:'请求吧万达广场'},
                    {id:30,area:'订单万达广场'}
                ]},
                {id:6,city:'宁夏区',area:[
                    {id:31,area:'菲菲万达广场'},
                    {id:32,area:'加加万达广场'},
                    {id:33,area:'卑鄙万达广场'},
                    {id:34,area:'查查万达广场'},
                    {id:35,area:'品牌万达广场'},
                    {id:36,area:'信息万达广场'}
                ]}
            ];
        })();
        plazaThis = this;
    }

    slidePlaza.prototype.setPrevLastItemColor = function(node){
        node.parent().find('a[class=gray]').removeAttr('class');
        node.prev().prev().children('a').addClass('gray');
        node.next().next().children('a').addClass('gray');
        return plazaThis;
    }

    slidePlaza.prototype.bindDataSource = {
        cityList:function(){
            var _data =  plazaThis.DataSource,_listTemp = '';
            for(var i = 0,_count = _data.length; i < _count; i++){
                var _cityObj = _data[i],
                    _hoverCls = i == 2 ? ' class="hover" ' : '';
                _listTemp += '<li cityid="'+ _cityObj.id +'" ' + _hoverCls + '><a>' + _cityObj.city + '</a></li>';
            }
            plazaThis.opts.cityBox.html(_listTemp);
            return plazaThis;
        },
        areaList:function(cityId){
            var _data =  plazaThis.DataSource,_listTemp = '';
            for(var i = 0,_count = _data.length; i < _count; i++){
                var _cityObj = _data[i];
                if(_cityObj.id === cityId){
                    for(var j = 0,_countJ = _cityObj.area.length; j < _countJ; j++){
                        var _areaObj = _cityObj.area[j],
                            _hoverCls = j === 2 ? ' class="hover" ' : '';
                        _listTemp += '<li areaid="'+ _areaObj.id +'" ' + _hoverCls + '><a>' + _areaObj.area + '</a></li>';
                    }
                }
            }
            plazaThis.opts.areaBox.css({top:'0px'}).html(_listTemp);
            plazaThis.bindSwipeEvent.areaSwipe().eq(2).click();
            return plazaThis;
        }
    }

    slidePlaza.prototype.bindSwipeEvent = {
        citySwipe:function(){
            var _cityBox = plazaThis.opts.cityBox,
                _cityEls = _cityBox.children('li'),
                _moveHeight = 35,
                _curMoveHeight = 0;

            _cityEls.on('click',function(){
                var _curObj = $(this),
                    _curIndex = _curObj.index(),
                    _cityId = parseInt(_curObj.attr('cityId')),
                    _cityName = _curObj.text(),
                    _hoverIndex = _cityBox.children('li[class=hover]').index();

                _curMoveHeight =  _hoverIndex > _curIndex ? _curMoveHeight + _moveHeight * (_hoverIndex - _curIndex) : parseInt(_cityBox.css('top').replace('px')) - _moveHeight * (_curIndex - _hoverIndex);
                _cityBox.css({top:_curMoveHeight +'px'});
                _cityEls.removeClass('hover').eq(_curIndex).addClass('hover');
                plazaThis.setPrevLastItemColor(_curObj);

                plazaThis.setValue.city.id = _cityId;
                plazaThis.setValue.city.name = _cityName;
                plazaThis.bindDataSource.areaList(_cityId);
            });
            return _cityEls;
        },
        areaSwipe:function(){
            var _areaBox = plazaThis.opts.areaBox,
                _areaEls = _areaBox.children('li'),
                _moveHeight = 35,
                _curMoveHeight = 0;

            _areaEls.on('click',function(){
                var _curObj = $(this),
                    _curIndex = _curObj.index(),
                    _areaId = parseInt(_curObj.attr('areaId')),
                    _areaName = _curObj.text(),
                    _hoverIndex = _areaBox.children('li[class=hover]').index();

                _curMoveHeight =  _hoverIndex > _curIndex ? _curMoveHeight + _moveHeight * (_hoverIndex - _curIndex) : parseInt(_areaBox.css('top').replace('px')) - _moveHeight * (_curIndex - _hoverIndex);
                _areaBox.css({top:_curMoveHeight +'px'});
                _areaEls.removeClass('hover').eq(_curIndex).addClass('hover');
                plazaThis.setPrevLastItemColor(_curObj);

                plazaThis.setValue.area.id = _areaId;
                plazaThis.setValue.area.name = _areaName;
            });
            return _areaEls;
        }
    }

    slidePlaza.prototype.getValue = function(){
        return plazaThis.setValue;
    }

    slidePlaza.prototype.init = function(){
        plazaThis.bindDataSource.cityList();
        plazaThis.bindSwipeEvent.citySwipe().eq(2).click();
        return plazaThis;
    }

    w.slidePlaza = {
        getValue:new slidePlaza().init().getValue()
    };
})(window);