package  
{
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
			skyMgr:SkyManager,
			
			jump:Boolean,
			doubleJump:Boolean,
			fire:Boolean,
			firePower:Boolean,
			fireSpeed:Boolean,
			climb:Boolean,
			lighter:Boolean,
			moveSpeed:Boolean;
		
		public static const grid:int = 16;
		
		public static const windowWidth:int = 800;
		public static const windowHeight:int = 600;
		
		
		public static const maxItems:int = 8;
	}
	
}