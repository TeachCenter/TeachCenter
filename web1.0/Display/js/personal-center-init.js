var w = $(window).width();

if ($(window).width() > 1200)
{
    w = $(window).width();
}
else {
    w =1200;
}
timer = setTimeout(function () {
    if ($(".left-nav").height()<$(window).height()) {
        $(".left-nav").css({ "height": $(window).height()})
    }
    if ($(".left-nav").height() < $(".right-content").height()) {
        $(".left-nav").css({ "height": $(".right-content").height()+50 })
    }
    if ($(".progect-content").height() < 600) {

        $(".progect-content").addClass("hei");
     
    }
}, 200);


$(".right-content").css({"width":w-285})
$(".cut").css({ "width": w - 244 })
$("#ContentPlaceHolder1_txtFileName").css({ "width": w - 800 })
$("#txtFileName").css({ "width": w - 800 })
 
$(window).resize(function(){
    w = $(window).width();
    if ($(window).width() > 1200) {
        w = $(window).width();
    }
    else {
        w = 1200;
    }
	$(".right-content").css({"width":w-285})
	$(".cut").css({ "width": w - 244 })
	$("#ContentPlaceHolder1_txtFileName").css({ "width": w - 800 })
	$("#txtFileName").css({ "width": w - 800 })
	
})
