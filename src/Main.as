package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import utils.graphutils;
	
	/**
	 * ...
	 * @author l
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
		
			// entry point
			graphutils.stageref = this;
			//var relay:controlrelay = new controlrelay();
				
			controlrelay.initc();

			addChild(controlrelay.pongref);
			addChild(controlrelay.menue);
			addChild(controlrelay.bmenue);
			var stripy:Shape = new Shape();
			var stripepos:uint = 0;
			var pew:uint = 1;
			while (stripepos<460)
			{	
				stripy.graphics.beginFill(0x0);
				stripy.graphics.drawRect(0, stripepos, 800, 1);
				stripepos = stripepos + (pew * 2);

			}
		
			addChild(stripy);
		
		}
		
		
	
		
	}
	
}