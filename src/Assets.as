package  
{
	public class Assets
	{
		[Embed(source = '../assets/levels/1.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL1:Class;
		[Embed(source = '../assets/levels/2.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL2:Class;
		
		public static const LEVELS:Array = new Array(LEVEL1, LEVEL2);
		
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
	}
}