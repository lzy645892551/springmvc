/**
 * 菜单-DEMO
 * User: MrCo
 * Date: 13-9-12
 * Time: 下午8:11
 */
GLOBAL.pagebase.add({
    MainNav: function () {
        var _pagebase = GLOBAL.pagebase;        

        //获取菜单
        GLOBAL.load('/scripts/pagekage/datastore/dataHandle.js', '', function () {
            var _dataHandle = GLOBAL.dataStore.dataHandle;            
            _dataHandle.postData({
                url: _pagebase.ServiceURL,
                handler: 'data',
                parame: '{fucid:"addList",data:"11,22"};{fucid:"updateMenu",data:"{aaa,bbb}|{bbb,ccc}|{ddd,eee}"}',
                success: function (data) {
                    data = eval('(' + data + ')').data;                    
                    var _listTemplate = $('#mainNav_template').html(),
                        _list = '';
                    for (var i = 0, _count = data.length; i < _count; i++) {
                        _list += _listTemplate.replaceData(data[i]);
                    }
                    $('#mainNav').html(_list);
                }
            })
        });

        //添加
        $('#btnSave').on('click', function () {
            GLOBAL.load('/scripts/pagekage/datastore/dataHandle.js', '', function () {
                var _dataHandle = GLOBAL.dataStore.dataHandle;                
                _dataHandle.postData({
                    url: _pagebase.ServiceURL,
                    handler: 'data',
                    parame: '{fucid:"addMenu",data:"' + $('#txtNavName').val() + '"}',
                    success: function (data) {
                        data = eval('(' + data + ')');
                        if (data.status == '200') {
                            location.href = location.href;
                        }
                    }
                })
            });
        });

        //删除
        $('#btnSave2').on('click', function () {
            GLOBAL.load('/scripts/pagekage/datastore/dataHandle.js', '', function () {
                var _dataHandle = GLOBAL.dataStore.dataHandle;                
                _dataHandle.postData({
                    url: _pagebase.ServiceURL,
                    handler: 'data',
                    parame: '{fucid:"delMenu",data:"' + $('#txtNavName2').val() + '"}',
                    success: function (data) {
                        data = eval('(' + data + ')');
                        if (data.status == '200') {
                            location.href = location.href;
                        }
                    }
                })
            });
        });

        //更新
        $('#btnSave3').on('click', function () {
            GLOBAL.load('/scripts/pagekage/datastore/dataHandle.js', '', function () {
                var _dataHandle = GLOBAL.dataStore.dataHandle;
                _dataHandle.postData({
                    url: _pagebase.ServiceURL,
                    handler: 'data',
                    parame: '{fucid:"updateMenu",data:"' + $('#txtOldName').val() + ',' + $('#txtNewName').val() + '"}',
                    success: function (data) {
                        data = eval('(' + data + ')');
                        if (data.status == '200') {
                            location.href = location.href;
                        }
                    }
                })
            });
        });
    }
});