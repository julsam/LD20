package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Canon extends Entity
	{
		public var sprite:Image;
		private var time:int = 0;
		private var bulletTime:int = 0;
		private var dir:int;
		private var bulletSpeed:int;
		
		public function Canon(x:int, y:int, s:Class, direction:int = 0, bulletTime_:Number = 2, spd:int = 100)
		{
			sprite = new Image(s);
			super(x, y);
			
			graphic = sprite;
			
			type = "Solid";
			setHitbox(16, 16);
			
			time = bulletTime = bulletTime_ * 60;
			dir = direction;
			bulletSpeed = spd;
		}
		
		override public function update():void
		{
			time ++; 
			if (time >= bulletTime) {
				// Spawn bullet.
				switch(dir)
				{
					// size of bullet = 5x5
					case 0:
						this.world.add(new Bullet(x + width/2, y - 5, dir, bulletSpeed));
						break;
					case 1:
						this.world.add(new Bullet(x + width + 2, y + height/2, dir, bulletSpeed));
						break;
					case 2:
						this.world.add(new Bullet(x + width/2, y + height, dir, bulletSpeed));
						break;
					case 3:
						this.world.add(new Bullet(x - 5, y + height/2, dir, bulletSpeed));
						break;
				}
				time = 0; // reset timer
			}
			super.update();	
		}
	}
}
