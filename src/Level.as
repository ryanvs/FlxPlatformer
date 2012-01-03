package  
{
	import flash.geom.Point;
	import org.flixel.*;

	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	public class Level extends FlxGroup
	{
		public var backdrop:FlxSprite;
		public var map:FlxTilemapTxt;
		public var gems:FlxGroup;
		
		public var exitSign:FlxSprite;
		public var startPoint:Point;

		public var tileWidth:int;
		public var tileHeight:int;
		
		public var width:int;
		public var height:int;
		public var totalGems:int;

		public function Level(Index:uint=0)
		{
			super();
			
			backdrop = new FlxSprite(0, 0, AssetsHiRes.Backgrounds[Index]);
			
			var tileMapping:Object = {
				".": 0,		// Blank
				"1": 13,	// Starting point
				"X": 10,	// Exit sign
				"G": 12,	// Gem
				"-": 11,	// Platform
				"~": 0,		// Platform (Block B)
				":": 8,		// Passable block (Block B), should be random [8-9]
				"#": 1,		// Impassable block (Block A), should be random [1-7]
				"A": 0,		// Monster A
				"B": 0,		// Monster B
				"C": 0,		// Monster C
				"D": 0		// Monster D
				
			};
			
			var maps:Array = AssetsShared.Levels;
			var tiles:Class = AssetsHiRes.Tiles;
			tileHeight = AssetsHiRes.TileSize.y;
			tileWidth = AssetsHiRes.TileSize.x;
			
			map = new FlxTilemapTxt;
			map.loadText(tileMapping, maps[Index], tiles, tileWidth, tileHeight, 0, 0, 1, 31);
			
			//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
			map.setTileProperties(tileMapping["#"], FlxObject.UP|FlxObject.DOWN|FlxObject.LEFT|FlxObject.RIGHT);
			map.setTileProperties(tileMapping["."], FlxObject.NONE);
			map.setTileProperties(tileMapping[":"], FlxObject.UP);
			
			width = map.width;
			height = map.height;
			//width = backdrop.width;
			//height = backdrop.height;
			
			add(backdrop);
			add(map);
			
			parseGems();
			findStartPoint();
			findExitPoint();
		}

		protected function findStartPoint():void 
		{
			for (var ty:int = 0; ty < map.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < map.widthInTiles; tx++)
				{
					if (map.getTile(tx, ty) == 13)
					{
						map.setTile(tx, ty, 0);
						startPoint = new Point(tx * tileWidth, ty * tileHeight);
						return;
					}
				}
			}
		}
		
		protected function findExitPoint():void 
		{
			for (var ty:int = 0; ty < map.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < map.widthInTiles; tx++)
				{
					if (map.getTile(tx, ty) == 10)
					{
						exitSign = new FlxSprite(tx * tileWidth, ty * tileHeight);
						return;
					}
				}
			}
		}
		
		protected function parseGems():void
		{
			gems = new FlxGroup();
			
			for (var ty:int = 0; ty < map.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < map.widthInTiles; tx++)
				{
					if (map.getTile(tx, ty) == 12)
					{
						map.setTile(tx, ty, 0);
						var gem:Gem = new Gem(tx * tileWidth, ty * tileHeight, AssetsHiRes.GemPng);
						gems.add(gem);
						add(gem);
						totalGems++;
					}
				}
			}
			
			add(gems);
		}
	}

}