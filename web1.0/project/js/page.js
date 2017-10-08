var position=0;
$("lleft-button").on('click', function() {
	turn("lleft",position)
        
  	})
$("left-button").on('click', function() {
	turn("left",position)
        
  	})
$("right-button").on('click', function() {
	turn("right",position)
        
  	})
$("rright-button").on('click', function() {
	turn("rright",position)
        
  	})
function turn(direction,position) {
	if(direction=="left"&&position!=0)
	{
		position+=40;
		$("midButton").css("top":position)
		
	}
	else if(direction=="right"&&position!=40*(num-1))
	{
		position-=40;
		$("midButton").css("top":position)
		
	}
	else if(direction="lleft")
	{
		$("midButton").css("top":0)
	}
	else if(direction="rright")
	{
		$("midButton").css("top":40*(num-1))
	}
}