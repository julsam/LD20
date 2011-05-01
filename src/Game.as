package
{	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Game extends World
	{
		public var tileset:Tilemap;
		
		override public function begin():void
		{
			// level size
			FP.width = Global.windowWidth;
			FP.height = Global.windowHeight;
			
			Global.transition = new Transition();
			
			Global.skyMgr = new SkyManager();
	
			
			Input.define("Left", Key.LEFT);
			Input.define("Right", Key.RIGHT);
			Input.define("Interact", Key.DOWN, Key.X);
			Input.define("Jump", Key.SPACE, Key.UP);
			
			
			loadLevel();
			Global.firstLevel = false;
		}
		
		override public function update():void 
		{
			super.update();
			Global.skyMgr.update();
						
			if (Global.changeLevel) {
				if (!Global.transition.playing)
				{
					add(Global.transition);
				}
				
				Global.transition.play();
				
				if (Global.transition.done)
				{
					Global.transition.reset();
					nextLevel();
				}
			}
		}
		
		public function loadLevel(lid:int=1):void 
		{
			var file:ByteArray = new Assets.LEVELS[lid - 1];
			var str:String = file.readUTFBytes( file.length );
			var xml:XML = new XML(str);
			
			var e:Entity;
			var o:XML;
			var n:XML;
			
			// Level size
			FP.width = xml.width;
			FP.height = xml.height;
			
			var skyOptions:Dictionary = new Dictionary();
			skyOptions["levelEnvironment"] = xml.@levelEnvironment;
			skyOptions["cloudBottomY"] = xml.@cloudBottomY;
			skyOptions["bush1Y"] = xml.@bush1Y;
			skyOptions["bush2Y"] = xml.@bush2Y;
			skyOptions["bgcolor"] = xml.@bgcolor;
			
			for(var s:String in skyOptions)
			{
				trace(skyOptions[s]);
			}
			
			Global.skyMgr = new SkyManager(skyOptions);
			
			add(new Entity(0, 0, tileset = new Tilemap(Assets.TILESET, FP.width, FP.height, Global.grid, Global.grid)));
			
			
			if(Global.firstLevel && str.search("<playerStart") > 0) {
				// Player
				add(Global.player = new Player(xml.objects[0].playerStart.@x, xml.objects[0].playerStart.@y));
			}
			else
			{
				for each (o in xml.objects[0].TP_Arrival) {
					if (o.@from == Global.previousLevel)
					{
						// Player
						add(Global.player = new Player(o.@x, o.@y));
					}
				}
			}
			
			// Camera
			add(Global.camera = new Camera(Global.player as Entity));
						
			// Tiles Above
			for each (o in xml.tilesAbove[0].tile) {
				// 17 = number of column
				tileset.setTile(o.@x / Global.grid, o.@y / Global.grid, (17 * (o.@ty/Global.grid)) + (o.@tx/Global.grid));
			}
			
			// Solids
			for each (o in xml.solids[0].rect) {
				add(new Solid(o.@x, o.@y, o.@w, o.@h));
			}
			
			// Doors
			for each (o in xml.objects[0].door) {
				add(new Door(o.@x, o.@y, o.@destination)); 
			}
			
			// Shop panel
			for each (o in xml.objects[0].shop_panel) {				
				add(new Entity( o.@x, o.@y, new Image(Assets.OBJ_SHOP_PANEL)));	
			}
								
			// TPs
			for each (o in xml.objects[0].TP) {
				add(new TP(o.@x, o.@y, o.@destination)); 
			}
			
			// Tiles Above
			if (xml.tilesAboveDeco[0])
			{
				for each (o in xml.tilesAboveDeco[0].tile) {
					// 17 = number of column
					tileset.setTile(o.@x / Global.grid, o.@y / Global.grid, (17 * (o.@ty/Global.grid)) + (o.@tx/Global.grid));
				}
			}
		}
		
		public function nextLevel():void
		{
			removeAll();
			
			Global.changeLevel = false;
			
			Global.previousLevel = Global.currentLevel;
			
			loadLevel(Global.levelToLoad);
			
			Global.currentLevel = Global.levelToLoad;
		}
	}
	
}
