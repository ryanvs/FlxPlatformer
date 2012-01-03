package  
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	public class AssetsHiRes 
	{
		// BACKGROUNDS
		[Embed(source = "../assets/hires/backgrounds/layer0_0.png")]
		public static var Layer0_0:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer0_1.png")]
		public static var Layer0_1:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer0_2.png")]
		public static var Layer0_2:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer1_0.png")]
		public static var Layer1_0:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer1_1.png")]
		public static var Layer1_1:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer1_2.png")]
		public static var Layer1_2:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer2_0.png")]
		public static var Layer2_0:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer2_1.png")]
		public static var Layer2_1:Class;
		
		[Embed(source = "../assets/hires/backgrounds/layer2_2.png")]
		public static var Layer2_2:Class;

		public static var Backgrounds:Array = [Layer0_0, Layer1_0, Layer2_0];

		// OVERLAYS
		[Embed(source = "../assets/hires/overlays/you_died.png")]
		public static var YouDied:Class;

		[Embed(source = "../assets/hires/overlays/you_lose.png")]
		public static var YouLose:Class;

		[Embed(source = "../assets/hires/overlays/you_win.png")]
		public static var YouWin:Class;

		// SPRITES
		[Embed(source = "../assets/hires/sprites/player.png")]
		public static var SpritePlayer:Class;
		
		[Embed(source = "../assets/hires/sprites/tiles.png")]
		public static var Tiles:Class;
		
		[Embed(source = "../assets/hires/graphics/gem.png")]
		public static var GemPng:Class;
		
		// SIZES
		public static var BackgroundSize:FlxPoint = new FlxPoint(1280,720);
		public static var SpriteSize:FlxPoint = new FlxPoint(96,96);
		public static var TileSize:FlxPoint = new FlxPoint(64,48);

		
		public function AssetsHiRes() 
		{
		}

	}

}