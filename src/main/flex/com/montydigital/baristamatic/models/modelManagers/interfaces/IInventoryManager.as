package com.montydigital.baristamatic.models.modelManagers.interfaces{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeIngredientVO;

	public interface IInventoryManager extends IManager{
		function removeStock(name:IValueObject, quantity:int):void;
		function restock():void;
	}
}