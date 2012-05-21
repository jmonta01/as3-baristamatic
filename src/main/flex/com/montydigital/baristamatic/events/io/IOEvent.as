package com.montydigital.baristamatic.events.io{
	import flash.events.Event;
	
	public class IOEvent extends Event{
		
		public static const COMPLETE:String = "ioComplete";
		public static const FAULT:String = "ioFault";
		
		public function IOEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}