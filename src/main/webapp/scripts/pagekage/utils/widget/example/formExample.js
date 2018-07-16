/**
 * 表单项默认示例信息
 * User: KeZhong
 * Date: 13-4-12
 * Time: 下午2:51
 */
(function(w){
    /*
    * @THIS指针*/
    var ExampleThis;
    /*
    * @构造器
    * args object 初始化参数*/
    var formExample = function(args){
        this.Opts = {
            elements:args.elements,
            single:args.single,
            slide:args.slide,
            defaultClass:args.defaultClass
        }
        ExampleThis = this;
    }
    /*
    * @绑定表单项焦点处理事件
    * @el element 表单项对象*/
    formExample.prototype.bindEvent = function(el){
        var _els = ExampleThis.Opts.elements;
        var handler = function(curObj,callbackFn){
            var _curObj = curObj,
                _name = _curObj.attr('name'),
                _example = _els[_name],
                _value = _curObj.val();
            if(!_example) return;
            if(typeof callbackFn == 'function'){
                callbackFn.call(curObj,_value, _example);
            }
        }
        el.bind('focus',function(){
            handler($(this),function(value,example){
                if(value == example){
                    if(ExampleThis.Opts.slide){
                        this.animate({textIndent:'-'+ this.css('width')},100,function(){
                            $(this).val('').css({textIndent:'0px'});
                        });
                    }else{
                        this.val('');
                    }
                }
            });
        }).bind('blur',function(){
            if(ExampleThis.Opts.single === true) return;
            handler($(this),function(value,example){
                if(value == ''){
                    if(ExampleThis.Opts.slide){
                        this.css({textIndent:'-'+this.css('width')}).val(example).animate({textIndent:'0px'},100);
                    }else{
                        this.val(example);
                    }
                }
            });
        });
    }
    /*
    * @为表单项绑定示例信息*/
    formExample.prototype.bindExample = function(){
        var _els = ExampleThis.Opts.elements;
        for(var el in _els){
            var _el = $('input[name='+ el +']').size() < 1 ? $('textarea[name='+ el +']').eq(0) : $('input[name='+ el +']').eq(0);
            _el.val(_els[el]);
            ExampleThis.bindEvent(_el);
        }
    }
    /*
    * @启动项*/
    formExample.prototype.init = function(){
        ExampleThis.bindExample();
    }
    w.FormExample = function(args){ new formExample(args).init(); }
})(window);