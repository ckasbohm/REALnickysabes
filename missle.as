class missle extends MovieClip
{
	var speed;
	var enemyMissile;
	
	
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
		speed = 20;
		enemyMissile=[];
	}
	function onEnterFrame()
	{
		_x += speed;
		if(_x > 600)
	{
		this.removeMovieClip();
		
		
	//this should remove fired missles from the array and hopefully stop lag (exists in enemy missle, enemyship, missile)
//			var heroMissile:Array = [0];
//			heroMissile.splice(0);
//			trace(heroMissile);
		
	}
	

		for(var i in _root.ship.enemies)
		{

			for(var i in _root.ship.enemies)
			{

					if(this.hitTest( _root.ship.enemies[i] ) )
				{
					this.removeMovieClip();
					_root.ship.enemies[i].explode();
				}
				
				
	
			//this is for attempt at missile to enemy missile collison 
					for(var i in _root.enemyship.enemyMissile)
				{
						for(var j in _root.ship.heroMissile)
					{
						if(this.hitTest(_root.enemyship.enemyMissile[i]))
					{
						_root.enemyMissile[i].explode();
					}
		

				}
}
}
	}
	}
}