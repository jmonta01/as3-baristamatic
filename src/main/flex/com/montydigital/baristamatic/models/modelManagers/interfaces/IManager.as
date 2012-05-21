package com.montydigital.baristamatic.models.modelManagers.interfaces{
	import com.montydigital.baristamatic.models.io.interfaces.IIO;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	
	import mx.collections.ArrayCollection;

	public interface IManager{
		function add(vo:IValueObject):void;
		function remove(vo:IValueObject):void;
		function update(vo:IValueObject):void;
		
		function get list():ArrayCollection;
		function set list(val:ArrayCollection):void;

		function getItemByName(name:String):IValueObject;
	}
}