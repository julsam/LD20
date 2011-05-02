package
{	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class EndWorld extends World
	{
		
		override public function begin():void
		{
			// level size
			FP.width = 800;
			FP.height = 600;
			addGraphic(new Image(Assets.END_SCREEN));
		}
			
	}
	
}
