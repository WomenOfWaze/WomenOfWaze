/*
 * jQuery Nivo Slider v2.6
 * http://nivo.dev7studios.com
 *
 * Copyright 2011, Gilbert Pellegrom
 * Free to use and abuse under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * March 2010
 */
(function(a){var b=function(b,c){var d=a.extend({},a.fn.nivoSlider.defaults,c),e={currentSlide:0,currentImage:"",totalSlides:0,randAnim:"",running:!1,paused:!1,stop:!1},f=a(b);f.data("nivo:vars",e),f.css("position","relative"),f.addClass("nivoSlider");var g=f.children();g.each(function(){var b=a(this),c="";b.is("img")||(b.is("a")&&(b.addClass("nivo-imageLink"),c=b),b=b.find("img:first"));var d=b.width();d==0&&(d=b.attr("width"));var g=b.height();g==0&&(g=b.attr("height")),d>f.width()&&f.width(d),g>f.height()&&f.height(g),c!=""&&c.css("display","none"),b.css("display","none"),e.totalSlides++}),d.startSlide>0&&(d.startSlide>=e.totalSlides&&(d.startSlide=e.totalSlides-1),e.currentSlide=d.startSlide),a(g[e.currentSlide]).is("img")?e.currentImage=a(g[e.currentSlide]):e.currentImage=a(g[e.currentSlide]).find("img:first"),a(g[e.currentSlide]).is("a")&&a(g[e.currentSlide]).css("display","block"),f.css("background",'url("'+e.currentImage.attr("src")+'") no-repeat'),f.append(a('<div class="nivo-caption"><p></p></div>').css({display:"none",opacity:d.captionOpacity}));var h=function(b){var c=a(".nivo-caption",f);if(e.currentImage.attr("title")!=""&&e.currentImage.attr("title")!=undefined){var d=e.currentImage.attr("title");d.substr(0,1)=="#"&&(d=a(d).html()),c.css("display")=="block"?c.find("p").fadeOut(b.animSpeed,function(){a(this).html(d),a(this).fadeIn(b.animSpeed)}):c.find("p").html(d),c.fadeIn(b.animSpeed)}else c.fadeOut(b.animSpeed)};h(d);var i=0;!d.manualAdvance&&g.length>1&&(i=setInterval(function(){o(f,g,d,!1)},d.pauseTime)),d.directionNav&&(f.append('<div class="nivo-directionNav"><a class="nivo-prevNav">'+d.prevText+'</a><a class="nivo-nextNav">'+d.nextText+"</a></div>"),d.directionNavHide&&(a(".nivo-directionNav",f).hide(),f.hover(function(){a(".nivo-directionNav",f).show()},function(){a(".nivo-directionNav",f).hide()})),a("a.nivo-prevNav",f).live("click",function(){if(e.running)return!1;clearInterval(i),i="",e.currentSlide-=2,o(f,g,d,"prev")}),a("a.nivo-nextNav",f).live("click",function(){if(e.running)return!1;clearInterval(i),i="",o(f,g,d,"next")}));if(d.controlNav){var j=a('<div class="nivo-controlNav"></div>');f.append(j);for(var k=0;k<g.length;k++)if(d.controlNavThumbs){var l=g.eq(k);l.is("img")||(l=l.find("img:first")),d.controlNavThumbsFromRel?j.append('<a class="nivo-control" rel="'+k+'"><img src="'+l.attr("rel")+'" alt="" /></a>'):j.append('<a class="nivo-control" rel="'+k+'"><img src="'+l.attr("src").replace(d.controlNavThumbsSearch,d.controlNavThumbsReplace)+'" alt="" /></a>')}else j.append('<a class="nivo-control" rel="'+k+'">'+(k+1)+"</a>");a(".nivo-controlNav a:eq("+e.currentSlide+")",f).addClass("active"),a(".nivo-controlNav a",f).live("click",function(){if(e.running)return!1;if(a(this).hasClass("active"))return!1;clearInterval(i),i="",f.css("background",'url("'+e.currentImage.attr("src")+'") no-repeat'),e.currentSlide=a(this).attr("rel")-1,o(f,g,d,"control")})}d.keyboardNav&&a(window).keypress(function(a){if(a.keyCode=="37"){if(e.running)return!1;clearInterval(i),i="",e.currentSlide-=2,o(f,g,d,"prev")}if(a.keyCode=="39"){if(e.running)return!1;clearInterval(i),i="",o(f,g,d,"next")}}),d.pauseOnHover&&f.hover(function(){e.paused=!0,clearInterval(i),i=""},function(){e.paused=!1,i==""&&!d.manualAdvance&&(i=setInterval(function(){o(f,g,d,!1)},d.pauseTime))}),f.bind("nivo:animFinished",function(){e.running=!1,a(g).each(function(){a(this).is("a")&&a(this).css("display","none")}),a(g[e.currentSlide]).is("a")&&a(g[e.currentSlide]).css("display","block"),i==""&&!e.paused&&!d.manualAdvance&&(i=setInterval(function(){o(f,g,d,!1)},d.pauseTime)),d.afterChange.call(this)});var m=function(b,c,d){for(var e=0;e<c.slices;e++){var f=Math.round(b.width()/c.slices);e==c.slices-1?b.append(a('<div class="nivo-slice"></div>').css({left:f*e+"px",width:b.width()-f*e+"px",height:"0px",opacity:"0",background:'url("'+d.currentImage.attr("src")+'") no-repeat -'+(f+e*f-f)+"px 0%"})):b.append(a('<div class="nivo-slice"></div>').css({left:f*e+"px",width:f+"px",height:"0px",opacity:"0",background:'url("'+d.currentImage.attr("src")+'") no-repeat -'+(f+e*f-f)+"px 0%"}))}},n=function(b,c,d){var e=Math.round(b.width()/c.boxCols),f=Math.round(b.height()/c.boxRows);for(var g=0;g<c.boxRows;g++)for(var h=0;h<c.boxCols;h++)h==c.boxCols-1?b.append(a('<div class="nivo-box"></div>').css({opacity:0,left:e*h+"px",top:f*g+"px",width:b.width()-e*h+"px",height:f+"px",background:'url("'+d.currentImage.attr("src")+'") no-repeat -'+(e+h*e-e)+"px -"+(f+g*f-f)+"px"})):b.append(a('<div class="nivo-box"></div>').css({opacity:0,left:e*h+"px",top:f*g+"px",width:e+"px",height:f+"px",background:'url("'+d.currentImage.attr("src")+'") no-repeat -'+(e+h*e-e)+"px -"+(f+g*f-f)+"px"}))},o=function(b,c,d,e){var f=b.data("nivo:vars");f&&f.currentSlide==f.totalSlides-1&&d.lastSlide.call(this);if((!f||f.stop)&&!e)return!1;d.beforeChange.call(this),e?(e=="prev"&&b.css("background",'url("'+f.currentImage.attr("src")+'") no-repeat'),e=="next"&&b.css("background",'url("'+f.currentImage.attr("src")+'") no-repeat')):b.css("background",'url("'+f.currentImage.attr("src")+'") no-repeat'),f.currentSlide++,f.currentSlide==f.totalSlides&&(f.currentSlide=0,d.slideshowEnd.call(this)),f.currentSlide<0&&(f.currentSlide=f.totalSlides-1),a(c[f.currentSlide]).is("img")?f.currentImage=a(c[f.currentSlide]):f.currentImage=a(c[f.currentSlide]).find("img:first"),d.controlNav&&(a(".nivo-controlNav a",b).removeClass("active"),a(".nivo-controlNav a:eq("+f.currentSlide+")",b).addClass("active")),h(d),a(".nivo-slice",b).remove(),a(".nivo-box",b).remove();if(d.effect=="random"){var g=["sliceDownRight","sliceDownLeft","sliceUpRight","sliceUpLeft","sliceUpDown","sliceUpDownLeft","fold","fade","boxRandom","boxRain","boxRainReverse","boxRainGrow","boxRainGrowReverse"];f.randAnim=g[Math.floor(Math.random()*(g.length+1))],f.randAnim==undefined&&(f.randAnim="fade")}if(d.effect.indexOf(",")!=-1){var g=d.effect.split(",");f.randAnim=g[Math.floor(Math.random()*g.length)],f.randAnim==undefined&&(f.randAnim="fade")}f.running=!0;if(d.effect=="sliceDown"||d.effect=="sliceDownRight"||f.randAnim=="sliceDownRight"||d.effect=="sliceDownLeft"||f.randAnim=="sliceDownLeft"){m(b,d,f);var i=0,j=0,k=a(".nivo-slice",b);if(d.effect=="sliceDownLeft"||f.randAnim=="sliceDownLeft")k=a(".nivo-slice",b)._reverse();k.each(function(){var c=a(this);c.css({top:"0px"}),j==d.slices-1?setTimeout(function(){c.animate({height:"100%",opacity:"1.0"},d.animSpeed,"",function(){b.trigger("nivo:animFinished")})},100+i):setTimeout(function(){c.animate({height:"100%",opacity:"1.0"},d.animSpeed)},100+i),i+=50,j++})}else if(d.effect=="sliceUp"||d.effect=="sliceUpRight"||f.randAnim=="sliceUpRight"||d.effect=="sliceUpLeft"||f.randAnim=="sliceUpLeft"){m(b,d,f);var i=0,j=0,k=a(".nivo-slice",b);if(d.effect=="sliceUpLeft"||f.randAnim=="sliceUpLeft")k=a(".nivo-slice",b)._reverse();k.each(function(){var c=a(this);c.css({bottom:"0px"}),j==d.slices-1?setTimeout(function(){c.animate({height:"100%",opacity:"1.0"},d.animSpeed,"",function(){b.trigger("nivo:animFinished")})},100+i):setTimeout(function(){c.animate({height:"100%",opacity:"1.0"},d.animSpeed)},100+i),i+=50,j++})}else if(d.effect=="sliceUpDown"||d.effect=="sliceUpDownRight"||f.randAnim=="sliceUpDown"||d.effect=="sliceUpDownLeft"||f.randAnim=="sliceUpDownLeft"){m(b,d,f);var i=0,j=0,l=0,k=a(".nivo-slice",b);if(d.effect=="sliceUpDownLeft"||f.randAnim=="sliceUpDownLeft")k=a(".nivo-slice",b)._reverse();k.each(function(){var c=a(this);j==0?(c.css("top","0px"),j++):(c.css("bottom","0px"),j=0),l==d.slices-1?setTimeout(function(){c.animate({height:"100%",opacity:"1.0"},d.animSpeed,"",function(){b.trigger("nivo:animFinished")})},100+i):setTimeout(function(){c.animate({height:"100%",opacity:"1.0"},d.animSpeed)},100+i),i+=50,l++})}else if(d.effect=="fold"||f.randAnim=="fold"){m(b,d,f);var i=0,j=0;a(".nivo-slice",b).each(function(){var c=a(this),e=c.width();c.css({top:"0px",height:"100%",width:"0px"}),j==d.slices-1?setTimeout(function(){c.animate({width:e,opacity:"1.0"},d.animSpeed,"",function(){b.trigger("nivo:animFinished")})},100+i):setTimeout(function(){c.animate({width:e,opacity:"1.0"},d.animSpeed)},100+i),i+=50,j++})}else if(d.effect=="fade"||f.randAnim=="fade"){m(b,d,f);var o=a(".nivo-slice:first",b);o.css({height:"100%",width:b.width()+"px"}),o.animate({opacity:"1.0"},d.animSpeed*2,"",function(){b.trigger("nivo:animFinished")})}else if(d.effect=="slideInRight"||f.randAnim=="slideInRight"){m(b,d,f);var o=a(".nivo-slice:first",b);o.css({height:"100%",width:"0px",opacity:"1"}),o.animate({width:b.width()+"px"},d.animSpeed*2,"",function(){b.trigger("nivo:animFinished")})}else if(d.effect=="slideInLeft"||f.randAnim=="slideInLeft"){m(b,d,f);var o=a(".nivo-slice:first",b);o.css({height:"100%",width:"0px",opacity:"1",left:"",right:"0px"}),o.animate({width:b.width()+"px"},d.animSpeed*2,"",function(){o.css({left:"0px",right:""}),b.trigger("nivo:animFinished")})}else if(d.effect=="boxRandom"||f.randAnim=="boxRandom"){n(b,d,f);var q=d.boxCols*d.boxRows,j=0,i=0,r=p(a(".nivo-box",b));r.each(function(){var c=a(this);j==q-1?setTimeout(function(){c.animate({opacity:"1"},d.animSpeed,"",function(){b.trigger("nivo:animFinished")})},100+i):setTimeout(function(){c.animate({opacity:"1"},d.animSpeed)},100+i),i+=20,j++})}else if(d.effect=="boxRain"||f.randAnim=="boxRain"||d.effect=="boxRainReverse"||f.randAnim=="boxRainReverse"||d.effect=="boxRainGrow"||f.randAnim=="boxRainGrow"||d.effect=="boxRainGrowReverse"||f.randAnim=="boxRainGrowReverse"){n(b,d,f);var q=d.boxCols*d.boxRows,j=0,i=0,s=0,t=0,u=[];u[s]=[];var r=a(".nivo-box",b);if(d.effect=="boxRainReverse"||f.randAnim=="boxRainReverse"||d.effect=="boxRainGrowReverse"||f.randAnim=="boxRainGrowReverse")r=a(".nivo-box",b)._reverse();r.each(function(){u[s][t]=a(this),t++,t==d.boxCols&&(s++,t=0,u[s]=[])});for(var v=0;v<d.boxCols*2;v++){var w=v;for(var x=0;x<d.boxRows;x++)w>=0&&w<d.boxCols&&(function(c,e,g,h,i){var j=a(u[c][e]),k=j.width(),l=j.height();(d.effect=="boxRainGrow"||f.randAnim=="boxRainGrow"||d.effect=="boxRainGrowReverse"||f.randAnim=="boxRainGrowReverse")&&j.width(0).height(0),h==i-1?setTimeout(function(){j.animate({opacity:"1",width:k,height:l},d.animSpeed/1.3,"",function(){b.trigger("nivo:animFinished")})},100+g):setTimeout(function(){j.animate({opacity:"1",width:k,height:l},d.animSpeed/1.3)},100+g)}(x,w,i,j,q),j++),w--;i+=100}}},p=function(a){for(var b,c,d=a.length;d;b=parseInt(Math.random()*d),c=a[--d],a[d]=a[b],a[b]=c);return a},q=function(a){this.console&&typeof console.log!="undefined"&&console.log(a)};return this.stop=function(){a(b).data("nivo:vars").stop||(a(b).data("nivo:vars").stop=!0,q("Stop Slider"))},this.start=function(){a(b).data("nivo:vars").stop&&(a(b).data("nivo:vars").stop=!1,q("Start Slider"))},d.afterLoad.call(this),this};a.fn.nivoSlider=function(c){return this.each(function(d,e){var f=a(this);if(f.data("nivoslider"))return f.data("nivoslider");var g=new b(this,c);f.data("nivoslider",g)})},a.fn.nivoSlider.defaults={effect:"random",slices:15,boxCols:8,boxRows:4,animSpeed:500,pauseTime:3e3,startSlide:0,directionNav:!0,directionNavHide:!0,controlNav:!0,controlNavThumbs:!1,controlNavThumbsFromRel:!1,controlNavThumbsSearch:".jpg",controlNavThumbsReplace:"_thumb.jpg",keyboardNav:!0,pauseOnHover:!0,manualAdvance:!1,captionOpacity:.8,prevText:"Prev",nextText:"Next",beforeChange:function(){},afterChange:function(){},slideshowEnd:function(){},lastSlide:function(){},afterLoad:function(){}},a.fn._reverse=[].reverse})(jQuery)