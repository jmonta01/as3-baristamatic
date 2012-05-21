package com.montydigital.baristamatic.initialization.initializers{
	import com.montydigital.baristamatic.events.dispatcher.GlobalDispatcher;
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	import com.montydigital.baristamatic.initialization.events.InitializerEvent;
	
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	public class AbstractInitializer implements IInitializer{
		
		private var logger:ILogger = Log.getLogger("com.montydigital.baristamatic.initialization.initializers.AbstractInitializer");
		
		private var name:String;
		private var resultEvent:String;
		private var faultEvent:String;
		
		public function AbstractInitializer(name:String, resultEvent:String=null, faultName:String=null){
			this.name = name;
			
			this.resultEvent = resultEvent;
			if(this.resultEvent) GlobalDispatcher.getInstance().addListener(this.resultEvent, onResult);
			
			this.faultEvent = faultEvent;
			if(this.faultEvent) GlobalDispatcher.getInstance().addListener(this.faultEvent, onFault);
		}
		
		public function execute():void{
			logger.info(name+" Initialization Started");
			if(!resultEvent && !faultEvent)
				onResult(null);	
		}
		
		public function onResult(event:DispatcherEvent):void{
			logger.info(name+" Initialization Succeeded");
			new InitializerEvent(InitializerEvent.INIT_SUCCESS).dispatch();	
		}
		
		public function onFault(event:DispatcherEvent):void{
			logger.fatal(name+" Initialization Failed");
			new InitializerEvent(InitializerEvent.INIT_FAULT).dispatch();
		}
	}
}