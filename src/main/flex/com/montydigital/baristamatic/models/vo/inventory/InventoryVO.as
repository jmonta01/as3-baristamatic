package com.montydigital.baristamatic.models.vo.inventory{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.interfaces.IXmlIoValueObject;

	[Bindable]
	public class InventoryVO implements IValueObject, IXmlIoValueObject{
		
		private var _name:String;
		public function get name():String{return _name;}
		public function set name(val:String):void{_name = val}

		public var unitCost:Number;
		public var maxQuantity:int;
		public var quantity:int;
		
		public function InventoryVO(){}		
		
		public function fromXML(xml:XML):void{
			this.name = String(xml).toLowerCase();
			this.unitCost = Number(xml.@unit_cost);
			this.maxQuantity = int(xml.@max);
			this.quantity = int(xml.@quantity);
		}
		
		public function toXML():XML{
			var data:XML = <ingredient />
				data['name'] = this.name;
				data.@unit_cost = this.unitCost;
				data.@max = this.maxQuantity;
				data.@quantity = this.quantity;
			return data;
		}
		
		public function copyValues(vo:IValueObject):void{
			var newVO:InventoryVO = vo  as InventoryVO;
			this.name = newVO.name;
			this.unitCost = newVO.unitCost;
			this.maxQuantity = newVO.maxQuantity;
			this.quantity = newVO.quantity;
		}
	}
}