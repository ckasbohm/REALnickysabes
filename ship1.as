class ship1 extends MovieClip
{
	var velocity;
	var shootLimiter;
	var enemyTimer;
	var enemies;
	var score;
	var health;
	var enemyMissile;
	var powerUpCount;
	var heroMissile;


	
	function newGame()
	
	{
		this._visible=true;
		_root.gameOverScreen._visible=false;
		_root.removeMovieClip.screenClearPowerup();
		resetHealth();
		resetScore();
		_x = 25;
		_y = 75;
		_root.startScreen._visible=false;
		_root.removeMovieClip.startScreen;
		_root.healthMeter._visible = true;
		_root.healthMeter.bar._visible = true;
		
		
		
	}
	
	function explode()
	
	{
		this._visible = false;
		var explosion = _root.attachMovie( "Explosion" , "Explosion" + 	_root.getNextHighestDepth(), _root.getNextHighestDepth() );
		explosion._x = _x;
		explosion._y = _y;
		for(var i in enemies)
		{
			enemies[i].explode();
		}
	}
	
	function updateHealth(points)
	{
		
		if(health<1)
		
		{
			_root.gameOverScreen._visible = true;
			explode();
			_root.healthMeter.bar._visible=false;
			_root.healthMeter._visible=false;
		}
		 health += points;
		_root.healthMeter.bar._xscale = health;
	}
	
	function resetHealth()
	
	{
		health = 100;
		_root.healthMeter.bar._xscale = 100;
		_root.healthMeter._visible = true;
		_root.healthMeter.bar._visible = true;
	}
	
	function resetScore()
	
	{
		score=0;
		_root.scoreText.text = score;
		_root.scoreText.text._visible = true;
	}
	
	
	function updateScore(points)
	{
		score += points;
		_root.scoreText.text = score;
		
	}
	function onLoad()
	{
		velocity = 10;
		powerUpCount = [];
		shootLimiter = 0;
		enemyTimer = 0;
		enemies = [];
		heroMissile = [];
		resetScore();
		resetHealth();
		_root.healthMeter._visible = false;
		_root.healthMeter.bar._visible = false;
		_root.gameOverScreen._visible=false;
		_root.ship._visible=false;
		_root.missle._visible=false;
		_root.gameOverScreen.playAgainButton.onPress = function()
		{
		_root.ship.newGame();
		}
		
		_root.startScreen.startButton.onPress = function()
		{
		_root.ship.newGame();
		}
		
	}
	
	function onEnterFrame()
	{
		if(score==500||score==1000||score==1500)
		{
			
			var powerUp = _root.attachMovie("screenClearPowerup","screenClearPowerup"+_root.getNextHighestDepth(),_root.getNextHighestDepth());
			powerUp._x = 300;
			powerUp._y = 100;
			powerUpCount.push(powerUp);
		
		
		}


		for(var i in this.powerUpCount)
		{
		
		if(this.hitTest(this.powerUpCount[i]))
		{
			for(var i in enemies)
		{
			enemies[i].explode(_root.enemyship);
		}
			for(var i in powerUpCount)
		{
			this.powerUpCount[i].explode();
			_root.screenClearPowerup.explode();
		}
		}
		}
		
		if(health>1)
		
		{
		shootLimiter += 1;
		}
		
		if( Key.isDown(Key.RIGHT) ){_x = _x + velocity;}
		if( Key.isDown(Key.LEFT) ){_x = _x - velocity;}
		if( Key.isDown(Key.UP) ){_y = _y - velocity;}
		if( Key.isDown(Key.DOWN) ){_y = _y + velocity;}
		if( Key.isDown(Key.SPACE) && shootLimiter > 8 && (_root.startScreen._visible==false))
		{
			shootLimiter= 0;
			var missile = _root.attachMovie( "missle" , "missle" + _root.getNextHighestDepth(), _root.getNextHighestDepth() );
			missile._x = _x +8;
			missile._y = _y -9;
			heroMissile.push(missile);
			
		}
	
			enemyTimer += .5;
		
	
	
		
		if(_root.ship.health<1)
		{
			enemyTimer = 5;
		}
		
	
		if(enemyTimer>5 && (_root.startScreen._visible==false))

		{
			
			var enemy = _root.attachMovie("enemyship", "enemyship" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
			enemies.push(enemy);
		
			enemyTimer=0;
			

		}	
		
		
	}
		
}