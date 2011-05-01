package  
{
	import flash.utils.Dictionary;
	
	public class Assets
	{
		[Embed(source = '../assets/levels/1.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL1:Class;
		[Embed(source = '../assets/levels/2.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL2:Class;
		[Embed(source = '../assets/levels/3.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL3:Class;
		[Embed(source = '../assets/levels/4.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL4:Class;
		
		public static const LEVELS:Dictionary = new Dictionary();
		LEVELS[1] = LEVEL1;
		LEVELS[2] = LEVEL2;
		LEVELS[3] = LEVEL3;
		LEVELS[4] = LEVEL4;
		
		//tilesets
		[Embed(source = '../assets/sprites/tileset.png')] 
		public static const TILESET:Class;
		
		
		//player
		[Embed(source = '../assets/sprites/player.png')] 
		public static const PLAYER:Class;
		
		
		// Parallax
		[Embed(source = '../assets/sprites/bush1.png')] 
		public static const BUSH1:Class;
		[Embed(source = '../assets/sprites/cloud3.png')] 
		public static const CLOUD3:Class;
		[Embed(source = '../assets/sprites/cloud4.png')] 
		public static const CLOUD4:Class;
		[Embed(source = '../assets/sprites/cloud5.png')] 
		public static const CLOUD5:Class;
		
		// Objects
		[Embed(source = '../assets/sprites/door.png')] 
		public static const OBJ_DOOR:Class;
		[Embed(source = '../assets/sprites/shop_panel.png')] 
		public static const OBJ_SHOP_PANEL:Class;
		[Embed(source = '../assets/sprites/spaceship.png')] 
		public static const OBJ_SPACESHIP:Class;
		
		
		// NPC - Monsters
		[Embed(source = '../assets/sprites/grandpa.png')] 
		public static const GRANDPA:Class;
		[Embed(source = '../assets/sprites/oldman.png')] 
		public static const OLDMAN:Class;
		[Embed(source = '../assets/sprites/mob1.png')] 
		public static const MOB1:Class;
		[Embed(source = '../assets/sprites/mob2.png')] 
		public static const MOB2:Class;
	}
}