package test;

import coconut.haxeui.Renderer;
import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;

import test.view.Accounts;

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
			Renderer.mount(root, <Accounts />);

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
