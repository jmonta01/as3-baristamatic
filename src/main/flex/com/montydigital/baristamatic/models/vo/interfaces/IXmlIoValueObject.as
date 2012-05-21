package com.montydigital.baristamatic.models.vo.interfaces{
	public interface IXmlIoValueObject{
		function fromXML(xml:XML):void;
		function toXML():XML;
	}
}