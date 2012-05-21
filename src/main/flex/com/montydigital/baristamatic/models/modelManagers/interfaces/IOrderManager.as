package com.montydigital.baristamatic.models.modelManagers.interfaces{
	import com.montydigital.baristamatic.models.vo.drink.IDrinkValueObject;

	public interface IOrderManager{
		function order(vo:IDrinkValueObject):void;
	}
}