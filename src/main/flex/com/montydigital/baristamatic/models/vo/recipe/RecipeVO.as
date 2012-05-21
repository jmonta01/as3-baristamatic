package com.montydigital.baristamatic.models.vo.recipe{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.interfaces.IXmlIoValueObject;
	
	import mx.validators.IValidator;

	[Bindable]
	public class RecipeVO implements IValueObject, IXmlIoValueObject{

		private var _name:String;
		public function get name():String{return _name;}
		public function set name(val:String):void{_name = val}
		
		public var available:Boolean = false;		
		public var ingredients:Vector.<RecipeIngredientVO>;
		
		public function RecipeVO(){}

		public function fromXML(xml:XML):void{
			this.name = String(xml.name).toLowerCase();
			ingredients = new Vector.<RecipeIngredientVO>();
			var item:RecipeIngredientVO;
			for each(var ingXML:XML in xml.ingredients.children()){
				item = new RecipeIngredientVO();
				item.fromXML(ingXML);
				ingredients.push(item);
			}
		}
		
		public function toXML():XML{
			var data:XML = <recipe />
			data['name'] = this.name;
			var ingsXML:XML = <ingredients />;
			for each(var item:RecipeIngredientVO in this.ingredients){
				ingsXML.appendChild(item.toXML());
			}
			data['ingredients'] = ingsXML;
			return data;
		}
		
		public function copyValues(vo:IValueObject):void{
			var newVO:RecipeVO = vo  as RecipeVO;
			this.name = newVO.name;
			this.ingredients = ingredients;
		}

	}
}