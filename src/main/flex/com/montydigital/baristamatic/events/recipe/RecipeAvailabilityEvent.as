package com.montydigital.baristamatic.events.recipe{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	
	public class RecipeAvailabilityEvent extends DispatcherEvent{
		
		public static var CHECK:String = "checkRecipeAvailability";
		
		public function RecipeAvailabilityEvent(){
			super(CHECK);
		}
	}
}