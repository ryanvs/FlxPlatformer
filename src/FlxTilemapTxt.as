package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author Ryan Van Slooten
	 */
	public class FlxTilemapTxt extends FlxTilemap
	{
		
		public function FlxTilemapTxt() 
		{
			super();
		}
		
		/**
		 * Converts a plain text file string into an index-based CSV string and then calls loadMap to load the tilemap with string data and a tile graphic.
		 * 
		 * @param	TileMapping		A mapping object containing the key for each tile and the tile properties.
		 * @param	MapData			A string of comma and line-return delineated indices indicating what order the tiles should go in.
		 * @param	TileGraphic		All the tiles you want to use, arranged in a strip corresponding to the numbers in MapData.
		 * @param	TileWidth		The width of your tiles (e.g. 8) - defaults to height of the tile graphic if unspecified.
		 * @param	TileHeight		The height of your tiles (e.g. 8) - defaults to width if unspecified.
		 * @param	AutoTile		Whether to load the map using an automatic tile placement algorithm.  Setting this to either AUTO or ALT will override any values you put for StartingIndex, DrawIndex, or CollideIndex.
		 * @param	StartingIndex	Used to sort of insert empty tiles in front of the provided graphic.  Default is 0, usually safest ot leave it at that.  Ignored if AutoTile is set.
		 * @param	DrawIndex		Initializes all tile objects equal to and after this index as visible. Default value is 1.  Ignored if AutoTile is set.
		 * @param	CollideIndex	Initializes all tile objects equal to and after this index as allowCollisions = ANY.  Default value is 1.  Ignored if AutoTile is set.  Can override and customize per-tile-type collision behavior using <code>setTileProperties()</code>.	
		 * 
		 * @return	A pointer this instance of FlxTilemap, for chaining as usual :)
		 */
		public function loadText(TileMapping:Object, MapData:String, TileGraphic:Class, TileWidth:uint = 0, TileHeight:uint = 0, AutoTile:uint = OFF, StartingIndex:uint = 0, DrawIndex:uint = 1, CollideIndex:uint = 1):FlxTilemapTxt
		{
			var result:String = "";
			var rows:Array = MapData.split("\n");
			var row:uint = 0;
			while(row < rows.length)
			{
				var line:String = rows[row++];
				var newLine:String = "";
				for (var ix:uint = 0; ix < line.length; ix++)
				{
					var c:String = line.charAt(ix);
					if (c == "\r")
						break;
					if (ix > 0)
						newLine += ",";
					if (TileMapping[c] == undefined)
						FlxG.log("WARNING: No TileMapping for \""+c+"\" (" + c.charCodeAt(0) + ") - Line " + row + ", Column " + (ix+1));

					newLine += TileMapping[c];
				}
				result += newLine + "\n";
			}

			loadMap(result, TileGraphic, TileWidth, TileHeight, AutoTile, StartingIndex, DrawIndex, CollideIndex);
			return this;
		}
	}

}