package com.montydigital.baristamatic.events.dispatcherEvent
{
	import com.montydigital.baristamatic.events.dispatcher.GlobalDispatcher;
	
	import flash.events.Event;
	
	public class DispatcherEvent extends Event implements IDispatcherEvent
	{
		public function DispatcherEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function dispatch():void{
			GlobalDispatcher.getInstance().dispatch(this);
		}
	}
}