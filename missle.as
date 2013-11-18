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