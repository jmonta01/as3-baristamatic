package com.montydigital.baristamatic.events.inventory{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	
	public class InventoryInitEvent extends DispatcherEvent{
		
		public static const INIT_SUCCESS:String = "InventoryInitSuccess";
		public static const INIT_FAULT:String = "InventoryInitFault";
		
		public function InventoryInitEvent(type:String){
			super(type);
		}
	}
}