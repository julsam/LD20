package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	
	public class Transition extends Entity
	{
		public var alpha:Number = 0;
		public var done:Boolean = false;
		public var playing:Boolean = false;
		
		public function Transition() 
		{
			x = 0;
			y = 0;
			
			graphic = new Image(FP.buffer);
		}
		
		override public function render():void {
			Draw.rect(0, 0, FP.width, FP.height, 0x000000, alpha);
		}
		
		public function play():void
		{
			playing = true;			
			alpha += 3.0 * FP.elapsed;
			
			//if we're done, go to the next world
			if (Math.floor(alpha) == 1) { 
				done = true;
			}
		}
		
		public function reset():void
		{
			alpha = 0;			
			done = false;
			playing = false;
		}
	}
	
}