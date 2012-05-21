package com.montydigital.baristamatic.commands.interfaces{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;

	public interface ICommand{
		function execute(event:DispatcherEvent):void;
	}
}