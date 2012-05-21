package com.montydigital.baristamatic.events.drinkOrder{
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.models.vo.drink.DrinkVO;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeVO;
	
	public class DrinkOrderEvent extends DispatcherEvent{
		
		public static const ORDER:String = "orderDrink";
		public var vo:RecipeVO;
		
		public function DrinkOrderEvent(vo:RecipeVO){
			this.vo = vo;
			super(ORDER);
		}
	}
}