package  
{
	/**
	 * ...
	 * @author l
	 */
	public class controlrelay 
	{
		
		public function controlrelay() 
		{
			 
			 
		}
		
		private static var _pongref:pong;
		public  static var menue:buttonthingy;
		public  static var bmenue:bottommenue;
		private  static var _instance:controlrelay ;
		
		public static function get numplayers():uint
		{
			if (_pongref != null)
			{
				return _pongref.numplayers
			}
			return 0;
		}
		
		public static function get pongref():pong
		{
			if (_pongref == null)
				_pongref = new pong();
			return _pongref;
		}
		public static function initc():void
		{
			 _pongref = new pong();
			 menue= new buttonthingy();
			bmenue= new bottommenue();
		}
		
		
		
	}

}