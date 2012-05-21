package com.montydigital.baristamatic.models.io.interfaces{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	
	import mx.collections.ArrayCollection;
	
	import org.osflash.signals.Signal;

	public interface IIO{
		function importData(url:String):void;
		function exportData(data:ArrayCollection):void;
		
		function get completed():Signal;
		function set completed(val:Signal):void;
		
		function get faulted():Signal;
		function set faulted(val:Signal):void;

	}
}