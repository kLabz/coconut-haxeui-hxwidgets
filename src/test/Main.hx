package test;

import coconut.data.Model;
import coconut.haxeui.Renderer;
import coconut.haxeui.View;
import coconut.ui.Implicit;
import haxe.ui.HaxeUIApp;
import haxe.ui.components.Button;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;

@:default(Context.DEFAULT)
class Context implements Model {
	@:constant var id:String;
	static public final DEFAULT = new Context({id: "default"});
}

class Main {
	static function main() {
		var app = new HaxeUIApp();

		app.ready(function() {
			fixTimers();

			var root = new Component();
			root.percentWidth = 100;
			root.percentHeight = 100;

			Screen.instance.title = "Test";
			Screen.instance.addComponent(root);
			Renderer.mount(root,
				<Implicit defaults={[
					Context => new Context({id: "test"})
				]}>
					<MyView />
				</Implicit>
			);

			app.start();
		});
	}

	static function fixTimers():Void {
		var blocked = true;
		haxe.Timer.delay(() -> blocked = false, 0);
		haxe.ui.util.Timer.delay(() -> {
			if (blocked) {
				function progress() {
					sys.thread.Thread.current().events.progress();
					haxe.ui.util.Timer.delay(progress, 1);
				}

				progress();
			}
		}, 100);

	}
}

class MyView extends View {
	@:state var counter:Int = 0;

	function render() {
		if (counter % 2 == 0)
			return <MyButton key={counter} onClick={() -> counter++} />;
		return <MyButton2 key={counter} onClick={() -> counter++} />;
	}
}

class MyButton extends View {
	@:implicit var context:Context;
	@:attribute var onClick:Void->Void;

	function new() {
		trace('new');
	}

	function render() {
		return <Button onClick={onClick} text={context.id} />;
	}
}

class MyButton2 extends View {
	@:implicit var context:Context;
	@:attribute var onClick:Void->Void;

	function new() {
		trace('new');
	}

	function render() {
		return <Button onClick={onClick} text={context.id} />;
	}
}
