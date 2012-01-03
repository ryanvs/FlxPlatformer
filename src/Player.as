package  
{
	import org.flixel.*;

	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	public class Player extends FlxSprite
	{
		protected var _restart:Number;

		protected var frameRate:uint = 15;
		
		protected var jumpPower:uint = 350;
		protected var runSpeed:uint = 250;
		
		public var isFinished:Boolean = false;
		protected var isOnGround:Boolean = false;
		protected var isJumping:Boolean = false;
		protected var wasJumping:Boolean = false;
		
		public function Player(X:Number=0,Y:Number=0) 
		{
			super(X,Y);

			_restart = 0;

			loadGraphic(AssetsHiRes.SpritePlayer, true, true, AssetsHiRes.SpriteSize.x, AssetsHiRes.SpriteSize.y);
			addAnimation("idle", [0], frameRate, false);
			addAnimation("run",       [ 1, 2, 3, 4, 5, 6, 7, 8, 9,10], frameRate, true);
			addAnimation("die",       [11,12,13,14,15,16,17,18,19,20,21], frameRate, false);
			addAnimation("jump",      [22,23,24,25,26,27,28,29,30,31,32], frameRate, false);
			addAnimation("celebrate", [33,34,35,36,37,38,39,40,41,42,43], frameRate, false);

			//bounding box tweaks
			offset.x = 28;
			offset.y = 8;
			width -= 2*offset.x;
			height -= 8;

			// Basic player physics
			drag.x = runSpeed * 8;
			acceleration.y = 420;
			maxVelocity.x = runSpeed;
			maxVelocity.y = jumpPower;

			// Prepare to display
			facing = FlxObject.LEFT;
			play("idle", true);
		}

		/**
		 * update the player
		 */
		override public function update():void 
		{
			super.update();

			//game restart timer
			if(!alive)
			{
				play("die");
				FlxG.play(AssetsShared.SndPlayerKilled);
				_restart += FlxG.elapsed;
				if(_restart > 2)
					FlxG.resetState();
				return;
			}
			else if (isFinished)
			{
				acceleration.x = 0
				//velocity.make();
				if ((_curAnim != null) && (_curAnim.name != "celebrate"))
				{
					play("celebrate");
					FlxG.play(AssetsShared.SndExitReached);
				}
				return;
			}

			//make a little noise if you just touched the floor
			//if(justTouched(FLOOR) && (velocity.y > 50))
			//	FlxG.play(SndLand);

			//MOVEMENT
			acceleration.x = 0;
			if(FlxG.keys.LEFT)
			{
				facing = LEFT;
				acceleration.x -= drag.x;
			}
			else if(FlxG.keys.RIGHT)
			{
				facing = RIGHT;
				acceleration.x += drag.x;
			}
			if(FlxG.keys.justPressed("SPACE") && !velocity.y)
			{
				velocity.y = -jumpPower;
				FlxG.play(AssetsShared.SndPlayerJump);
			}
			
			//ANIMATION
			if(velocity.y != 0)
			{
				if ((_curAnim != null) && (_curAnim.name != "jump"))
					play("jump");
			}
			else if(velocity.x == 0)
			{
				play("idle");
			}
			else
			{
				play("run");
			}
		}
	}
}