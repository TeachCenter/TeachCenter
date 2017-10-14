var w=$(window).width();
$(".right-content").css({"width":w-280})
$(".cut").css({ "width": w - 344 })
$("#ContentPlaceHolder1_txtFileName").css({ "width": w - 700 })
$("#txtFileName").css({ "width": w - 700 })
 
$(window).resize(function(){
	 w=$(window).width();
	$(".right-content").css({"width":w-280})
	$(".cut").css({ "width": w - 344 })
	$("#ContentPlaceHolder1_txtFileName").css({ "width": w - 700 })
	$("#txtFileName").css({ "width": w - 700 })
	
})
