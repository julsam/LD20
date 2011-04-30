package  
{
	public class Global
	{		
		public static var
			time:int = 0,
			deaths:int = 0,
			
			firstLevel:Boolean = true,
			changeLevel:Boolean = false,
			previousLevel:int = 1,
			currentLevel:int = 1,
			levelToLoad:int,
			
			player:Player,
			camera:Camera,
			transition:Transition,
			skyMgr:SkyManager,
			
			jump:Boolean,
			doubleJump:Boolean,
			fire:Boolean,
			firePower:Boolean,
			climb:Boolean,
			lighter:Boolean;
		
		public static const grid:int = 16;
		
		public static const windowWidth:int = 800;
		public static const windowHeight:int = 600;
	}
	
}