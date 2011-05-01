package
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	public class CheckPoint extends Entity
	{	
		public var id:Number;
		public var level:int;
		
		public function CheckPoint(x:Number, y:Number, nid:Number)
		{
			super(x, y);
			id = nid;
			
			setHitbox(32, 32);
		}
		
		override public function update():void 
		{
			if(Global.checkpointID != id && collideWith(Global.player, x, y))
			{
				Global.checkpointID = id;
				level = Math.floor(id);
			}
		}
	}
}