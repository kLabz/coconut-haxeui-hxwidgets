package test.data;

import tink.sql.drivers.Sqlite;

class Database {
	public static var instance(get, null):Db;
	static function get_instance():Db {
		if (instance == null) {
			var sqlite = new Sqlite(db -> '$db.db');
			instance = new Db('data', sqlite);
		}

		return instance;
	}
}

@:tables(Account, Character)
class Db extends tink.sql.Database {}
