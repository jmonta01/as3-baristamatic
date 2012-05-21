package com.montydigital.baristamatic.models.modelManagers{
	import com.montydigital.baristamatic.models.io.interfaces.IIO;
	import com.montydigital.baristamatic.models.io.XmlIO;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.inventory.InventoryVO;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeIngredientVO;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IIOManager;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IInventoryManager;
	
	public class InventoryManager implements IIOManager, IInventoryManager{
		
		private var logger:ILogger = Log.getLogger("com.montydigital.baristamatic.controller.InventoryManager");
		
		private var _list:ArrayCollection;
		[Bindable]
		public function get list():ArrayCollection{ return _list; }
		public function set list(val:ArrayCollection):void{ _list = val; }
		
		private var _io:IIO;
		public function get io():IIO{ return _io; }
		public function set io(val:IIO):void{ _io = val; }
		
		public function InventoryManager(){
			this.io = new XmlIO(InventoryVO);
			list = new ArrayCollection();
		}		
		
		public function add(vo:IValueObject):void{
			list.addItem(vo);
		}
		
		public function update(vo:IValueObject):void{
			var oldVO:IValueObject = getItemByName(vo.name);
			oldVO.copyValues(vo);
			list.refresh();
		}
		
		public function remove(vo:IValueObject):void{
			list.removeItemAt(list.getItemIndex(vo));
		}	
		
		public function getItemByName(name:String):IValueObject{
			for each(var vo:IValueObject in this.list){
				if(vo.name == name)
					return vo;
			}
			return null;
		}
		
		public function removeStock(inventory:IValueObject, quantity:int):void{
			var inventoryItem:InventoryVO = getItemByName(inventory.name) as InventoryVO;
			if(inventoryItem){
				inventoryItem.quantity -= (inventoryItem.quantity - quantity >= 0) ? quantity : 0;
				this.list.refresh();
			}else{
				logger.warn(inventory.name+" was not found in the inventory list");
			}
		}
		
		public function restock():void{
			for each(var ingredient:InventoryVO in this.list){
				ingredient.quantity = ingredient.maxQuantity; 
			}
			this.list.refresh();
		}
	}
}