package com.montydigital.baristamatic.events.recipe{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	
	public class RecipeInitEvent extends DispatcherEvent{
		
		public static const INIT_SUCCESS:String = "DrinksInitSuccess";
		public static const INIT_FAULT:String = "DrinksInitFault";
		
		public function RecipeInitEvent(type:String){
			super(type);
		}
	}
}