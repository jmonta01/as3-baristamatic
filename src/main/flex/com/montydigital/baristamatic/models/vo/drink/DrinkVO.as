package com.montydigital.baristamatic.models.vo.drink{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.interfaces.IXmlIoValueObject;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeIngredientVO;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeVO;
	
	[Bindable]
	public class DrinkVO implements IDrinkValueObject, IXmlIoValueObject{
		
		private var _recipeVO:RecipeVO;
		public function get recipeVO():RecipeVO{return _recipeVO;}
		public function set recipeVO(val:RecipeVO):void{_recipeVO = val}

		private var _cost:Number;
		public function get cost():Number{ return _cost; }
		public function set cost(val:Number):void{ _cost = val; }
		
		public function DrinkVO(recipe:RecipeVO){
			this.recipeVO = recipe;
			this.cost = 0;
		}
	
		public function fromXML(xml:XML):void{}
		
		public function toXML():XML{
			var data:XML = <drink />
			data['recipeVO'] = this.recipeVO.toXML();
			data['cost'] = this.cost;
			return data;
		}
		
	}
}