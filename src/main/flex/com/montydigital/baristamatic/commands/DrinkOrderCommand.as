package com.montydigital.baristamatic.commands{
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IInventoryManager;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IManager;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IOrderManager;
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.events.drinkOrder.DrinkOrderEvent;
	import com.montydigital.baristamatic.events.recipe.RecipeAvailabilityEvent;
	import com.montydigital.baristamatic.models.vo.drink.DrinkVO;
	import com.montydigital.baristamatic.models.vo.inventory.InventoryVO;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeIngredientVO;
	import com.montydigital.baristamatic.commands.interfaces.ICommand;
	
	public class DrinkOrderCommand implements ICommand{
		
		private var orderManager:IOrderManager
		private var inventoryManager:IInventoryManager;
		private var e:DrinkOrderEvent;
		
		public function DrinkOrderCommand(orderManager:IOrderManager, inventoryManager:IInventoryManager){
			this.orderManager = orderManager;
			this.inventoryManager = inventoryManager;
		}
		
		public function execute(event:DispatcherEvent):void{
			this.e = event as DrinkOrderEvent;
			
			var drink:DrinkVO = new DrinkVO(e.vo);
			var inventory:InventoryVO;
			for each(var recipeIngredientVO:RecipeIngredientVO in drink.recipeVO.ingredients){
				inventory = inventoryManager.getItemByName(recipeIngredientVO.name) as InventoryVO;
				drink.cost += (recipeIngredientVO.count * inventory.unitCost);
				inventoryManager.removeStock(inventory, recipeIngredientVO.count);
			}
			orderManager.order(drink);
			new RecipeAvailabilityEvent().dispatch();
		}
	}
}