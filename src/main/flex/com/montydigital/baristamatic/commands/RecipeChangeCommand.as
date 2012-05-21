package com.montydigital.baristamatic.commands{
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IManager;
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.events.recipe.RecipeAvailabilityEvent;
	import com.montydigital.baristamatic.events.recipe.RecipeChangeEvent;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.commands.interfaces.ICommand;
	
	public class RecipeChangeCommand implements ICommand{
	
		private var manager:IManager;
		private var e:RecipeChangeEvent;
		
		public function RecipeChangeCommand(manager:IManager){
			this.manager = manager;
		}
		
		public function execute(event:DispatcherEvent):void{
			this.e = event as RecipeChangeEvent;
			var method:Function;
			switch(this.e.action){
				case RecipeChangeEvent.ACTION_ADD:
					method = manager.add;
					break;
				case RecipeChangeEvent.ACTION_REMOVE:
					method = manager.remove;
					break;
				case RecipeChangeEvent.ACTION_UPDATE:
					method = manager.update;
					break;
			}
			for each(var vo:IValueObject in e.data){
				method(vo);
			}
			new RecipeAvailabilityEvent().dispatch();
		}
		
	}
}