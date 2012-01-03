package  
{
	import flash.geom.Point;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	public class PlayState extends FlxState
	{
		protected var overlay:FlxSprite;
		protected var player:Player;
		protected var level:Level;
		protected var score:FlxText;
		
		protected var isFinished:Boolean = false;
		
		public function PlayState() 
		{
		}
		
		override public function create() : void
		{
			level = new Level();
			
			var startPoint:Point = level.startPoint;
			if (startPoint == null) startPoint = new Point(0, 0);
			else startPoint.y = startPoint.y - 48;
			player = new Player(startPoint.x, startPoint.y);

			score = new FlxText(0, 0, 200);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "0 / " + level.totalGems.toString();

			add(level);
			add(player);
			add(score);
			
			//	Tell flixel how big our game world is
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			//	Don't let the camera wander off the edges of the map
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			
			//	The camera will follow the player
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void
		{
			super.update();
			
			//if (isFinished)
			//	return;

			// Pick up gems
			FlxG.collide(player, level);
			FlxG.overlap(player, level.gems, hitGem);
			
			// Find exit
			FlxG.overlap(player, level.exitSign, hitExit);
		}
		
		private function hitGem(p:FlxObject, gem:FlxObject):void
		{
			gem.kill();
			FlxG.play(AssetsShared.SndGemCollected);
			FlxG.score += 1;
			score.text = FlxG.score.toString() + " / " + level.totalGems.toString();
		}

		protected function hitExit(p:FlxObject, gem:FlxObject):void 
		{
			if (!isFinished)
			{
				isFinished = true;
				player.isFinished = true;

				overlay = new FlxSprite(240, 240, AssetsHiRes.YouWin);
				overlay.alpha = 0.75;
				overlay.scrollFactor.x = 0;
				overlay.scrollFactor.y = 0;
				add(overlay);
			}
		}
	}

}