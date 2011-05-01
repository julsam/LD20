package
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class Snake extends Monster
	{
		public var sprite:Spritemap = new Spritemap(Assets.MOB2, 16, 16); 
		
		public function Snake(x:Number, y:Number, a:Array, movSpeed:Number=25)
		{
			layer = -1;
			
			this.x = x;
			this.y = y;
			super(x, y, a, movSpeed);
			
			setHitbox(16, 16);
						
			sprite.add("walkRight", [0, 1, 2, 3], 8, true);
			sprite.add("walkLeft", [4, 5, 6, 7], 8, true);
			sprite.play("walkRight");
			
			graphic = sprite;			
		}
		
		override public function update():void
		{
			super.update();
			
			if (direction == 1)
				sprite.play("walkRight");
			else if(direction == -1)
				sprite.play("walkLeft");			
		}
	}
}