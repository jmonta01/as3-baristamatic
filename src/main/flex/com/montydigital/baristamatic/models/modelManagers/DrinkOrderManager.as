package com.montydigital.baristamatic.models.modelManagers{
	import com.montydigital.baristamatic.models.io.interfaces.IIO;
	import com.montydigital.baristamatic.models.io.XmlIO;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.drink.DrinkVO;
	import com.montydigital.baristamatic.models.vo.drink.IDrinkValueObject;
	
	import mx.collections.ArrayCollection;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IIOManager;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IOrderManager;
	
	public class DrinkOrderManager implements IOrderManager, IIOManager{

		private var _list:ArrayCollection;
		[Bindable]
		public function get list():ArrayCollection{ return _list; }
		public function set list(val:ArrayCollection):void{ _list = val; }
		
		[Bindable] public var totalSales:Number = 0;
		
		private var _io:IIO;
		public function get io():IIO{ return _io; }
		public function set io(val:IIO):void{ _io = val; }
		
		public function DrinkOrderManager(){
			this.io = new XmlIO(DrinkVO);
			list = new ArrayCollection();
		}
		
		public function order(vo:IDrinkValueObject):void{
			this.list.addItem(vo);
			totalSales += vo.cost;
		}

	}
}