package  
{
	import flash.utils.Dictionary;

	public class Global
	{		
		public static var
			time:int = 0,
			deaths:int = 0,
			restartLevel:Boolean = false,
			
			firstLevel:Boolean = true,
			changeLevel:Boolean = false,
			previousLevel:int,
			currentLevel:int,
			levelToLoad:int,
			
			
			checkpointID:Number, // checkpoint
			
			player:Player,
			camera:Camera,
			transition:Transition,
			skyMgr:SkyManager;
						
			
		public static var abilities:Dictionary = new Dictionary();
		abilities["jump"] = false;
		abilities["doubleJump"] = false;
		abilities["laserGun"] = false;
		abilities["firePower"] = false;
		abilities["fireSpeed"] = false;
		abilities["wallJump"] = false;
		abilities["lighter"] = false;
		abilities["moveSpeed"] = false;
		
		public static const grid:int = 16;
		
		public static const windowWidth:int = 800;
		public static const windowHeight:int = 600;
		
		
		public static var abilitiesCount:int = 0;
		
		// number of chests to open in order to complete the game
		public static const maxItems:int = 5;
		
	}
	
}