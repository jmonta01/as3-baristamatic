package com.montydigital.baristamatic.models.vo.drink{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeVO;

	public interface IDrinkValueObject{
		function get recipeVO():RecipeVO;
		function set recipeVO(val:RecipeVO):void;
		
		function get cost():Number;
		function set cost(val:Number):void;
	}
}