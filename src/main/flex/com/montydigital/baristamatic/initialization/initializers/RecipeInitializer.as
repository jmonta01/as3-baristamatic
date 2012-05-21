package com.montydigital.baristamatic.initialization.initializers{
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IIOManager;
	import com.montydigital.baristamatic.events.recipe.RecipeChangeEvent;
	import com.montydigital.baristamatic.events.recipe.RecipeInitEvent;
	import com.montydigital.baristamatic.initialization.events.InitializerEvent;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	
	public class RecipeInitializer extends AbstractInitializer implements IInitializer{
		
		private var manager:IIOManager;
		private var url:String;
		
		public function RecipeInitializer(manager:IIOManager, url:String){
			this.manager = manager;
			this.url = url;
			super("Recipe_Initializer");
		}
		
		override public function execute():void{
			this.manager.io.completed.addOnce(ioCompleted);
			this.manager.io.faulted.addOnce(ioFaulted);
			this.manager.io.importData(url);
		}
		
		private function ioCompleted(data:Vector.<IValueObject>):void{
			new RecipeChangeEvent(RecipeChangeEvent.ACTION_ADD, data).dispatch();
			super.onResult(null);
		}
		
		private function ioFaulted():void{
			super.onFault(null);
		}
	}
}