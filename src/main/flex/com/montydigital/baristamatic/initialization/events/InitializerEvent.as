package com.montydigital.baristamatic.initialization.events{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	
	import flash.events.Event;
	
	public class InitializerEvent extends DispatcherEvent{
		
		public static const INIT_SUCCESS:String = "initializerSuccess";
		public static const INIT_FAULT:String = "initializerFault";
		
		public function InitializerEvent(type:String){
			super(type);
		}
	}
}