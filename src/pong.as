package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.events.KeyboardEvent;
	import utils.graphutils;
	
	/**
	 * ...
	 * @author l
	 */
	public class pong extends Sprite
	{
		var toney:Tone = new Tone(80);
		private static const tsize:uint = 10;
		private static const paddlewidth:uint =10 ;
		private static const paddleheight:uint = 50;
		private var fwidth:Number =800
		private var fheight:Number = 400;
		private var racketheight:Number = 10;
		private var ballsize:Number = 10;
	
		private var _showscore:Boolean = false;
		private var _numplayers:uint = 0;

		
		
		public function pong()
		{
			this.x = this.y = 0;
			addEventListener(Event.ADDED_TO_STAGE,onAdded)
			graphics.beginFill(0x0);
			graphics.drawRect(0, 0, fwidth, fheight);
			graphics.endFill();

			bxpos = (fwidth / 2) - (ballsize / 2);
			bypos = (fheight / 2) - (ballsize/2);
			
			addEventListener(Event.EXIT_FRAME,drawfield);
		}
		
	
		public function set numplayers(aVal:uint):void
		{
			scores[0] = 0;
			scores[1] = 0;
			
			_numplayers = aVal;
			drawfield();
		}
		public function get numplayers():uint
		{
			return _numplayers;
		}
		
		public function set showscore(aVal:Boolean):void
		{
			_showscore = aVal
			drawfield();
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			drawfield();
		}
		
		
		
		
		static public  const numcodes:Array = [
		[
		1, 1, 1,
		1, 0, 1,
		1, 0, 1,
		1, 0, 1,
		1, 1, 1
		],
		[
		1,0,0,
		1,0,0,
		1,0,0,
		1,0,0,
		1,0,0
		],
		[
		1, 1, 1,
		0, 0 ,1,
		1, 1, 1,
		1, 0, 0,
		1,1,1,1
		],
		[
		1, 1, 1,
		0, 0, 1,
		0, 1, 1,
		0, 0, 1,
		1, 1, 1
		],
		[
		1, 0, 1,
		1, 0, 1,
		1, 1, 1,
		0, 0, 1,
		0, 0, 1
		],
		[
		1, 1, 1,
		1, 0, 0,
		1, 1, 1,
		0, 0, 1,
		1, 1, 1
		],
		[
		1, 1, 1,
		1, 0, 0,
		1, 1, 1,
		1, 0, 1,
		1, 1, 1
		],
		[
		1, 1, 1,
		0, 0, 1,
		0, 0, 1,
		0, 0, 1,
		0, 0, 1
		],
		[
		1, 1, 1,
		1, 0, 1,
		1, 1, 1,
		1, 0, 1,
		1, 1, 1
		],
		[
		1, 1, 1,
		1, 0, 1,
		1, 1, 1,
		0, 0, 1,
		0, 0, 1
		],
		[

1,1,1,
1,0,1,
1,1,1,
1,0,1,
1,0,1
],
[
1,1,0,
1,0,1,
1,1,1,
1,0,1,
1,1,0,

],
[
1,1,1,
1,0,0,
1,0,0,
1,0,0,
1,1,1
],
[
1,1,0,
1,0,1,
1,0,1,
1,0,1,
1,1,0
],
[
1,1,1,
1,0,0,
1,1,1,
1,0,0,
1,1,1
],
[
1,1,1,
1,0,0,
1,1,0,
1,0,0,
1,0,0
],
[
1,1,1,
1,0,0,
1,0,0,
1,0,1,
1,1,1
],
[
1,0,1,
1,0,1,
1,1,1,
1,0,1,
1,0,1
],
[
0,1,0,
0,1,0,
0,1,0,
0,1,0,
0,1,0
],
[
0,0,1,
0,0,1,
0,0,1,
1,0,1,
1,1,1
],
[
1,0,1,
1,1,0,
1,1,0,
1,1,0,
1,0,1
],
[
1,0,0,
1,0,0,
1,0,0,
1,0,0,
1,1,1
],
[
1,0,1,
1,1,1,
1,0,1,
1,0,1,
1,0,1
],
[
1,1,1,
1,0,1,
1,0,1,
1,0,1,
1,0,1
],
[
1,1,1,
1,1,1,
1,0,1,
1,1,1,
1,1,1
],
[
1,1,1,
1,0,1,
1,1,1,
1,0,0,
1,0,0
],
[
1,1,1,
1,1,1,
1,0,1,
1,1,1,
1,1,0
],
[
1,1,1,
1,0,1,
1,1,0,
1,0,1,
1,0,1
],
[
1,1,1,
1,0,0,
1,1,1,
0,0,1,
1,1,1,
],
[
1,1,1,
0,1,0,
0,1,0,
0,1,0,
0,1,0
],
[
1,0,1,
1,0,1,
1,0,1,
1,0,1,
1,1,1
],
[
1,0,1,
1,0,1,
1,0,1,
1,0,1,
0,1,0
],
[
1,0,1,
1,0,1,
1,0,1,
1,1,1,
1,0,1
],
[
1,0,1,
1,0,1,
0,1,0,
1,0,1,
1,0,1
],
[
1,0,1,
1,0,1,
1,1,1,
0,1,0,
0,1,0
],
[
1,1,1,
0,0,1,
0,1,0,
1,0,0,
1,1,1
],


[
0,1,0,
0,1,0,
0,1,0,
0,0,0,
0,1,0
]
,
[
1,1,1,
0,0,1,
0,1,0,
0,0,0,
0,1,0
],
[
0,0,0,
0,1,0,
0,0,0,
0,1,0,
0,0,0
],
[
0,0,0,
0,0,0,
1,1,1,
0,0,0,
0,0,0,
],
[
0,0,0,
0,0,0,
0,0,0,
0,0,0,
1,1,1

],
[
0,0,0,
1,1,1,
0,0,0,
1,1,1,
0,0,0,
0,0,0
]
,
[
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,1,0,
]
];
		
		
		
		private function onKey(e:KeyboardEvent):void 
		{
		
			switch(e.keyCode)
			{
				case 37:
				case 40:
				 //p2down
				 if(_numplayers>0)
					p2dir = 1
				break;
				case 38:
				case 39:
					if(_numplayers>0)
						p2dir = -1;
				 //p2up
				 break;

				case 83:
				case 65:
				//p1down
				if(_numplayers>1)
					p1dir = 1
				break;
				case 87:
				case 68:
				//p1up
				if(_numplayers>1)
					p1dir = -1;
				break;
			}
			
		}
		
		public var paused:Boolean = false;
		private var basespeed:uint = 5;
		private var paddlespeed:Number=5
		private var xspeed:Number = -1;
		private var yspeed:Number = 1;
		private var bxpos:Number = 0;
		private var bypos:Number = 0;
		private var p1pos:Number = 0;
		private var p2pos:Number = 0;
		private var p1score:Number = 0;
		private var p2score:Number = 0;
		private var p1dir:Number = 0;
		private var p2dir:Number = 0;
		private var running:Boolean = true;
		private var scores:Array = [0, 0];
		private var inrement:Number = 0.2
		private var lcd:uint = 30;
		
		private function drawfield(e:Event=null):void 
		{
			if (paused)
				return;
			graphics.clear();
			
			if (_numplayers < 2)
			{
				if (bypos < p1pos+5&&xspeed<0)
				{
					p1dir=-1
				}
				else
				{
					p1dir = 1
				}
				
				if (_numplayers<1)
				{
					if (lcd == 0)
					{
					if (bypos < p2pos)
					{
						p2dir=-1
					}
					else
					{
						p2dir = 1
					}
					lcd = 10
					}
					lcd--;
				}
				
			}
			graphics.beginFill(0x0);
			graphics.drawRect(0, 0, fwidth, fheight);
			
			graphics.beginFill(0xFFFFFF);

			//calcs		bxpos = bxpos + xspeed;
			bypos = bypos + yspeed*basespeed;
			bxpos = bxpos + xspeed * basespeed;
			
			p1pos = p1pos + (p1dir * paddlespeed);
			p2pos = p2pos + (p2dir * paddlespeed);
			
			
			if ( (bypos + ballsize) > fheight || (bypos - ballsize < 0)  )
			{
				toney.frequency = 250;
				toney.play();
				yspeed = yspeed * -1
			}
			
			
			
			//menue bounce lol
			if (controlrelay.menue.visible) 
			{
			
				if( ( ( (xspeed < 0) && bxpos+(xspeed*basespeed) <=200   ) &&bxpos>200  ||    (  (xspeed > 0) && bxpos + (xspeed * basespeed) >= 200  &&bxpos<200 )        )  && bypos>(70 *controlrelay.menue.selidx+ 120 )&& bypos<(70 *controlrelay.menue.selidx+ 170 )   )
				{
					xspeed = xspeed * -1;
					bxpos = bxpos + xspeed * basespeed + 3;
					toney.frequency = 200;
					toney.play();
				}
				
			}
			
			if (bxpos<11)
			{
				if (bypos>=p1pos&&(bypos+ballsize)<(p1pos+paddleheight) )
				{
					if(basespeed<10)
						basespeed = basespeed + 1;
					xspeed = xspeed * -1
					var incr:Number = paddleheight / 3;
					if (bypos < p1pos + incr)
					{
						yspeed = 1;
					}else if (bypos > p1pos + (2 * incr))
					{
						yspeed = -1;
					}else
					{
						yspeed = 0;
					}
						toney.frequency = 200;
						toney.play();
				}
				else
				{
					basespeed = 5;
					bxpos = (fwidth / 2) - (ballsize / 2);
					bypos = (fheight / 2) - (ballsize/2);
					if (scores[1] < 99)
						scores[1]++;
						toney.frequency = 500;
						toney.play();
				}

			}else if (bxpos+ballsize>fwidth-11 )
			{
				if (bypos>=p2pos&&(bypos+ballsize)<(p2pos+paddleheight))
				{
					if(basespeed<10)
						basespeed = basespeed +1;
					xspeed = xspeed * -1;
					var incr:Number = paddleheight / 3;
					if (bypos < p2pos + incr)
					{
						yspeed = 1;
					}else if (bypos > p2pos + (2 * incr))
					{
						yspeed = -1;
					}else
					{
						yspeed = 0;
					}
						toney.frequency = 200;
						toney.play();
				}
				else
				{
					bxpos = (fwidth / 2) - (ballsize / 2);
					bypos = (fheight / 2) - (ballsize/2);
					if(scores[0]<99)
						scores[0]++;
						basespeed = 5;
						toney.frequency = 500;
						toney.play();
				}
			}
				
	
			
			//drawball
			graphics.drawRect(bxpos, bypos, ballsize, ballsize);

			//drawplayers
		
			if (p1pos < 0)
				p1pos = 0
			if (p2pos < 0)
				p2pos = 0;
			if ( (p1pos + 50) > fheight)
			{
				p1pos = fheight - 50;
			}
			
			if ( (p2pos + 50) > fheight)
			{
				p2pos = fheight - 50;
			}
				
			graphics.drawRect(1, p1pos, 10, 50);
			graphics.drawRect(fwidth-11, p2pos, 10, 50);
			
			//drawfieldline
			
			var ly:int = fheight;
			var lx:Number=(fwidth/2)-4
			while (ly > 0)
			{
				graphics.drawRect(lx, ly, 6, 8);
				ly = ly - 12;
			}
			//drawscore
			var tpos1:uint = fwidth / 2 - (tsize * 5);
			var tpos2:uint = tpos1 -(tsize * 5)  ;
		
			for (var c :int = 0; c < 2; c++ )
			{
				var val0:uint = scores[c] %10;
				var val1:uint =  scores[c] / 10;;
			
				if (val0 > 9)
					val0 = 9;
				if (val1 > 9)
					val1=9
				if (_showscore)
				{
					graphutils.drawtext(val0.toString(), 0xFFFFFF, tsize, tpos1, 5, this);
					graphutils.drawtext(val1.toString(), 0xFFFFFF, tsize, tpos2, 5, this);
				}

				tpos2 = (fwidth / 2) + (tsize * 2);
				tpos1 = tpos2 +(tsize * 5)  ;
			}
		

			graphics.endFill();
			
			
		}
	
	}

}