package com.montydigital.baristamatic.initialization.initializers{
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IIOManager;
	import com.montydigital.baristamatic.events.inventory.InventoryChangeEvent;
	import com.montydigital.baristamatic.events.inventory.InventoryInitEvent;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;

	public class InventoryInitializer extends AbstractInitializer implements IInitializer{
		
		private var manager:IIOManager;
		private var url:String;
		
		public function InventoryInitializer(manager:IIOManager, url:String){
			this.manager = manager;
			this.url = url;
			super("Inventory_Initializer");
		}
		
		override public function execute():void{
			this.manager.io.completed.addOnce(ioCompleted);
			this.manager.io.faulted.addOnce(ioFaulted);
			this.manager.io.importData(url);
		}
		
		private function ioCompleted(data:Vector.<IValueObject>):void{
			new InventoryChangeEvent(InventoryChangeEvent.ACTION_ADD, data).dispatch();
			super.onResult(null);
		}
		
		private function ioFaulted():void{
			super.onFault(null);
		}
	}
}