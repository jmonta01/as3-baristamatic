package com.montydigital.baristamatic.models.io{
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	import com.montydigital.baristamatic.models.vo.interfaces.IXmlIoValueObject;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.osflash.signals.Signal;
	import com.montydigital.baristamatic.models.io.interfaces.IIO;

	public class XmlIO implements IIO{
	
		private var _completed:Signal = new Signal(Vector.<IValueObject>);
		public function get completed():Signal{return _completed; }
		public function set completed(val:Signal):void{_completed = val; }
		
		private var _faulted:Signal = new Signal();
		public function get faulted():Signal{return _faulted; }
		public function set faulted(val:Signal):void{_faulted = val; }
		
		
		private var logger:ILogger = Log.getLogger("com.montydigital.baristamatic.io.XmlIO");
		private var loader:URLLoader;
		private var voClass:Class;		
		
		public function XmlIO(voClass:Class){
			this.voClass = voClass;
			loader = new URLLoader();
		}		
		
		/*
			Import xml
		*/
		public function importData(url:String):void{
			addImportListeners();
			loader.load(new URLRequest(url));
			logger.info("Load: "+url);
		}
		private function onProgress(e:ProgressEvent):void{
				
		}
		private function onComplete(e:Event):void{
			removeImportListeners();
			var xmlData:XML = XML(this.loader.data);

			var importedData:Vector.<IValueObject> = new Vector.<IValueObject>();
			var vo:IXmlIoValueObject;
			for each(var item:XML in xmlData.children()){
				vo = new voClass();
				vo.fromXML(item);	
				importedData.push(vo);
			}
			this.completed.dispatch(importedData);
			logger.info("Load completed");
		}
		private function onFault(e:Event):void{
			removeImportListeners();
			this.faulted.dispatch();
			logger.fatal("Load Failed");
		}
		private function addImportListeners():void{
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onFault);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onFault);

		}
		private function removeImportListeners():void{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onFault);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onFault);
		}
		
		
		/*
			Export xml would be used to export a system wide report in XML
		*/
		public function exportData(data:ArrayCollection):void{
		}
		
	}
}