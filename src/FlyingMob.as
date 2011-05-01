package
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class FlyingMob extends Monster
	{
		public var sprite:Spritemap = new Spritemap(Assets.MOB1, 16, 16); 
		
		public function FlyingMob(x:Number, y:Number, a:Array, movSpeed:Number=25)
		{
			layer = -1;
			
			this.x = x;
			this.y = y;
			super(x, y, a, movSpeed);
			
			setHitbox(16, 16);
			
			sprite.add("walk", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 6, true);
			sprite.play("walk");
			
			graphic = sprite;
		}
	}
}