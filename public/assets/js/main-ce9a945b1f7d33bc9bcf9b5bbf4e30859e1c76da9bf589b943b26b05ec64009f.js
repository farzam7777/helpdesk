!function(h){"use strict";var v=h(window),y=h(document),w=h("body"),b=function(e,t){return void 0===e?t:e};h(function(){h("[data-bg-img]").css("background-image",function(){return'url("'+h(this).data("bg-img")+'")'}).addClass("bg--img").removeAttr("data-bg-img").attr("data-rjs",2);var e=h('[data-toggle="tooltip"]');e.length&&e.tooltip();var t=h('[data-trigger="sticky"]');t.each(function(){t.sticky({zIndex:999})});var a=h('[data-trigger="counterup"]');a.length&&a.counterUp({delay:10,time:1e3});var o=h('[data-trigger="selectmenu"]');o.length&&o.customSelectMenu(),h('[data-form="validate"] form').each(function(){h(this).validate({errorPlacement:function(){return!0}})}),h('[data-form="ajax"] form').each(function(){var e=h(this),n=e.find(".status");e.validate({errorPlacement:function(){return!0},submitHandler:function(e){var t=h(e),a=t.attr("action"),o=t.serialize();h.post(a,o,function(e){n.show().html(e).delay(6e3).fadeOut("show")})}})});var n=h('[data-trigger="video_popup"]');n.length&&n.magnificPopup({type:"iframe",iframe:{patterns:{youtube:{src:"//www.youtube.com/embed/%id%?autoplay=1&amp;rel=0&amp;fs=1&amp;loop=1"}}}});var i=h('[data-trigger="gallery_popup"]');i.length&&i.magnificPopup({delegate:"a",type:"image",mainClass:"mfp-no-margins mfp-with-zoom",gallery:{enabled:!0},zoom:{enabled:!0}});var l=h('[data-trigger="zoom"]');l.length&&l.zoom(),h("[data-countdown]").each(function(){var e=h(this);e.countdown(e.data("countdown"),function(e){h(this).html("<ul>"+e.strftime("<li><strong>%D</strong><span>DAYS</span></li><li><strong>%H</strong><span>HOURS</span></li><li><strong>%M</strong><span>MINUTES</span></li><li><strong>%S</strong><span>SECONDS</span></li>")+"</ul>")})}),h('[data-trigger="smoothScroll"]').on("click",function(e){e.preventDefault(),e.$el=h(this),e.$target=this.hash,h("html, body").animate({scrollTop:h(e.$target).offset().top-60},1200)}),h(".owl-carousel").each(function(){var e=h(this);e.owlCarousel({items:b(e.data("owl-items"),1),margin:b(e.data("owl-margin"),0),loop:b(e.data("owl-loop"),!0),smartSpeed:2500,autoplay:b(e.data("owl-autoplay"),!0),autoplayTimeout:b(e.data("owl-speed"),8e3),center:b(e.data("owl-center"),!1),animateOut:b(e.data("owl-animate"),!1),nav:b(e.data("owl-nav"),!1),navText:['<i class="fa fa-caret-left"></i>','<i class="fa fa-caret-right"></i>'],dots:b(e.data("owl-dots"),!1),responsive:b(e.data("owl-responsive"),{})}).addClass("owl-dots--"+b(e.data("owl-dots-style"),"1"))}),h('[data-keep-panel="open"]').on("click",'[data-toggle="collapse"]',function(e){h(this).hasClass("collapsed")||e.stopPropagation()});var r,s=h(".box--controls");if(s.length&&s.on("click","[data-action]",function(e){e.preventDefault(),e.$el=h(this),e.$siblingOwl=e.$el.parent().siblings(".owl-carousel"),e.$siblingOwl.length&&e.$siblingOwl.trigger(e.$el.data("action")+".owl.carousel")}),h(".media--modal.type--video").on("hidden.bs.modal",function(){var e=h(this),t=e.find(".media--video iframe"),a=e.find("iframe").attr("src");t.attr("src",a+"&c=0")}),h(".faq--item.style--2").on("show.bs.collapse",".content",function(){h(this).parents(".faq--item").addClass("opened")}).on("hide.bs.collapse",".content",function(){h(this).parents(".faq--item").removeClass("opened")}),(d=h('[data-trigger="map"]')).length){r=d.data("map-options"),window.initMap=function(){d.css("min-height","400px"),d.each(function(){var e,t,a,o,n=h(this);r=n.data("map-options"),t=parseFloat(r.latitude,10),a=parseFloat(r.longitude,10),o=parseFloat(r.zoom,10),e=new google.maps.Map(n[0],{center:{lat:t,lng:a},zoom:o,scrollwheel:!1,disableDefaultUI:!0,styles:[{featureType:"administrative",elementType:"labels.text.fill",stylers:[{color:"#444444"}]},{featureType:"landscape",elementType:"all",stylers:[{color:"#f2f2f2"}]},{featureType:"poi",elementType:"all",stylers:[{visibility:"off"}]},{featureType:"road",elementType:"all",stylers:[{saturation:-100},{lightness:45}]},{featureType:"road.highway",elementType:"all",stylers:[{visibility:"simplified"}]},{featureType:"road.arterial",elementType:"labels.icon",stylers:[{visibility:"off"}]},{featureType:"transit",elementType:"all",stylers:[{visibility:"off"}]},{featureType:"water",elementType:"all",stylers:[{color:"#46bcec"},{visibility:"on"}]}],zoomControl:!0}),new google.maps.Marker({position:{lat:t,lng:a},map:e,animation:google.maps.Animation.DROP,draggable:!0})})};var c=document.createElement("script");c.type="text/javascript",c.src="https://maps.googleapis.com/maps/api/js?key="+r.api_key+"&callback=initMap",w.append(c)}var d=h('[data-trigger="map"]');h(".review--rating").on("click","label",function(){var e=h(this);e.parent(".stars").attr("data-selected",e.children("input").val())}),h(".cart--widget").on("click",".remove",function(e){e.preventDefault(),e.$el=h(this),e.$parent=e.$el.parent("li"),e.$el.fadeOut(function(){0===e.$parent.index()&&0===e.$parent.next().length?e.$parent.html("<p>No products in the cart.</p>"):e.$parent.remove()})});var p=h(".header--section");h(".header--navbar");h(".header--search.style--2").on("click","button",function(e){var t=h(this).parents(".header--search");t.hasClass("open")||(e.preventDefault(),t.addClass("open")),setTimeout(function(){y.on("click.hs",function(e){e.$target=h(e.target),0!==e.$target.not(".header--search").length&&0!==e.$target.parents(".header--search").length||(t.removeClass("open"),y.off("click.hs"))})},200)});var u=h(".banner--slider"),g=function(e){u.css("height",function(e,t){return e=v.outerHeight()-p.outerHeight(),(t=parseInt(t,10))<e?e:t}),e||u.owlCarousel("refresh")};g(0),v.on("resize",g);var f=h(".coming-soon--section");f.length&&f.css("min-height",function(){return f.find(".cs--content").outerHeight()});var m=h(".f0f--section");m.length&&m.css("min-height",function(){return m.find(".f0f--content").outerHeight()}),h("#backToTop").on("click","a",function(e){e.preventDefault(),h("html, body").animate({scrollTop:0},1200)})}),v.on("load",function(){var e=function(){1<v.scrollTop()?w.addClass("isScrolling"):w.removeClass("isScrolling")};e(),v.on("scroll",e);var t=h(".AdjustRow");t.length&&t.isotope({layoutMode:"fitRows"});var a=h(".MasonryRow");a.length&&a.isotope();var o=h(".header--navbar");h(".buddy-finder--widget").siblings(".widget--title").on("click",function(){var t=h(this);t.hasClass("selected")&&t.attr("contenteditable","true").focus(),t.hasClass("selected")||t.addClass("selected"),setTimeout(function(){h(document).on("click",function(e){1===h(e.target).not(".widget--title.selected").length&&(t.removeClass("selected"),t.removeAttr("contenteditable","true"))})},200)});var n=h('[data-trigger="stickyScroll"]');n.length&&n.theiaStickySidebar({additionalMarginTop:o.length?o.outerHeight()+40:40});var i=h("#preloader");i.length&&i.fadeOut("slow");var l=h('[data-scroll-reveal="group"]'),r="";"function"==typeof ScrollReveal&&((r=ScrollReveal()).reveal('[data-scroll-reveal="left"]',{origin:"left",mobile:!1,duration:800}).reveal('[data-scroll-reveal="right"]',{origin:"right",mobile:!1,duration:800}).reveal('[data-scroll-reveal="bottom"]',{duration:800}),l.each(function(){r.reveal(h(this).children(),{duration:800},150)}))})}(jQuery);