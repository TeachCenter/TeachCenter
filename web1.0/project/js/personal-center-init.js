var w=$(window).width();
$(".right-content").css({"width":w-280})
$(".cut").css({"width":w-344})
$(window).resize(function(){
	 w=$(window).width();
	$(".right-content").css({"width":w-280})
	$(".cut").css({"width":w-344})
})
