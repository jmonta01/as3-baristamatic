package com.montydigital.baristamatic.models.modelManagers
{
	import com.montydigital.baristamatic.models.io.interfaces.IIO;
	import com.montydigital.baristamatic.models.io.XmlIO;
	import com.montydigital.baristamatic.models.vo.recipe.RecipeVO;
	import com.montydigital.baristamatic.models.vo.interfaces.IValueObject;
	
	import mx.collections.ArrayCollection;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IIOManager;
	import com.montydigital.baristamatic.models.modelManagers.interfaces.IManager;

	public class RecipeManager implements IIOManager, IManager{
		
		private var _list:ArrayCollection;
		[Bindable]
		public function get list():ArrayCollection{ return _list; }
		public function set list(val:ArrayCollection):void{ _list = val; }
		
		private var _io:IIO;
		public function get io():IIO{ return _io; }
		public function set io(val:IIO):void{ _io = val;}
		
		public function RecipeManager(){
			this.io = new XmlIO(RecipeVO);
			list = new ArrayCollection();
		}
		
		public function add(vo:IValueObject):void{
			list.addItem(vo);
		}
		
		public function update(vo:IValueObject):void{
			var oldVO:IValueObject = getItemByName(vo.name);
			oldVO.copyValues(vo);
			list.refresh();
		}
		
		public function remove(vo:IValueObject):void{
			list.removeItemAt(list.getItemIndex(vo));
		}	
		
		public function getItemByName(name:String):IValueObject{
			for each(var vo:IValueObject in this.list){
				if(vo.name == name)
					return vo;
			}
			return null;
		}
	}
}