package
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	public class Cloud extends Entity
	{
		public var _dir:Number;
		
		public function Cloud(x:Number=0, y:Number=0, direction:Number=20)
		{
			super(x, y);
			
			_dir = direction;
			
			setHitbox(FP.getBitmap(Assets.CLOUD4).width, FP.getBitmap(Assets.CLOUD4).height);
			
			graphic = new Image(Assets.CLOUD4);
			layer = 9;
		}
		
		override public function update():void
		{	
			x += _dir * FP.elapsed;
			
			if (x > FP.width || x + width < -200)
				destroy();
		}
		
		public function destroy():void 
		{
			Global.skyMgr._cloudCount--;
			FP.world.remove(this); 
		}

	}
}