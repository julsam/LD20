package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Chest extends Entity
	{		
		public var _content:String;
		
		public function Chest(x:int, y:int, content:String) 
		{
			super(x, y);
			
			layer = 0;
			graphic = new Image(Assets.OBJ_CHEST);
			setHitbox(16, 16);
			
			_content = content;
		}
		
		override public function update():void
		{
			if (collideWith(Global.player, x, y)) 
			{				
				if (Input.pressed("Interact"))
				{
					trace("chest !");
				}
			}
		}		
	}	
}