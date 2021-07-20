package test.view;

import tink.pure.Vector;
import haxe.ui.components.Button;
import haxe.ui.containers.HBox;

import test.data.Account;
import test.data.Character;

class AccountView extends View {
	@:attribute var account:Account;
	@:loaded var characters:Vector<Character> =
		db.Character
			.where(Character.accountId == account.id)
			.all()
			.next(Vector.fromArray);

	function render() {
		return <HBox>
			<switch {characters}>
				<case {Done(characters)}>
					<for {character in characters}>
						<Button key={character.id.toString()} text={character.name} />
					</for>
				<case {_}>
			</switch>
		</HBox>;
	}
}
