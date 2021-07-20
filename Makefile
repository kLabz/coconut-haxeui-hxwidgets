setup:
	haxelib newrepo

install: setup
	haxelib install --skip-dependencies --always install.hxml
