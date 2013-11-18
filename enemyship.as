class enemyship extends MovieClip 
{
	var speed;
	var shootTimer;

	
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
		_x= 700;
		_y= Math.random()*300;
		speed = Math.random()*5+5;
		shootTimer = 0;

	}
	
	function onEnterFrame()
	{		
		
		_x-=speed;
		
		
		if(_x<-100)
		{
			this.removeMovieClip();
		}
	

		if(this.hitTest(_root.ship))
		{
			explode();
			_root.ship.updateHealth(-5);
		}
		
		if(this.hitTest(_root.missle))
		{
			explode();
		}
		
		shootTimer += 1;
		if(shootTimer > 30)
		
		{
			shootTimer=0;
			
			var missile = _root.attachMovie("enemymissle1","enemymissle1"+_root.getNextHighestDepth(),_root.getNextHighestDepth());
			missile._x = _x - 50;
			missile._y = _y +3;
			

		}
		
	}
	}

