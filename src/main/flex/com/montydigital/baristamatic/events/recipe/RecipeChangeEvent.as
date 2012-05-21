package com.montydigital.baristamatic.events.recipe{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	
	public class RecipeChangeEvent extends DispatcherEvent{
		
		public static const CHANGE:String = "DrinkChange";
		
		public static const ACTION_ADD:String = "addInventory";
		public static const ACTION_REMOVE:String = "removeInventory";
		public static const ACTION_UPDATE:String = "updateInventory";
		
		public var action:String;
		public var data:Vector.<IValueObject>;
		
		public function RecipeChangeEvent(action:String, data:Vector.<IValueObject>=null){
			this.action = action;
			this.data = data;
			super(CHANGE);
		}

	}
}