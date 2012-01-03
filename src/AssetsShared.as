package  
{
	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	public class AssetsShared 
	{
		// LEVELS
		[Embed(source = "../assets/levels/0.txt", mimeType = "application/octet-stream")]
		public static var Level0:Class;
		
		[Embed(source = "../assets/levels/1.txt", mimeType = "application/octet-stream")]
		public static var Level1:Class;
		
		[Embed(source = "../assets/levels/2.txt", mimeType = "application/octet-stream")]
		public static var Level2:Class;

		public static var Levels:Array = [new Level0, new Level1, new Level2];


		// MUSIC
		[Embed(source = "../assets/music/Music.mp3")]
		public static var Music:Class;


		// SOUNDS
		[Embed(source = "../assets/sounds/ExitReached.mp3")]
		public static var SndExitReached:Class;

		[Embed(source = "../assets/sounds/GemCollected.mp3")]
		public static var SndGemCollected:Class;

		//[Embed(source = "../assets/sounds/MonsterKilled.mp3")]
		//public static var SndMonsterKilled:Class;

		[Embed(source = "../assets/sounds/PlayerFall.mp3")]
		public static var SndPlayerFall:Class;

		[Embed(source = "../assets/sounds/PlayerJump.mp3")]
		public static var SndPlayerJump:Class;

		[Embed(source = "../assets/sounds/PlayerKilled.mp3")]
		public static var SndPlayerKilled:Class;

		//[Embed(source = "../assets/sounds/PowerUp.mp3")]
		//public static var SndPowerUp:Class;
		
		public function AssetsShared() 
		{
		}
		
	}

}