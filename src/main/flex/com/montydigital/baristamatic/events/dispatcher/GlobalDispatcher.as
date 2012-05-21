package com.montydigital.baristamatic.events.dispatcher{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	public class GlobalDispatcher implements IDispatcher{
		
		private var logger:ILogger = Log.getLogger("com.montydigital.baristamatic.events.dispatcher.GlobalDispatcher");
		private var dispatcher:IEventDispatcher;
		
		
		public function addListener(type:String, callback:Function):void{
			if(!hasListener(type))
				dispatcher.addEventListener(type, callback);
			else
				logger.warn(type+" already has a listener");
		}
		
		public function removeListener(type:String, callback:Function):void{
			dispatcher.removeEventListener(type, callback);
		}
		
		public function hasListener(type:String):Boolean{
			return dispatcher.hasEventListener(type);
		}
		
		public function dispatch(event:DispatcherEvent):void{
			dispatcher.dispatchEvent(event);
		}

		
		private function init():void{
			dispatcher = new EventDispatcher();
		}	
		
		/* Singleton Implementation */
		private static var instance:GlobalDispatcher;
		public static function getInstance():GlobalDispatcher{
			if(!GlobalDispatcher.instance)
				GlobalDispatcher.instance = new GlobalDispatcher(new SingletonEnforcer());
			return GlobalDispatcher.instance
		}
		public function GlobalDispatcher(enforcer:SingletonEnforcer){
			if(!enforcer)
				throw new Error("This is a singleton, use the getInstance method!");
			else
				init();
		}
	}
}
class SingletonEnforcer{}