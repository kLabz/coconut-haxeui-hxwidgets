package test.view;

import haxe.ui.components.Button;
import haxe.ui.containers.Box;
import haxe.ui.containers.TabView;

import tink.pure.Vector;

import test.data.Account;

class Accounts extends View {
	@:state var counter:Int = 0;
	@:loaded var accounts:Vector<Account> = db.Account.all().next(Vector.fromArray);

	function render() {
		return <switch {accounts}>
			<case {Done(accounts)}>
				<TabView percentWidth={100} percentHeight={100}>
					<for {account in accounts}>
						<Box key={account.id.toString()} text={account.name}>
							<AccountView account={account} />
						</Box>
					</for>

					<Box key="new-account" text="+">
						<Button />
					</Box>
				</TabView>
			<case {_}>
				<Box />
		</switch>;
	}
}
