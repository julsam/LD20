package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Parallax extends Entity
	{
		public var _parallaxSpeed:Number;
		public var _autoMove:int;
		
		public function Parallax(x:Number=0, y:Number=0, parallaxSpeed:Number=0, autoMove:int=0, graphic:Graphic=null)
		{
			layer = 10;
			super(x, y, graphic);
			_parallaxSpeed = parallaxSpeed;
			_autoMove = autoMove;
		}
		
		override public function update():void
		{	
			if (_autoMove > 0)
				x += _parallaxSpeed / 10.0;
			else if (_autoMove < 0)
				x -= _parallaxSpeed / 10.0;
			
			x += Global.camera.movedX * _parallaxSpeed / 10.0;
			
			super.update();
		}
	}
}