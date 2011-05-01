package
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class Monster extends Entity
	{		
		public var speed:Point = new Point(0, 0);	
		
		public var direction:int = 1; // right : 1, left : -1
		protected var _movSpeed:Number; 
		
		private var previousX:Number; // used to know direction
		
		protected var _pathPoints:Array;
		protected var _nextPoint:Point;
		protected var _currentPath:uint;
		
		public function Monster(x:Number, y:Number, a:Array, movSpeed:Number=25)
		{
			previousX = x;
			super(x, y);
			
			_movSpeed = movSpeed;			
			
			_pathPoints = a;
			_currentPath = 0;
			_nextPoint = _pathPoints[_currentPath];
			_pathPoints.push(new Point(x, y));
			
			type = "Monster";
		}
		
		/**
		 * Move the platform to it next destination
		 */
		private function move():void
		{
			speed = new Point(_nextPoint.x - x, _nextPoint.y - y);
			speed.normalize(_movSpeed);
						
			previousX = x;
			
			x += speed.x * FP.elapsed;
			y += speed.y * FP.elapsed;
		}
		
		/**
		 * Check if the platform is arrived to his current destination
		 */
		private function destinationArrived():Boolean
		{
			if(Math.floor(x) == _nextPoint.x && Math.floor(y) == _nextPoint.y)
				return true;
			else
				return false;
		}
		
		/**
		 * Change destination by the next one on the list
		 */
		private function pickupNextDestination():void
		{
			_currentPath < _pathPoints.length - 1 ? _currentPath++ : _currentPath = 0;
			_nextPoint = _pathPoints[_currentPath];
		}
		
		override public function update():void 
		{
			
			if(destinationArrived())
				pickupNextDestination();
			
			move();	
						
			direction = x > previousX ? 1 : - 1;
			
			if(collide("Solid", x, y) && !Global.player.dead)
			{
				if(this) FP.world.remove(this);
			}
			else if(collideWith(Global.player, x, y))
			{
				// set the bullet to invisible (and not remove(this) because of an awkward bug)
				visible = false;
				Global.player.kill();
			}
		}
		
	}
}