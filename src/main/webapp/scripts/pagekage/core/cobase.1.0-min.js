﻿if(typeof GLOBAL=="undefined"){GLOBAL={}}GLOBAL.Namespace=function(str,callFn){var arr=str.split("."),o=GLOBAL;for(var i=(arr[0]=="GLOBAL")?1:0;i<arr.length;i++){o[arr[i]]=o[arr[i]]||{};o=o[arr[i]]}var curObj=eval("GLOBAL."+str);if(typeof callFn=="function"){callFn.call(curObj)}};GLOBAL.Load=function(l,h,g){var c,b=document.getElementsByTagName("head")[0],e=l instanceof Array,f=e?l.length:0,d=0,a=0;h=h?h:"";var k=function(r){var p=r.match(/[a-z0-9A-Z-_]*.js$/)?"script":"link",o=document.getElementsByTagName(p),n=false;for(var q=0,m=o.length;q<m;q++){(function(u){var s=o[u],t=s.getAttribute("src")||s.getAttribute("href");if(t&&r.toLowerCase()===t.toLowerCase()){s.parentNode.removeChild(s);n=true}})(q);if(n){break}}return n};var i=function(o){k(o);c=o.match(/\.js$/)?document.createElement("script"):document.createElement("link");var m=navigator.userAgent.indexOf("MSIE")>-1;if(m){c.onreadystatechange=function(){if(c.readyState&&c.readyState=="loaded"||c.readyState=="complete"){d++;a++;if(e&&d<=(f-1)){i(l[d])}}}}else{c.onload=function(){d++;a++;if(e&&d<=(f-1)){i(l[d])}}}if(c.nodeName.toLowerCase()==="script"){c.setAttribute("type","text/javascript");c.setAttribute("language","javascript");var n="?r="+Math.random();if(o.indexOf("http://")>-1){c.setAttribute("src",o+n)}else{c.setAttribute("src",h+o+n)}}else{c.setAttribute("type","text/css");c.setAttribute("rel","stylesheet");var n="?r="+Math.random();if(o.indexOf("http://")>-1){c.setAttribute("href",o+n)}else{c.setAttribute("href",h+o+n)}}b.appendChild(c)},j=setInterval(function(){if(typeof g!="function"){clearInterval(j);return}if((e&&a===f)||(!e&&a===1)){clearInterval(j);g()}},1);if(e&&f>0){i(l[d])}else{i(l)}};GLOBAL.Cookie=function(c,g,d){if(arguments.length>1&&String(g)!=="[object Object]"){d=$.extend({},d);if(g===null||g===undefined){d.expires=-1}if(typeof d.expires==="number"){var a=d.expires,f=d.expires=new Date();f.setDate(f.getDate()+a)}g=String(g);return(document.cookie=[encodeURIComponent(c),"=",d.raw?g:encodeURIComponent(g),d.expires?"; expires="+d.expires.toUTCString():"",d.path?"; path="+d.path:"",d.domain?"; domain="+d.domain:"",d.secure?"; secure":""].join(""))}d=g||{};var e,b=d.raw?function(h){return h}:decodeURIComponent;return(e=new RegExp("(?:^|; )"+encodeURIComponent(c)+"=([^;]*)").exec(document.cookie))?b(e[1]):null};GLOBAL.Common={CovnertDate:function(c){if(c!=null){var b=new Date(parseInt(c.replace("/Date(","").replace(")/",""),10));var d=b.getMonth()+1<10?"0"+(b.getMonth()+1):b.getMonth()+1;var a=b.getDate()<10?"0"+b.getDate():b.getDate();return b.getFullYear()+"-"+d+"-"+a}return""},BrowserVersion:(function(){var b=navigator.userAgent,a=navigator.appVersion;return{trident:b.indexOf("Trident")>-1,presto:b.indexOf("Presto")>-1,webKit:b.indexOf("AppleWebKit")>-1,gecko:b.indexOf("Gecko")>-1&&b.indexOf("KHTML")==-1,mobile:!!b.match(/AppleWebKit.*Mobile.*/)||!!b.match(/AppleWebKit/),ios:!!b.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),android:b.indexOf("Android")>-1||b.indexOf("Linux")>-1,iPhone:b.indexOf("iPhone")>-1||b.indexOf("Mac")>-1,iPad:b.indexOf("iPad")>-1,webApp:b.indexOf("Safari")==-1}})(),ObjectToString:function(c){var a="{";for(var b in c){a+=b+':"'+c[b]+'",'}return a.substring(0,a.length-1)+"}"},ObjectToDataJson:function(c){var a="";for(var b in c){a+=b+":"+c[b]+","}return a.substring(0,a.length-1)},NewGuid:function(){var a="";for(var b=1;b<=32;b++){var c=Math.floor(Math.random()*16).toString(16);a+=c;if((b==8)||(b==12)||(b==16)||(b==20)){a+="-"}}return a.toUpperCase()},DecodeFormText:function(e){var b=["~","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","]","{","}","'","|",";",":","\\",'"',",","<",".",">","/","?","`"];for(var d=0,c=b.length;d<c;d++){var a=b[d];while(e.match(escape(a))){e=e.replace(escape(a),a)}}return e},EncodeFormText:function(f){var b=[/~/g,/!/g,/@/g,/#/g,/$/g,/%/g,/^/g,/&/g,/\*/g,/\(/g,/\)/g,/-/g,/_/g,/\+/g,/=/g,/\[/g,/'\]/g,/{/g,/}/g,/\'/g,/|/g,/;/g,/:/g,/\\/g,/"/g,/,/g,/</g,/./g,/>/g,/\//g,/\?/g,/\`/g];var c=["~","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","]","{","}","'","|",";",":","\\",'"',",","<",".",">","/","?","`"];for(var e=0,d=b.length;e<d;e++){var a=b[e];f=f.replace(a,escape(c[e]))}return f},EncodeParame:function(a){return encodeURIComponent(encodeURIComponent(this.EncodeFormText(a)))},DecodeParame:function(a){return decodeURIComponent(decodeURIComponent(this.DecodeFormText(a)))},EncodeParameOnce:function(a){return encodeURIComponent(this.EncodeFormText(a))},DecodeParameOnce:function(a){return decodeURIComponent(this.DecodeFormText(a))}};String.prototype.cutString=function(b,a){return this.length>b?this.substring(0,b)+a:this};Number.prototype.format=function(){var b=this.toString().replace(/\$|\,/g,"");if(isNaN(b)){b="0"}sign=(b==(b=Math.abs(b)));b=Math.floor(b*100+0.50000000001);cents=b%100;b=Math.floor(b/100).toString();if(cents<10){cents="0"+cents}for(var a=0;a<Math.floor((b.length-(1+a))/3);a++){b=b.substring(0,b.length-(4*a+3))+","+b.substring(b.length-(4*a+3))}return(((sign)?"":"-")+b+"."+cents)};Date.prototype.format=function(c){if(!c||c==""){c="yyyy-MM-dd"}var m=this.getFullYear().toString();var h=(this.getMonth()+1).toString();var a=this.getDate().toString();var n=c.replace(/[^y|Y]/g,"");var d=this.getHours().toString(),f=this.getMinutes().toString(),j=this.getSeconds().toString();if(n.length==2){m=m.substring(2,4)}var i=c.replace(/[^M]/g,"");if(i.length>1){if(h.length==1){h="0"+h}}var b=c.replace(/[^d]/g,"");if(b.length>1){if(a.length==1){a="0"+a}}var e=c.replace(/[^h|H]/g,"");if(e.length>1){if(d.length==1){d="0"+d}}var g=c.replace(/[^m]/g,"");if(g.length>1){if(f.length==1){f="0"+f}}var k=c.replace(/[^s|S]/g,"");if(k.length>1){if(j.length==1){j="0"+j}}var l=c;if(n.length>1){l=l.replace(n,m)}if(i.length>1){l=l.replace(i,h)}if(b.length>1){l=l.replace(b,a)}if(e.length>1){l=l.replace(e,d)}if(g.length>1){l=l.replace(g,f)}if(k.length>1){l=l.replace(k,j)}return l};Date.prototype.format2=function(a){var c={"M+":this.getMonth()+1,"d+":this.getDate(),"h+":this.getHours(),"m+":this.getMinutes(),"s+":this.getSeconds(),"q+":Math.floor((this.getMonth()+3)/3),S:this.getMilliseconds()};if(/(y+)/.test(a)){a=a.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length))}for(var b in c){if(new RegExp("("+b+")").test(a)){a=a.replace(RegExp.$1,(RegExp.$1.length==1)?(c[b]):(("00"+c[b]).substr((""+c[b]).length)))}}return a};String.prototype.replaceData=function(a){return this.replace(/(\{(.*?)\})/g,function(d,e,f){return a[f]})};