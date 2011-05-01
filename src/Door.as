package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Door extends Entity
	{		
		public var _destination:int;
		
		public function Door(x:int, y:int, destination:int) 
		{
			super(x, y);
			
			layer = 0;
			graphic = new Image(Assets.OBJ_DOOR);
			setHitbox(32, 32);
			
			_destination = destination;
		}
		
		override public function update():void
		{
			if (collideWith(Global.player, x, y)) 
			{				
				if (Input.pressed("Interact"))
				{
					Global.changeLevel = true;
					Global.levelToLoad = _destination;
				}
			}
		}
		
	}
	
}