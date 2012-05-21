package com.montydigital.baristamatic.commands{
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IInventoryManager;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IManager;
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.events.inventory.InventoryChangeEvent;
	import com.montydigital.baristamatic.events.recipe.RecipeAvailabilityEvent;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.commands.interfaces.ICommand;
	
	public class InventoryChangeCommand implements ICommand{
	
		private var manager:IInventoryManager;
		private var e:InventoryChangeEvent;
		
		public function InventoryChangeCommand(manager:IInventoryManager){
			this.manager = manager;
		}
		
		public function execute(event:DispatcherEvent):void{
			e = event as InventoryChangeEvent;
			var method:Function;
			switch(this.e.action){
				case InventoryChangeEvent.ACTION_ADD:
					method = manager.add;
					break;
				case InventoryChangeEvent.ACTION_REMOVE:
					method = manager.remove;
					break;
				case InventoryChangeEvent.ACTION_UPDATE:
					method = manager.update;
					break;
				case InventoryChangeEvent.ACTION_RESTOCK:
					method = manager.restock;
					break;				
			}
			if(e.data && e.data.length > 0){
				for each(var vo:IValueObject in e.data){
					method(vo);
				}
			}else{
				method();
			}
			new RecipeAvailabilityEvent().dispatch();
		}
		
		
	}
}