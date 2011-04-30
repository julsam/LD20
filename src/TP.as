package 
{
	import net.flashpunk.Entity;
	
	public class TP extends Entity
	{
		public var _destination:int;
		
		public function TP(x:int, y:int, destination:int) 
		{
			_destination = destination;
			super(x, y);
			
			setHitbox(16, 16);
		}
		
		override public function update():void
		{			
			if (collideWith(Global.player, x, y)) {
				Global.changeLevel = true;
				Global.levelToLoad = _destination;
			}
		}
		
	}
	
}