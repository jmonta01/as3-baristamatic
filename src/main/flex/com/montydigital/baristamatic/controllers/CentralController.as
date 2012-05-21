package com.montydigital.baristamatic.controllers{
	import com.montydigital.baristamatic.commands.interfaces.ICommand;
	import com.montydigital.baristamatic.events.dispatcher.GlobalDispatcher;
	import com.montydigital.baristamatic.events.dispatcherEvent.DispatcherEvent;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	
	public class CentralController{
		
		private var logger:ILogger = Log.getLogger("com.montydigital.baristamatic.controller.CentralController");
		private var commandHash:Dictionary;
		
		public function CentralController(){
			commandHash = new Dictionary();
		}
				
		public function addCommand(eventName:String, command:ICommand):void{
			if(!hasCommand(eventName)){
				commandHash[eventName] = command;
				GlobalDispatcher.getInstance().addListener(eventName, handleEvent);
			}else{
				logger.warn(eventName+" is already in the commandHash");
			}
		}
		
		public function removeCommand(eventName:String):void{
			if(hasCommand(eventName)){
				delete commandHash[eventName];
				GlobalDispatcher.getInstance().removeListener(eventName, handleEvent);
			}else{
				logger.warn(eventName+" is not in the commandHash");
			}
		}
		
		public function hasCommand(eventName:String):Boolean{
			return (commandHash[eventName] != null);
		}
		
		private function handleEvent(event:DispatcherEvent):void{
			var command:ICommand = commandHash[event.type] as ICommand;
			command.execute(event);
		}
	}
}