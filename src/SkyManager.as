package
{
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	
	public class SkyManager
	{
		public var _type:String;
		
		public function SkyManager(type:String="village_outdoor") 
		{
			_type = type;
			
			var skyY:int = FP.height - FP.getBitmap(Assets.BUSH1).height - 93 - 15;
			FP.world.add(new Parallax(0, skyY, 0, 0, new Backdrop(Assets.CLOUD3, true, false)));
			FP.world.add(new Parallax(0, 450, 4, 1, new Backdrop(Assets.CLOUD4, false, false)));
			FP.world.add(new Parallax(0, 0, 4, 0, new Backdrop(Assets.CLOUD5, true, false)));
			
			var bush2:Backdrop = new Backdrop(Assets.BUSH1, true, false);
			bush2.alpha = 0.8;
			FP.world.add(new Parallax(40, FP.height - FP.getBitmap(Assets.BUSH1).height, 3, 0, bush2));
			
			FP.world.add(new Parallax(160, FP.height - FP.getBitmap(Assets.BUSH1).height, 2, 0, new Backdrop(Assets.BUSH1, true, false)));
		}
	}
	
}