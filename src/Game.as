package
{	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Game extends World
	{		
		override public function begin():void
		{
			Input.define("Left", Key.LEFT);
			Input.define("Right", Key.RIGHT);
			Input.define("Jump", Key.SPACE, Key.UP);
		}
		
		override public function update():void 
		{
			super.update();
		}		
	}
	
}
