var w = $(window).width();
if ($(window).width() > 1200)
{
    w = $(window).width();
}
else {
    w =1200;
}
$(".right-content").css({"width":w-380})
$(".cut").css({ "width": w - 444 })
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
	$(".right-content").css({"width":w-380})
	$(".cut").css({ "width": w - 444 })
	$("#ContentPlaceHolder1_txtFileName").css({ "width": w - 800 })
	$("#txtFileName").css({ "width": w - 800 })
	
})
