/*jquery.als v.2.1 | (c) 2012-2020 Federica Sibella musings(at)musings(dot)it | https://www.musings.it | MIT license.*/
!function(t){function i(t){if("string"==typeof t){var i=t.indexOf("_");-1!=i&&(t=t.substr(i+1))}return t}function e(e,s){e.preventDefault(),void 0===s&&(s=t(this));var n=i(s.attr("data-id")),r=o[n];r.next.off(),r.prev.off(),r.viewport.off("touchend"),"yes"===r.settings.autoscroll&&t.fn.als("stop",n),t.fn.als("step",n,"next"),"yes"===r.settings.autoscroll&&t.fn.als("start",n)}function s(e,s){e.preventDefault(),void 0===s&&(s=t(this));var n=i(s.attr("data-id")),r=o[n];r.prev.off(),r.next.off(),r.viewport.off("touchend"),"yes"===r.settings.autoscroll&&t.fn.als("stop",n),t.fn.als("step",n,"prev"),"yes"===r.settings.autoscroll&&t.fn.als("start",n)}function n(e,s){e.preventDefault(),void 0===s&&(s=t(this));var n=i(s.attr("data-id")),r=o[n],a=r.mm,l=e.originalEvent.touches[0]||e.originalEvent.changedTouches[0];void 0===e.originalEvent.touches&&(l=e),a.ox=l.pageX,a.oy=l.pageY,a.startTime=(new Date).getTime()}function r(n,r){n.preventDefault(),void 0===r&&(r=t(this));var a=i(r.attr("data-id")),l=o[a],c=l.mm,m=n.originalEvent.touches[0]||n.originalEvent.changedTouches[0],h=0;void 0===n.originalEvent.touches&&(m=n),c.dx=m.pageX-c.ox,c.dy=m.pageY-c.oy,c.endTime=(new Date).getTime()-c.startTime,h="horizontal"==l.settings.orientation?c.dx:c.dy,h<-c.swipeTreshold&&c.endTime<c.allowedTime?("yes"==l.settings.circular||l.current+l.settings.visible_items<l.settings.num_items)&&e(n,r):h>c.swipeTreshold&&c.endTime<c.allowedTime&&("yes"==l.settings.circular||l.current>0)&&s(n,r)}var o=[],a=0,l={init:function(i){var l={visible_items:"auto",scrolling_items:1,orientation:"horizontal",circular:"no",autoscroll:"no",interval:4e3,speed:600,easing:"swing",direction:"left",start_from:0},c=t.extend({},l,i);o[a]={container:t(),instance:a,settings:c,viewport:t(),wrapper:t(),prev:t(),next:t(),item:t(),num_items:0,init_visible_items:0,init_scrolling_items:0,initial_movement:0,wrapper_width:0,wrapper_height:0,viewport_width:0,viewport_height:0,max_viewport_dimension:0,max_item_dimension:0,max_height:0,max_width:0,current:0,timer:0,mm:{swipeTreshold:30,allowedTime:1e3}},this.each(function(){if(o[a].container=t(this),"no"==o[a].settings.circular&&"yes"==o[a].settings.autoscroll&&(o[a].settings.circular="yes"),"linear"==o[a].settings.easing&&"swing"==o[a].settings.easing||(o[a].settings.easing="swing"),o[a].container.attr("id")&&""!==o[a].container.attr("id")||o[a].container.attr("id","als-container_"+a),o[a].container.attr("data-id","als-container_"+a),o[a].viewport=o[a].container.find(".als-viewport").attr("data-id","als-viewport_"+a),o[a].wrapper=o[a].container.find(".als-wrapper").attr("data-id","als-wrapper_"+a),o[a].item=o[a].container.find(".als-item"),o[a].num_items=o[a].item.length,"number"==typeof o[a].settings.visible_items&&(o[a].settings.visible_items>o[a].num_items&&(o[a].settings.visible_items=o[a].num_items-1),o[a].init_visible_items=o[a].settings.visible_items,o[a].settings.scrolling_items>o[a].settings.visible_items&&(o[a].settings.scrolling_items=o[a].settings.visible_items-1)),o[a].init_scrolling_items=o[a].settings.scrolling_items,o[a].settings.start_from>o[a].num_items-o[a].settings.visible_items&&(o[a].settings.start_from=0),o[a].prev=o[a].container.find(".als-prev").attr("data-id","als-prev_"+a),o[a].next=o[a].container.find(".als-next").attr("data-id","als-next_"+a),o[a].settings.start_from>0&&o[a].settings.start_from<o[a].num_items&&(o[a].current=o[a].settings.start_from),o[a].item.each(function(i){t(this).attr("data-id","als-item_"+a+"_"+i),"horizontal"==o[a].settings.orientation?(o[a].wrapper_width+=t(this).outerWidth(!0),o[a].current>0&&i<o[a].current&&(o[a].initial_movement+=t(this).outerWidth(!0)),t(this).outerHeight(!0)>o[a].max_height&&(o[a].max_height=t(this).outerHeight(!0))):"vertical"==o[a].settings.orientation&&(o[a].wrapper_height+=t(this).outerHeight(!0),o[a].current>0&&i<o[a].current&&(o[a].initial_movement+=t(this).outerHeight(!0)),t(this).outerWidth(!0)>o[a].max_width&&(o[a].max_width=t(this).outerWidth(!0)))}),t.fn.als("resize",a),"horizontal"==o[a].settings.orientation){if(o[a].wrapper.css("width",o[a].wrapper_width),o[a].item.css("left",-o[a].initial_movement),o[a].wrapper.css("height",o[a].max_height),o[a].viewport.css("height",o[a].max_height),o[a].viewport_height=o[a].max_height,o[a].wrapper_height=o[a].max_height,"yes"==o[a].settings.circular&&0!==o[a].settings.start_from)for(var i=o[a].item.last().position().left+o[a].item.last().outerWidth(!0),l=0;l<o[a].settings.start_from;l++)o[a].item.eq(l).css("left",i)}else if("vertical"==o[a].settings.orientation&&(o[a].wrapper.css("height",o[a].wrapper_height),o[a].item.css("top",-o[a].initial_movement),o[a].wrapper.css("width",o[a].max_width),o[a].viewport.css("width",o[a].max_width),o[a].viewport_width=o[a].max_width,o[a].wrapper_width=o[a].max_width,"yes"==o[a].settings.circular&&0!==o[a].settings.start_from))for(var m=o[a].item.last().position().top+o[a].item.last().outerHeight(!0),h=0;h<o[a].settings.start_from;h++)o[a].item.eq(h).css("top",m);return"no"==o[a].settings.circular&&(0===o[a].settings.start_from&&o[a].prev.css("display","none"),o[a].settings.visible_items+o[a].settings.start_from==o[a].num_items&&o[a].next.css("display","none")),o[a].next.on("click touchstart touchend",e),o[a].prev.on("click touchstart touchend",s),o[a].viewport.on("touchstart",n),o[a].viewport.on("touchend",r),"yes"==c.autoscroll?(t.fn.als("start",a),o[a].wrapper.hover(function(){t.fn.als("stop",t(this).attr("data-id"))},function(){t.fn.als("start",t(this).attr("data-id"))})):"no"==c.autoscroll&&t.fn.als("stop",a),a++,o})},step:function(t,n){t=i(t);var a=0,l={},c=0,m={},h="",g=0,u=[],p=0,v={},d=0;"prev"==n&&(o[t].current-=o[t].settings.scrolling_items,h="+=","yes"==o[t].settings.circular&&o[t].current<0&&(o[t].current+=o[t].num_items));for(var _=o[t].current;_<o[t].current+o[t].settings.scrolling_items;_++)if("yes"==o[t].settings.circular){var f=_;_>=o[t].num_items&&(f=_-o[t].num_items),"horizontal"==o[t].settings.orientation?a+=o[t].item.eq(f).outerWidth(!0):"vertical"==o[t].settings.orientation&&(a+=o[t].item.eq(f).outerHeight(!0)),u[g]=f,g++}else"horizontal"==o[t].settings.orientation?a+=o[t].item.eq(_).outerWidth(!0):"vertical"==o[t].settings.orientation&&(a+=o[t].item.eq(_).outerHeight(!0));"next"==n&&(o[t].current+=o[t].settings.scrolling_items,h="-=","yes"==o[t].settings.circular&&o[t].current>=o[t].num_items&&(o[t].current-=o[t].num_items));for(var w=o[t].current;w<o[t].current+o[t].settings.visible_items;w++)if("yes"==o[t].settings.circular){var x=w;w>=o[t].num_items&&(x=w-o[t].num_items),"horizontal"==o[t].settings.orientation?c+o[t].item.eq(x).outerWidth(!0)<o[t].max_viewport_dimension&&(c+=o[t].item.eq(x).outerWidth(!0)):"vertical"==o[t].settings.orientation&&c+o[t].item.eq(x).outerHeight(!0)<o[t].max_viewport_dimension&&(c+=o[t].item.eq(x).outerHeight(!0))}else"horizontal"==o[t].settings.orientation?c+o[t].item.eq(w).outerWidth(!0)<o[t].max_viewport_dimension&&(c+=o[t].item.eq(w).outerWidth(!0)):"vertical"==o[t].settings.orientation&&c+o[t].item.eq(w).outerHeight(!0)<o[t].max_viewport_dimension&&(c+=o[t].item.eq(w).outerHeight(!0));if("horizontal"==o[t].settings.orientation?(m.width=c,l.left=h+a):"vertical"==o[t].settings.orientation&&(m.height=c,l.top=h+a),"yes"==o[t].settings.circular&&"prev"==n){p=o[t].item.first().position(),"horizontal"==o[t].settings.orientation?(d=p.left-o[t].wrapper_width,v.left=d):"vertical"==o[t].settings.orientation&&(d=p.top-o[t].wrapper_height,v.top=d);for(var y=0;y<u.length;y++)if(o[t].item.eq(u[y]).css(v),0===u[y]){var b=o[t].item.eq(0).position(),z=0,q={};"horizontal"==o[t].settings.orientation?(z=b.left-o[t].wrapper_width,q.left=z):"vertical"==o[t].settings.orientation&&(z=b.top-o[t].wrapper_height,q.top=z);for(var H=0;y>H;H++)o[t].item.eq(u[H]).css(q)}}o[t].viewport.animate(m,o[t].settings.speed,o[t].settings.easing),o[t].item.animate(l,o[t].settings.speed,o[t].settings.easing),"yes"==o[t].settings.circular&&"next"==n&&o[t].item.promise().done(function(){p=o[t].item.last().position(),"horizontal"==o[t].settings.orientation?(d=p.left+o[t].item.last().outerWidth(!0),v.left=d):"vertical"==o[t].settings.orientation&&(d=p.top+o[t].item.last().outerHeight(!0),v.top=d);for(var i=0;i<u.length;i++)0===u[i]&&(p=o[t].item.last().position(),"horizontal"==o[t].settings.orientation?(d=p.left+o[t].item.last().outerWidth(!0),v.left=d):"vertical"==o[t].settings.orientation&&(d=p.top+o[t].item.last().outerHeight(!0),v.top=d)),o[t].item.eq(u[i]).css(v)}),"no"==o[t].settings.circular&&(o[t].current>0?o[t].prev.show():o[t].prev.hide(),o[t].current+o[t].settings.visible_items>=o[t].num_items?o[t].next.hide():o[t].next.show()),o[t].item.promise().done(function(){o[t].next.on("click touchstart touchend",e),o[t].prev.on("click touchstart touchend",s),o[t].viewport.on("touchend",r)})},start:function(e){e=i(e);var s=o[e];switch(0!==s.timer&&clearInterval(s.timer),s.settings.direction){default:s.timer=setInterval(function(){s.next.off(),s.prev.off(),s.viewport.off("touchend"),t.fn.als("step",e,"next")},s.settings.interval);break;case"right":case"down":s.timer=setInterval(function(){s.prev.off(),s.next.off(),s.viewport.off("touchend"),t.fn.als("step",e,"prev")},s.settings.interval)}return o[e]=s,o},stop:function(t){t=i(t);var e=o[t];return clearInterval(e.timer),o[t]=e,o},resize:function(e){e=i(e);var s=0,n=0,r=!1,a=t(),l=t(),c=0,m=0,h={};return o[e].current>0?(a=o[e].item.slice(o[e].current),l=o[e].item.slice(0,o[e].current),t.merge(a,l)):a=o[e].item,o[e].prev.length>0&&(n=o[e].prev.position(),"horizontal"==o[e].settings.orientation?n=n.left+o[e].prev.outerWidth(!0):"vertical"==o[e].settings.orientation&&(n=n.top+o[e].prev.outerHeight(!0))),"horizontal"==o[e].settings.orientation?m=parseInt(o[e].container.width()-2*n):"vertical"==o[e].settings.orientation&&(m=parseInt(o[e].container.height()-2*n)),o[e].max_viewport_dimension=m,o[e].max_item_dimension=m,a.each(function(){"horizontal"==o[e].settings.orientation?t(this).css("max-width",m):"vertical"==o[e].settings.orientation&&t(this).css("max-height",m),o[e].init_visible_items>0?r===!1&&("horizontal"==o[e].settings.orientation?s<o[e].init_visible_items&&c+t(this).outerWidth(!0)<m?(c+=t(this).outerWidth(!0),s++):r=!0:"vertical"==o[e].settings.orientation&&(s<o[e].init_visible_items&&c+t(this).outerHeight(!0)<m?(c+=t(this).outerHeight(!0),s++):r=!0)):"horizontal"==o[e].settings.orientation?c+t(this).outerWidth(!0)<m&&(c+=t(this).outerWidth(!0),s++):"vertical"==o[e].settings.orientation&&c+t(this).outerHeight(!0)<m&&(c+=t(this).outerHeight(!0),s++)}),"horizontal"==o[e].settings.orientation?h.width=c:"vertical"==o[e].settings.orientation&&(h.height=c),o[e].viewport.css(h),o[e].settings.visible_items=s,o[e].init_scrolling_items>0&&o[e].init_scrolling_items<=o[e].settings.visible_items?o[e].settings.scrolling_items=o[e].init_scrolling_items:o[e].settings.visible_items>1?o[e].settings.scrolling_items=o[e].settings.visible_items-1:o[e].settings.scrolling_items=1,o},destroy:function(){var e=i(t(this).attr("data-id")),s=o[e];s.prev.off(),s.next.off(),s.viewport.off(),t.fn.als("stop",e),this.unbind(),this.element=null}};t(window).resize(function(){for(var i=0;a>i;i++)t.fn.als("resize",i)}),t.fn.als=function(i){return l[i]?l[i].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof i&&i?void t.error("Method "+i+" does not exist on jQuery.als"):l.init.apply(this,arguments)}}(jQuery);