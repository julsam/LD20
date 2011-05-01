package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Noel Berry
	 */
	public class Door extends Entity
	{
		public var sprite:Image = new Image(Assets.OBJ_DOOR);
		
		public function Door(x:int, y:int) 
		{
			super(x, y);
			
			layer = 0;
			graphic = sprite;
			setHitbox(32, 32);
		}
		
		override public function update():void
		{			
			//if we collide with the player...
			if (collideWith(Global.player, x, y)) 
			{				
				if (Input.pressed("Interact"))
				{
					trace("djfnhjd");
				}
			}
		}
		
	}
	
}