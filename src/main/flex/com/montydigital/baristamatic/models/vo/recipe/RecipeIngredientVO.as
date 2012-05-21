package com.montydigital.baristamatic.models.vo.recipe{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.interfaces.IXmlIoValueObject;
	
	public class RecipeIngredientVO implements IValueObject, IXmlIoValueObject{
		private var _name:String;
		public function get name():String{return _name;}
		public function set name(val:String):void{_name = val}
		
		public var count:int;
		
		public function RecipeIngredientVO(){}
		
		public function fromXML(xml:XML):void{
			this.name = String(xml).toLowerCase();
			this.count = int(xml.@units);
		}
		
		public function toXML():XML{
			var data:XML = <ingredient />
			data['name'] = this.name;
			data.@units = this.count;
			return data;
		}
		
		public function copyValues(vo:IValueObject):void{
			var newVO:RecipeIngredientVO = vo  as RecipeIngredientVO;
			this.name = newVO.name;
			this.count = count;
		}
	}
}