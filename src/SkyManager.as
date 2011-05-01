package
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	
	public class SkyManager
	{
		public var _opt:Dictionary = new Dictionary();
		public var _cloudCount:uint = 0;
		
		public function SkyManager(opt:Dictionary=null) 
		{
			_opt["levelEnvironment"] = "village_outdoor";
			_opt["cloudBottomY"] = 399;
			_opt["bush1Y"] = 507;
			_opt["bush2Y"] = 507;
			_opt["bgcolor"] = 0xa0d0f0;
			
			if (opt != null)
			{
				for(var o:String in opt)
				{
					if (opt[o] != null)
					{
						_opt[o] = opt[o];
					}
				}
			}
			
			if (_opt["levelEnvironment"] == "village_outdoor" || _opt["levelEnvironment"] == "dungeon_outdoor")
			{
				trace("DISPLAY_CLOUDS");
				var skyY:int = FP.height - FP.getBitmap(Assets.BUSH1).height - 93 - 15;
				FP.world.add(new Parallax(0, _opt["cloudBottomY"], 0, 0, new Backdrop(Assets.CLOUD3, true, false)));
				
				FP.world.add(new Parallax(0, 0, 4, 0, new Backdrop(Assets.CLOUD5, true, false)));
				
				
				while (_cloudCount < 5)
				{
					FP.world.add(new Cloud(FP.rand(FP.width-30), FP.rand(FP.height-10), FP.clamp(FP.rand(28), 18, FP.rand(28))));
					_cloudCount++;
				}
				
				var bush2:Backdrop = new Backdrop(Assets.BUSH1, true, false);
				bush2.alpha = 0.8;
				FP.world.add(new Parallax(40, _opt["bush2Y"], 3, 0, bush2));
			
				FP.world.add(new Parallax(160, _opt["bush1Y"], 2, 0, new Backdrop(Assets.BUSH1, true, false)));
			}
			
			FP.screen.color = _opt["bgcolor"];
		}
		
		public function update():void
		{
			if (_cloudCount < 5 && (_opt["levelEnvironment"] == "village_outdoor" || _opt["levelEnvironment"] == "dungeon_outdoor"))
			{
				FP.world.add(new Cloud(-FP.getBitmap(Assets.CLOUD4).width, FP.rand(FP.height-10), FP.clamp(FP.rand(28), 18, FP.rand(28))));
				_cloudCount++;
			}
		}
	}
	
}