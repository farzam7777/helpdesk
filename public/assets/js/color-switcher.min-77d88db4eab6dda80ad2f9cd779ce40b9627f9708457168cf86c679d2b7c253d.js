!function(e){e.cColorSwitcher=function(t){t=e.extend({position:"left",switcherTitle:"No Colors",switcherColors:[],switcherTarget:""},t);var o=e('<div id="cColorSwitcher"></div>'),s=e("head"),i=e("body");o.css({transform:"translateY(-50%)"}).addClass("clearfix"),e('<div class="ccs--body"><h6>'+t.switcherTitle+"</h6><ul></ul></div>").appendTo(o).children("ul").append(function(){var o,s="";for(o=0;o<t.switcherColors.length;o++)"undefined"==typeof t.switcherColors[o].fgColor&&(t.switcherColors[o].fgColor="transparent"),s=s+'<li data-file-path="'+t.switcherColors[o].filepath+'"><span style="background-color: '+t.switcherColors[o].bgColor+';"></span><span style="transform: rotate(45deg); background-color: '+t.switcherColors[o].fgColor+';"></span></li>';return s}).children("li").on("click",function(){var o=e(this);t.switcherTarget.length&&t.switcherTarget.attr("href",o.data("file-path")),o.hasClass("active")||o.addClass("active").siblings().removeClass("active"),r.css("background-color",o.children("span").eq(0).css("background-color"))});var r=e('<div class="ccs--toggle-btn"><i class="fa fa-paint-brush"></i></div>').css({"background-color":o.find("li span").eq(0).css("background-color")}).on("click",function(){o.hasClass("opened")?(o.removeClass("opened"),"right"===t.position?o.animate({right:"-220px"},500):o.animate({left:"-220px"},500)):(o.addClass("opened"),"right"===t.position?o.animate({right:"0"},500):o.animate({left:"0"},500))}).appendTo(o);return"right"===t.position&&o.css({left:"auto",right:"-220px"}),s.append('<style id="ccSwitcher">#cColorSwitcher {position: fixed; top: 50%; left: -220px; z-index: 999;} .ccs--body {float: left; width: 220px; padding: 14px 15px 20px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px 2px;} .ccs--body:before {content: " "; position: absolute; top: 0; left: 0; right: 50px; bottom: 0; background-color: #fff; z-index: 0;} .ccs--body > h6 {position: relative; margin: 0; font-size: 16px; line-height: 24px; z-index: 1;} .ccs--body > ul {margin: 0 -5px; padding: 0; list-style: none; overflow: hidden;} .ccs--body > ul > li {position: relative; float: left; width: 30px; height: 30px; margin: 10px 5px 0; overflow: hidden; cursor: pointer;} .ccs--body > ul > li > span:nth-child(1) {position: absolute; width: 100%; height: 100%;} .ccs--body > ul > li > span:nth-child(2) {position: absolute; top: 0; right: -2px; width: 20px; height: 45px;} .ccs--toggle-btn {float: right; width: 50px; padding: 15px 0px; color: #fff; font-family: Arial, sans-serif; font-size: 14px; font-weight: 100; line-height: 22px; text-align: center; cursor: pointer; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 10px 2px;}</style>'),o.appendTo(i),o},$.cColorSwitcher({switcherTitle:"Main Colors:",switcherColors:[{bgColor:"#1da1f2",filepath:"css/colors/color-1.css"},{bgColor:"#82b440",filepath:"css/colors/color-2.css"},{bgColor:"#ff5252",filepath:"css/colors/color-3.css"},{bgColor:"#e91e63",filepath:"css/colors/color-4.css"},{bgColor:"#f69323",filepath:"css/colors/color-5.css"},{bgColor:"#ffcb1a",filepath:"css/colors/color-6.css"},{bgColor:"#00b249",filepath:"css/colors/color-7.css"},{bgColor:"#d48b91",filepath:"css/colors/color-8.css"},{bgColor:"#179ea8",filepath:"css/colors/color-9.css"},{bgColor:"#8cbeb2",filepath:"css/colors/color-10.css"}],switcherTarget:$("#changeColorScheme")})}(jQuery);