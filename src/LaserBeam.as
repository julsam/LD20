package
{
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class LaserBeam extends Entity
	{
		public var sprite:Image;
		private var speed:uint = 100;
		private var dir:int;
		public var solid:String = "Solid";
		
		public function LaserBeam(x:int, y:int, direction:int = 1, spd:int = 100)
		{
			super(x, y);
			
			type = "LaserBeam";
			setHitbox(10, 3);
			
			dir = direction;
			speed = spd;
			
			graphic = new Image(Assets.LASERBEAM);
		}
		
		override public function update():void
		{
			switch(dir)
			{
				case -1:
					x -= FP.elapsed * speed;
					break;
				case 1:
					x += FP.elapsed * speed;
					break;
			}
			
			var m:Monster = collide("Monster", x, y) as Monster;

			if(collide(solid, x, y) && !Global.player.dead)
			{
				if(this) FP.world.remove(this);
			}
			else if(m != null)
			{
				if (m._life > 1)
				{
					m._life--;
				}
				else
				{
					FP.world.remove(m);
				}
				
				if(this) FP.world.remove(this);
			}
			
			super.update();	
		}
	}
}