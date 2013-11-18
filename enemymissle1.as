class enemymissle1 extends MovieClip

{
	
var speed;



	function explode()
	
	{
		var explosion = _root.attachMovie( "Explosion" , "Explosion" + 	_root.getNextHighestDepth(), _root.getNextHighestDepth() );
		explosion._x = _x;
		explosion._y = _y;
		this.removeMovieClip();
		_root.ship.updateScore(50);
		
	}


	function onLoad()

	{
		speed= -20	
	}
	

	

	function onEnterFrame()
	{
		_x += speed;

		if(this.hitTest(_root.ship))
		{
			this.removeMovieClip();
			_root.ship.updateHealth(-.2);
		}
		
		if(this.hitTest(_root.missle))
		{
			explode();
		}
		
		
		if(_x<0)
		{
			this.removeMovieClip();
		}
		
	}
	
}