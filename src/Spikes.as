package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	public class Spikes extends Entity
	{		
		public var sprite:Image;
		
		public function Spikes(x:int, y:int, s:Class) 
		{
			sprite = new Image(s);
			super(x, y);
			
			graphic = sprite;
			mask = new Pixelmask(s);
			
			type = "Spikes";
		}
		
		
		override public function update():void
		{
			if (collideWith(Global.player, x, y)) 
			{	
				Global.player.kill();
			}
			
			super.update();
		}	
	}	
}