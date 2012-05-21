package com.montydigital.baristamatic.models.modelManagers.interfaces{
	import com.montydigital.baristamatic.models.io.interfaces.IIO;
	
	import mx.collections.ArrayCollection;

	public interface IIOManager{
		function get io():IIO;
		function set io(val:IIO):void;
	}
}