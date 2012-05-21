package com.montydigital.baristamatic.commands{
	
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IInventoryManager;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IManager;
	import com.montydigital.baristamatic.models.modelManagers.InventoryManager;
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.models.vo.inventory.InventoryVO;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeIngredientVO;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeVO;
	import com.montydigital.baristamatic.commands.interfaces.ICommand;
	
	public class RecipeAvailabilityCommand implements ICommand{
		
		private var inventoryManager:IInventoryManager;
		private var recipeManager:IManager;
		
		public function RecipeAvailabilityCommand(inventoryManager:IInventoryManager, recipeManager:IManager){
			this.inventoryManager = inventoryManager;
			this.recipeManager = recipeManager;
		}
		
		public function execute(event:DispatcherEvent):void{
			for each(var recipe:RecipeVO in this.recipeManager.list){
				recipe.available = true;
				for each(var ingredient:RecipeIngredientVO in recipe.ingredients){
					var inventory:InventoryVO = this.inventoryManager.getItemByName(ingredient.name) as InventoryVO;
					recipe.available = (!recipe.available || inventory.quantity < ingredient.count) ? false : true;
				}
			}
		}
	}
}