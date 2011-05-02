package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Dialog extends Entity
	{
		private var _textObject:Text; //text object
		private var displayString:String; //string that will be displayed
		public var text:String; //string to reveal letter by letter
		private var numChars:Number; //number of letters to show currently
		private var CHARACTERS_PER_SECOND:Number = 30;
		
		public var done:Boolean = false;
		
		public function Dialog(text:String="", x:Number=0, y:Number=0, centered:Boolean=false)
		{
			layer = 0;
			
			numChars = 0;
			displayString = new String("");
			this.text = new String(text);
			
			if (centered)
				this.x = x - FP.screen.width / 2 + 20;
			else
				this.x = x;
			this.y = y;
			
			var textOptions:Object = new Object();
			textOptions["size"] = 16;
			textOptions["wordWrap"] = true;
			textOptions["resizable"] = false;
			textOptions["width"] = FP.screen.width - 20;
			textOptions["height"] = 85;
			textOptions["color"] = 0x000000;
			textOptions["align"] = "left";
			
			_textObject = new Text("", 0, 0, textOptions);
			graphic = _textObject;
		}
		
		override public function update():void
		{
			displayString = text.substring(0, numChars);
			_textObject.text = displayString;
			numChars += CHARACTERS_PER_SECOND * FP.elapsed;
			
			if (numChars >= text.length)
				done = true;
			
			if (done && Input.pressed(Key.ANY))
			{
				FP.world.remove(this);
			}
			
			super.update();
		}
	}
}