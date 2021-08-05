package test.view;

import haxe.ui.containers.Box;
import haxe.ui.containers.TabView;
import haxe.ui.events.UIEvent;

import tink.pure.Vector;

import test.data.Account;

class Accounts extends View {
	@:state var activeTab:Int = 0;
	@:loaded var accounts:Vector<Account> = db.Account.all().next(Vector.fromArray);

	function render() {
		return <switch {accounts}>
			<case {Done(accounts)}>
				<TabView percentWidth={100} percentHeight={100} onChange={onChange}>
					<for {i => account in accounts}>
						<Box
							key={Std.string(i)}
							text={account.name}
							percentWidth={100}
							percentHeight={100}
						>
							<if {i == activeTab}>
								<AccountView account={account} />
							<else>
								<Box />
							</if>
						</Box>
					</for>
				</TabView>

			<case {_}>
				<Box />
		</switch>;
	}

	function onChange(e:UIEvent) {
		if (Std.isOfType(e.target, TabView)) {
			var target:TabView = cast e.target;
			activeTab = target.pageIndex;
		}
	}
}
