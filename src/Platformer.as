package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	[SWF(width="800", height="600", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	public class Platformer extends FlxGame
	{
		
		public function Platformer() 
		{
			super(800,600,PlayState,1);
			forceDebugger = true;
			FlxG.debug = true;
		}
		
	}

}