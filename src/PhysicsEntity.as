package
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	public class PhysicsEntity extends Entity
	{
		public var velocity:Point = new Point(0, 0);
		public var position:Point = new Point(0, 0);
		
		public var direction:int = 1; // right : 1, left : -1
		
		public var onGround:Boolean = false;
				
		public const FRICTION_GROUND:int = 800;
		public const FRICTION_AIR:int = 400;
		public const MAXSPEED_GROUND:Point = new Point(80.0, 80.0);
		public const MAXSPEED_AIR:Point = new Point(80.0, 80.0);
		public var GRAVITY:int = 280;
		public const JUMP:Number = 145.0;
		public const WALLJUMP:Number = 160.0;
		public const ACCELERATION:Point = new Point(800, 800);
		
				
		public function PhysicsEntity()
		{
		}
		
		override public function update():void
		{
			applyGravity();
			
			applySpeed();
			
			motion();
		}
		
		public function applyGravity():void
		{
			// gravity
			velocity.y += GRAVITY * FP.elapsed;			
		}
		
		public function applySpeed():void
		{			
			var maxspeed:int = onGround ? MAXSPEED_GROUND.x : MAXSPEED_AIR.x;
			if (Math.abs(velocity.x) > maxspeed)
			{
				velocity.x = FP.sign(velocity.x) * maxspeed;
			}		
		}
		
		public function motion(mx:Boolean=true, my:Boolean=true):void
		{
			var col:Boolean = false;
			if (mx)
			{
				// move
				position.x += velocity.x * FP.elapsed;
				
				// collide
				col = false;
				while (collide("Solid", position.x, position.y - 0.1))
				{
					position.x -= FP.sign(velocity.x) / 10.0;
					col = true;
				}
				
				// stop motion on collision
				if (col)
				{
					velocity.x = 0;
				}
			}
			
			if (my)
			{
				// move
				position.y += velocity.y * FP.elapsed;
				
				// collide
				col = false;
				while (collide("Solid", position.x, position.y - 0.1))
				{
					position.y -= FP.sign(velocity.y) / 10.0;
					col = true;
				}
				
				// stop motion on collision
				if (col)
				{
					velocity.y = 0;
				}
			}
		}
		
	}
}