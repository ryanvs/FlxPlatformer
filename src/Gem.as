package  
{
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	public class Gem extends FlxSprite
	{
		
		public function Gem(X:int, Y:int, SimpleGraphic:Class = null)
		{
			super(X, Y, SimpleGraphic);
			
			solid = true;
		}
		
	}

}