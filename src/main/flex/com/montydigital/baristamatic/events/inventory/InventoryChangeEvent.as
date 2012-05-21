package com.montydigital.baristamatic.events.inventory{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	
	public class InventoryChangeEvent extends DispatcherEvent{
		
		public static const CHANGE:String = "InventoryChange";
		
		public static const ACTION_ADD:String = "addInventory";
		public static const ACTION_REMOVE:String = "removeInventory";
		public static const ACTION_UPDATE:String = "updateInventory";
		public static const ACTION_RESTOCK:String = "restockInventory";
				
		public var action:String;
		public var data:Vector.<IValueObject>;
		
		public function InventoryChangeEvent(action:String, data:Vector.<IValueObject>=null){
			this.action = action;
			this.data = data;
			super(CHANGE);
		}
	}
}