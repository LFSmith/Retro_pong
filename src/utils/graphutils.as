package utils 
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author l
	 */
	public class graphutils 
	{
		
		public function graphutils() 
		{
			throw(new Error("Class is not ment to be instaciated"));
		}
		
		static public var stageref:Sprite = null;
		static public  const numcodes:Array = [
		[
		1, 1, 1,
		1, 0, 1,
		1, 0, 1,
		1, 0, 1,
		1, 1, 1
		],
		[
		1,1,0,
		0,1,0,
		0,1,0,
		0,1,0,
		0,1,0
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
		
		static public function drawtext(aText:String,aColor:uint,aBlocksize:uint,aXpos:uint,aYpos:uint,aTarget:Sprite):void
		{
			
			
			aTarget.graphics.beginFill(aColor);
			aText=aText.toLowerCase();
			for (var c:uint=0; c < aText.length; c++ )
			{
				var currindex:uint = numcodes.length - 1;
				var currcharcode:uint = aText.charCodeAt(c);
				if (currcharcode > 47 && currcharcode < 58)
				{
						currindex = currcharcode-48;
				}
				
				else if (currcharcode > 96 && currcharcode < 122)
				{
						currindex = currcharcode-87;
				}
				else
				{
					continue;
				}
				
				for (var cy:int = 0; cy < 5;cy++ )
				{
					for (var cx:int=0; cx < 3;cx++ )
					{
						if (numcodes[currindex][cy*3+cx]>0)
							aTarget.graphics.drawRect( (aBlocksize*4*c)+ aXpos+ (cx) * aBlocksize, aYpos + cy * aBlocksize, aBlocksize, aBlocksize);
							
					}
				}
			}
			
			
			
			
		}
		
	
		
	}

}