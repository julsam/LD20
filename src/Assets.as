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
		
		
		[Embed(source = '../assets/levels/10.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL10:Class; // basement
		[Embed(source = '../assets/levels/11.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL11:Class; // indoor shop
		[Embed(source = '../assets/levels/12.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL12:Class; // village
		[Embed(source = '../assets/levels/13.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL13:Class; // west of the village
		[Embed(source = '../assets/levels/14.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL14:Class; // INN indoors
		[Embed(source = '../assets/levels/15.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL15:Class; // East Village
		[Embed(source = '../assets/levels/16.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL16:Class; // East Village 2
		[Embed(source = '../assets/levels/17.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL17:Class; // Dungeon 1 - getting the gun
		[Embed(source = '../assets/levels/18.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL18:Class; // Dungeon 2 - getting the gun
		[Embed(source = '../assets/levels/19.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL19:Class; // Dungeon 3 - getting the gun
		[Embed(source = '../assets/levels/20.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL20:Class; // Dungeon 4 - Gun !
		[Embed(source = '../assets/levels/21.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL21:Class; // Dungeon 5 - getting wall jump
		[Embed(source = '../assets/levels/22.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL22:Class; // Dungeon 6 - getting wall jump
		[Embed(source = '../assets/levels/23.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL23:Class; // Dungeon 7 - getting wall jump
		[Embed(source = '../assets/levels/24.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL24:Class; // Dungeon 8 - getting wall jump
		[Embed(source = '../assets/levels/25.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL25:Class; // Dungeon 9 - Wall jump !
		[Embed(source = '../assets/levels/26.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL26:Class; // Dungeon 10 - getting d
		
		public static const LEVELS:Dictionary = new Dictionary();
		LEVELS[1] = LEVEL1;
		LEVELS[2] = LEVEL2;
		LEVELS[3] = LEVEL3;
		LEVELS[4] = LEVEL4;
		
		LEVELS[10] = LEVEL10;
		LEVELS[11] = LEVEL11;
		LEVELS[12] = LEVEL12;
		LEVELS[13] = LEVEL13;
		LEVELS[14] = LEVEL14;
		LEVELS[15] = LEVEL15;
		LEVELS[16] = LEVEL16;
		LEVELS[17] = LEVEL17;
		LEVELS[18] = LEVEL18;
		LEVELS[19] = LEVEL19;
		LEVELS[20] = LEVEL20;
		LEVELS[21] = LEVEL21;
		LEVELS[22] = LEVEL22;
		LEVELS[23] = LEVEL23;
		LEVELS[24] = LEVEL24;
		LEVELS[25] = LEVEL25;
		LEVELS[26] = LEVEL26;
		
		//tilesets
		[Embed(source = '../assets/sprites/tileset.png')] 
		public static const TILESET:Class;
		
		
		//player
		[Embed(source = '../assets/sprites/player.png')] 
		public static const PLAYER:Class;
		
		[Embed(source = '../assets/sprites/laserBeam.png')] 
		public static const LASERBEAM:Class;
		
		
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
		[Embed(source = '../assets/sprites/treasure.png')] 
		public static const OBJ_CHEST:Class;
		
		[Embed(source = '../assets/sprites/spikes1.png')] 
		public static const OBJ_SPIKES1:Class;
		[Embed(source = '../assets/sprites/spikes2.png')] 
		public static const OBJ_SPIKES2:Class;
		[Embed(source = '../assets/sprites/spikes3.png')] 
		public static const OBJ_SPIKES3:Class;
		[Embed(source = '../assets/sprites/spikes4.png')] 
		public static const OBJ_SPIKES4:Class;
		
		[Embed(source = '../assets/sprites/canon1.png')] 
		public static const OBJ_CANON1:Class;
		[Embed(source = '../assets/sprites/canon2.png')] 
		public static const OBJ_CANON2:Class;
		[Embed(source = '../assets/sprites/canon3.png')] 
		public static const OBJ_CANON3:Class;
		[Embed(source = '../assets/sprites/canon4.png')] 
		public static const OBJ_CANON4:Class;
		
		[Embed(source = '../assets/sprites/bullet.png')] 
		public static const OBJ_BULLET:Class;
		
		
		// NPC - Monsters
		[Embed(source = '../assets/sprites/grandpa.png')] 
		public static const GRANDPA:Class;
		[Embed(source = '../assets/sprites/oldman.png')] 
		public static const OLDMAN:Class;
		[Embed(source = '../assets/sprites/mob1.png')] 
		public static const MOB1:Class;
		[Embed(source = '../assets/sprites/mob2.png')] 
		public static const MOB2:Class;
		
		[Embed(source = '../assets/sprites/textPanel.png')] 
		public static const TEXT_PANEL:Class;
		
		[Embed(source = '../assets/sprites/grandpaTalk.png')] 
		public static const GRANDPA_TALK:Class;
		
		
		[Embed(source = '../assets/sprites/endScreen.png')] 
		public static const END_SCREEN:Class;
		
		
		
		
	}
}