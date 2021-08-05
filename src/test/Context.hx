package test;

import coconut.data.Model;

@:default(Context.DEFAULT)
class Context implements Model {
	@:constant var id:String;
	static public final DEFAULT = new Context({id: "default"});
}
