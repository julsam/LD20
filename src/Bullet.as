package
{
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Bullet extends Entity
	{
		public var sprite:Image;
		private var speed:uint = 100;
		private var dir:int;
		public var solid:String = "Solid";
		
		public function Bullet(x:int, y:int, direction:int = 0, spd:int = 100)
		{
			super(x, y);
			
			type = "Bullet";
			setHitbox(3, 3, -1, -1);
			
			dir = direction;
			speed = spd;
			
			graphic = new Image(Assets.OBJ_BULLET);
		}
		
		override public function update():void
		{
			switch(dir)
			{
				case 0:
					y -= FP.elapsed * speed;
					break;
				case 1:
					x += FP.elapsed * speed;
					break;
				case 2:
					y += FP.elapsed * speed;
					break;
				case 3:
					x -= FP.elapsed * speed;
					break;
			}
			
			if(collide(solid, x, y) && !Global.player.dead)
			{
				if(this) FP.world.remove(this);
			}
			else if(collideWith(Global.player, x, y))
			{
				// set the bullet to invisible (and not remove(this) beacause of an awkward bug)
				visible = false;
				Global.player.kill();
			}
			
			super.update();	
		}
	}
}