package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		[SWF(width="640",height="480")]
		public function Main():void 
		{
			//super(640, 480, 60, false);
			super(400, 300, 60, false);
			FP.screen.scale = 2;
			FP.screen.color = 0xa0d0f0;
			
		}
		
		override public function init():void
		{
			FP.world = new Game();
		}
		
	}
	
}