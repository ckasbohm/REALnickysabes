class enemymissle extends MovieClip

{
	
var speed;



 //this is function created in attempt to get missile to enemy missile collision
	function explode()
	
	{
		var explosion = _root.attachMovie( "Explosion" , "Explosion" + 	_root.getNextHighestDepth(), _root.getNextHighestDepth() );
		explosion._x = _x;
		explosion._y = _y;
		this.removeMovieClip();
		_root.ship.updateHealth(100);
	
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
			
	//this should remove enemy missiles from the array and hopefully stop lag (exists in enemy missle, enemyship, missile)
//			var enemyMissile:Array = [0];
//			enemyMissile.splice(0);
//			trace(enemyMissile);
		}
		if(_x<0)
		{
			this.removeMovieClip();
			
	//this should remove enemy missiles from the array and hopefully stop lag (exists in enemy missle, enemyship, missile)
//			var enemyMissile:Array = [0];
//			enemyMissile.splice(0);
//			trace(enemyMissile);
		}
		
	}
	
}