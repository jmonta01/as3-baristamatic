package com.montydigital.baristamatic.events.dispatcher
{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	

	public interface IDispatcher{
		function addListener(type:String, callback:Function):void;
		function removeListener(type:String, callback:Function):void;
		function hasListener(type:String):Boolean;
		function dispatch(event:DispatcherEvent):void;
	}
}