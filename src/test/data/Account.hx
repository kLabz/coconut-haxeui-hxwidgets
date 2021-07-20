package test.data;

typedef Account = {
	final id:Id<Account>;
	@:unique final name:VarChar<255>;
}
