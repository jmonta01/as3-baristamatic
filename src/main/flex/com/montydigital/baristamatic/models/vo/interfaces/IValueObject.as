package com.montydigital.baristamatic.models.vo.interfaces{
	
	public interface IValueObject{
		function get name():String;
		function set name(val:String):void;
		
		function copyValues(vo:IValueObject):void;
	}
}