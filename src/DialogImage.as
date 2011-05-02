package
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;
	
	public class DialogImage extends Entity
	{	
		private var _textObject:Text;
		
		public function DialogImage(x:int, y:int, img:Class, text:String="") 
		{
			super(x, y);
			
			layer = 0;
			graphic = new Image(img);
			setHitbox(288, 141);
			
			if (text != "")
			{
				trace("dfd");
				var textOptions:Object = new Object();
				textOptions["size"] = 32;
				textOptions["wordWrap"] = true;
				textOptions["resizable"] = false;
				textOptions["width"] = 288;
				textOptions["height"] = 141;
				textOptions["color"] = 0x000000;
				textOptions["align"] = "left";
				
				_textObject = new Text("", 0, 0, textOptions);
				
				graphic = _textObject;
			}
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.ANY))
			{
				FP.world.remove(this);
			}
		}		
	}	
}