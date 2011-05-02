package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Grandpa extends Entity
	{	
		private var dialogLoop:int = 0;
		public function Grandpa(x:int, y:int) 
		{
			super(x, y);
			
			layer = 0;
			graphic = new Image(Assets.GRANDPA);
			setHitbox(16, 16);
		}
		
		override public function update():void
		{
			if (collideWith(Global.player, x, y)) 
			{				
				if (Input.pressed("Interact"))
				{
					this.world.add(new DialogImage(50, 50, Assets.GRANDPA_TALK));
				}
			}
		}		
	}	
}