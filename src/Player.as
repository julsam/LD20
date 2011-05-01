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
	
	
	public class Player extends PhysicsEntity
	{		
		public var dead:Boolean = false;
		
		public var doubleJump:Boolean = false;
		
		public var cling:int = 0;
		public var clingDir:int = 1;
				
		public var sprite:Spritemap = new Spritemap(Assets.PLAYER, 16, 16); 
		
		public function Player(x:Number, y:Number)
		{	
			layer = -1;
			
			this.x = x;
			this.y = y;
			position = new Point(x, y);
			
			setHitbox(7, 16, -4, 0);			
			type = "Player";
			
			sprite.add("standRight", [0], 0, false);
			sprite.add("standLeft", [4], 0, false);
			sprite.add("runRight", [0, 1, 2, 3], 12, true);
			sprite.add("runLeft", [4, 5, 6, 7], 12, true);
			sprite.add("jumpUpRight", [8], 0, false);
			sprite.add("jumpUpLeft", [10], 0, false);
			sprite.add("jumpDownRight", [9], 0, false);
			sprite.add("jumpDownLeft", [11], 0, false);
			sprite.play("standRight");
			
			graphic = sprite;
		}
		
		override public function update():void
		{
			position.x = x;
			position.y = y;
			
			
			if (Input.check(Key.LEFT))
			{
				if (cling < 0)
				{
					velocity.x -= ACCELERATION.x * FP.elapsed;
				}
				sprite.play("runLeft");
				direction = -1;
			}
			else if (Input.check(Key.RIGHT))
			{
				if (cling < 0)
				{
					velocity.x += ACCELERATION.x * FP.elapsed;
				}
				sprite.play("runRight");
				direction = 1;
			}
			else
			{
				if (direction == 1)
					sprite.play("standRight");
				else
					sprite.play("standLeft");
				
				// friction
				if (onGround)
				{
					velocity.x = FP.approach(velocity.x, 0, FRICTION_GROUND * FP.elapsed);
				}
				else
				{
					velocity.x = FP.approach(velocity.x, 0, FRICTION_AIR * FP.elapsed);
				}
			}
			
			if (Input.pressed("Jump") && (onGround || cling > 0 || !doubleJump))
			{
				// jump
				velocity.y = -JUMP;
				
				if (!onGround)
				{
					// wall jump
					if (cling > 0)
					{
						velocity.x = clingDir * WALLJUMP;
						cling = -1;
					}				
						// double jump
					else if (cling < 0) 
					{
						doubleJump = true;
					}
				}
			}
			
			
			// PHYSICS
			super.update();
			
			
			// check for ground
			if (collide("Solid", position.x, position.y + 0.1))
			{
				onGround = true;
				doubleJump = false;
			}
			else
			{
				onGround = false;
				
				if (velocity.y < 0)
				{
					if (direction == 1)
						sprite.play("jumpUpRight");
					else
						sprite.play("jumpUpLeft");
				}
				else
				{
					if (direction == 1)
						sprite.play("jumpDownRight");
					else
						sprite.play("jumpDownLeft");					
				}
				
				// check for wall jump
				if (collide("Solid", position.x + 1, position.y) && Input.check(Key.RIGHT))
				{
					velocity.x = 0; // avoid strange behaviour that happen after a few jump /!\ testing it, maybe not the right solution
					cling = 10;
					clingDir = -1;
				}
				if (collide("Solid", position.x - 1, position.y) && Input.check(Key.LEFT))
				{
					velocity.x = 0; // avoid strange behaviour that happen after a few jump /!\ testing it, maybe not the right solution
					cling = 10;
					clingDir = 1;
				}				
			}
			
			//decrease how long we can cling to a wall for
			cling--;
			
			
			x = position.x;
			y = position.y;
		}
		
		public function kill():void
		{
			dead = true;
			Global.restartLevel = true;
		}
	}
}