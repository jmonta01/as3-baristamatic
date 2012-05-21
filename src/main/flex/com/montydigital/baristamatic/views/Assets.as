package com.montydigital.baristamatic.views{
	import flash.filters.DropShadowFilter;

	public class Assets{
		
		public static const buttonShadowBase:DropShadowFilter = new DropShadowFilter(2, 45, 0, .4, 4, 4);
		public static const buttonShadowDown:DropShadowFilter = new DropShadowFilter(2, 45, 0, .4, 4, 4, 1, 1, true);
		
		[Embed(source="assets/background.jpg")]
		[Bindable] public static var Background:Class;
		
		[Embed(source="assets/coffeeCup.png")]
		[Bindable] public static var CoffeeCup:Class;
	}
}