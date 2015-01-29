package  
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import utils.graphutils;
	import pong;
	import controlrelay;
	/**
	 * ...
	 * @author l
	 */
	public class buttonthingy extends Sprite
	{
		
		public function buttonthingy() 
		{
			
			addEventListener(MouseEvent.MOUSE_MOVE, onMousemove);
			addEventListener(MouseEvent.CLICK, onMouseclick);
			
			drawbtns();
			
			//this.width = 800;
			//this.x = 400 - (this.width / 2) - 10;
		}
		
		public function show():void 
		{
			drawbtns();
			this.visible = true;
		}
		
		
		private var btntexts:Array = ["1 Player", "2 Players"];
		private var igbtntexts:Array =["Continue","Reset"] ;
		private var ts:uint = 10;
		public var  selidx:uint=0;
		
		private function onMouseclick(e:MouseEvent):void 
		{
			if (controlrelay.numplayers>0)
			{
				switch(selidx)
				{
					case 0:
					
						controlrelay.pongref.showscore = true
						controlrelay.pongref.paused = false;
						hide();
						break;
					case 1:
						controlrelay. pongref.numplayers = 0;
						controlrelay.pongref.paused = false;
						controlrelay.pongref.showscore = false;
						show();
						break;
					case 2:
						break;
					
				}
			
				
			}
			else
			{
				switch(selidx)
				{
					case 0:
						controlrelay.pongref.numplayers = 1;
						controlrelay.pongref.showscore = true
						controlrelay.pongref.paused = false;
						break;
					case 1:
						controlrelay. pongref.numplayers = 2;
						controlrelay.pongref.paused = false;
						controlrelay.pongref.showscore = true;
						break;
					case 2:
						break;
					
				}
				hide();
			}
			
			
			
		}
		
		private function hide():void 
		{
			this.visible = false;
		}
		
		private function onMousemove(e:MouseEvent):void 
		{
			if (mouseY < 7 * ts * 1 + 120)
			{
				selidx = 0
			}else if(mouseY >7*ts*2+120)
			{
				selidx = 1;
			}else
			{
				selidx = 1;
			}
			drawbtns();
		}
		
		private function drawbtns():void 
		{
			graphics.clear();
			graphics.beginFill(0, 0);
			graphics.drawRect(0, 0, 800, 400);
			graphutils.drawtext("PO", 0xFFFFFF, ts,400-100 ,5, this);
			graphutils.drawtext("NG", 0xFFFFFF, ts, 400+20, 5, this);
			
			
			var c:int = 0;
	
			if (controlrelay.numplayers==0)
			{
				for each(var texty:String in btntexts)
				{
					
					graphutils.drawtext(texty, 0xFFFFFF, ts,400-(texty.length*20), 7 * ts * c+120, this);
					c++;
				}
			}
			else			
			{
				for each(var texty:String in igbtntexts )
				{

					graphutils.drawtext(texty, 0xFFFFFF, ts,400-(texty.length*20), 7 * ts * c+120, this);
					c++;
				}
			}
			
			graphics.drawRect(400-(5*40), 7 * ts * selidx + 120, 10, 50);	
			graphics.beginFill(0,0);
			graphics.drawRect(0, 0, width, height);
			
		}
		
		
	
		
	}

}