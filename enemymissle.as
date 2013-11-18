class enemymissle extends MovieClip

{
	
var speed;

	function onLoad()

	{
		speed= -20	
	}
	
	function onEnterFrame()
	{
		_x += speed;
		
		if(this.hitTest(_root.ship1))
		{
			this.removeMovieClip();
		}
		if(_x<0)
		{
			this.removeMovieClip();
		}
		
	}
	
}