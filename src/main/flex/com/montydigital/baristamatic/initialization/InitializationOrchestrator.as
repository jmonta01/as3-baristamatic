package com.montydigital.baristamatic.initialization{
	import com.montydigital.baristamatic.events.dispatcher.GlobalDispatcher;
	import com.montydigital.baristamatic.initialization.events.InitializerEvent;
	import com.montydigital.baristamatic.initialization.initializers.RecipeInitializer;
	import com.montydigital.baristamatic.initialization.initializers.IInitializer;
	import com.montydigital.baristamatic.initialization.initializers.InventoryInitializer;
	
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	public class InitializationOrchestrator{
		
		private var logger:ILogger = Log.getLogger("com.montydigital.baristamatic.initialization.InitializationOrchestrator");
		
		private var queue:Array = [];	
		private var counter:int=0;
		
		private var initSuccessCallback:Function;
		
		
		public function InitializationOrchestrator(){}
		
		public function addInitializer(initializer:IInitializer):void{
			queue.push(initializer);	
		}
		
		public function run(initSuccessCallback:Function):void{
			if(queue.length > 0){
				this.initSuccessCallback = initSuccessCallback;
				addListeners();
				counter = 0;
				next();
			}
		}
		
		protected function next():void{
			if(counter < queue.length){
				var initializer:IInitializer = queue[counter];
				initializer.execute();
				counter+=1;
			}else{
				removeListeners();
				this.initSuccessCallback();
				this.initSuccessCallback = null;
				counter = 0;
			}
		}
		
		protected function onComplete(e:InitializerEvent):void{
			next();
		}
		
		protected function onFailed():void{
			removeListeners();
			logger.fatal("Initialization Failed");
		}
		
		private function addListeners():void{
			GlobalDispatcher.getInstance().addListener(InitializerEvent.INIT_SUCCESS, onComplete);
			GlobalDispatcher.getInstance().addListener(InitializerEvent.INIT_FAULT, onFailed);
		}
		
		private function removeListeners():void{
			GlobalDispatcher.getInstance().removeListener(InitializerEvent.INIT_SUCCESS, onComplete);
			GlobalDispatcher.getInstance().removeListener(InitializerEvent.INIT_FAULT, onFailed);
		}
	}
}