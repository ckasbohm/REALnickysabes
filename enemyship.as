class enemyship extends MovieClip 
{
	var speed;
	var shootTimer;
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
		_x= 700;
		_y= Math.random()*300;
		speed = Math.random()*5+5;
		shootTimer = 0;
		enemyMissile=[];

	}
	
	function onEnterFrame()
	{		
		
		_x-=speed;
		
		
		if(_x<-100)
		{
			this.removeMovieClip();
			
	//this should remove enemy ships from the array and hopefully stop lag (exists in enemy missle, enemyship, missile)
//			var enemies:Array = [0];
//			enemies.splice(0);
//			trace(enemies);
			
		}
	

		if(this.hitTest(_root.ship))
		{
			explode();
			_root.ship.updateHealth(-5);
			
	//this should remove enemy ships from the array and hopefully stop lag (exists in enemy missle, enemyship, missile)
//			var enemies:Array = [0];
//			enemies.splice(0);
//			trace(enemies);
		}
		
		if(this.hitTest(_root.missle))
		{
			explode();
			
	//this should remove enemy ships from the array and hopefully stop lag (exists in enemy missle, enemyship, missile)
//			var enemies:Array = [0];
//			enemies.splice(0);
//			trace(enemies);
		}
		
		shootTimer += 1;
		if(shootTimer > 30)
		
		{
			shootTimer=0;
			
			var missile = _root.attachMovie("enemymissle1","enemymissle1"+_root.getNextHighestDepth(),_root.getNextHighestDepth());
			missile._x = _x - 50;
			missile._y = _y +3;
			enemyMissile.push(missile);
			
			

		}
		
	}
	}

