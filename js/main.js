function setTitleDate(){var o=$("#body").css("width"),t=$("#container").css("width"),c=($("#container").css("margin-right"),$("#container").css("padding-right"),(parseInt(o)-parseInt(t))/2+10);$("#title-date").css("right",c)}function ifTocExist(){$("#mytoc li").length||$("#sidebar-toggle").hide()}function toggleToc(){$("#sidebar-toggle").click(function(){"block"==$("#mytoc").css("display")?$("#mytoc").hide():$("#mytoc").show()}),$("#mytoc li").click(function(){"block"==$("#mytoc").css("display")&&$("#mytoc").hide()})}$(document).ready(function(){ifTocExist(),toggleToc(),$(window).scroll(function(){document.documentElement.scrollTop+document.body.scrollTop>200?($("#gotop").fadeIn(400),$(".navbar").stop().fadeTo(400,.2)):($("#gotop").fadeOut(400),$(".navbar").stop().fadeTo(400,1))}),$("#gotop").click(function(){$("html,body").animate({scrollTop:"0px"},200)}),$(".navbar").mouseenter(function(){$(".navbar").fadeTo(100,1)}),$(".navbar").mouseleave(function(){document.documentElement.scrollTop+document.body.scrollTop>200&&$(".navbar").fadeTo(100,.2)}),setTitleDate()}),$(window).resize(function(){setTitleDate()});