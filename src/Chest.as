package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	public class Chest extends Entity
	{		
		public var _content:String;
		
		public function Chest(x:int, y:int, content:String) 
		{
			super(x, y);
			
			layer = 0;
			graphic = new Image(Assets.OBJ_CHEST);
			setHitbox(16, 16);
			
			_content = content;
		}
		
		override public function update():void
		{
			if (collideWith(Global.player, x, y)) 
			{
				if (Input.pressed("Interact") && !Global.abilities[_content])
				{
					var dial:Dialog = new Dialog("", Global.player.x - 50,  Global.player.y - 50, false);
					
					if (_content == "gold" && !Global.abilities["doubleJump"])
					{
						dial.text = "Got a lot of \n"+_content+"\nOne more chest\n to get";
					}
					else
					{
						Global.abilities[_content] = true;
										
						dial.text = "new ability : \n"+_content;
					}
					this.world.add(dial);
					
					Global.abilitiesCount++;
				}
			}
		}		
	}	
}