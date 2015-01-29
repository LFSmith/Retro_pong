package  
{
	import flash.display.Sprite;
	import flash.errors.DRMManagerError;
	import utils.graphutils;
	import flash.events.MouseEvent;
	import controlrelay;
	import Tone;
	/**
	 * ...
	 * @author l
	 */
	public class bottommenue extends Sprite
	{
		
		private var mentext:String = "menue";
		private var soundsym:Array = [
		0, 0, 1,
		0, 1, 1,
		1, 1, 1,
		0, 1, 1,
		0, 0, 1
		];

		
		public function bottommenue() 
		{
			addEventListener(MouseEvent.CLICK, onClick);
			this.y = 400;
			graphics.beginFill(0x0);
			graphics.drawRect(0, 0, 800, 60);
			graphutils.drawtext(mentext, 0xFFFFFF, 10, 5, 10, this);
			for (var cy:int = 0; cy < 5;cy++ )
				{
					for (var cx:int=0; cx < 3;cx++ )
					{
						if (soundsym[cy*3+cx]>0)
							graphics.drawRect( (10*4)+650+ (cx) * 10, cy * 10, 10, 10);
							
					}
				}
				drawtone();
			
			
		}
		private function drawtone():void
		{
			if (Tone.muted)
			{
				graphics.beginFill(0x0);
				graphics.drawRect(730, 0, 50, 50);
				graphics.endFill();
				
			}else
			{
				graphics.beginFill(0xFFFFFF);
				for (var c:int = 0; c < 5; c++ )
				{
					graphics.drawRect(c*10+730, (c+1)%2*10+10, 10,10);
				}
				graphics.endFill();
			}
		}
		private function onClick(e:MouseEvent):void 
		{
			if (mouseX < 10 * mentext.length*4)
			{
				controlrelay.pongref.showscore = false;
				if(controlrelay.numplayers>0)
					controlrelay.pongref.paused = true;
				controlrelay.menue.show();
			}else if ( mouseX>690)
			{
				Tone.muted = !Tone.muted;
				drawtone();
			}
		}
		
	}

}