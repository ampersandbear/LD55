///@description starting cards and units

/*with (card_create(card.SUPERHEAD, 100, 200)) {
	in_hand = true;
}
with (card_create(card.ATK, 200, 200)) {
	in_hand = true;
}*/

/*for (var i = 0; i < 7; i++) {
	with (card_create(card.ATK, card_xstart + i * card_width, 200)) {
		in_hand = true;
	}
}*/


card_create_on_start(__card.SUPERHEAD, 3);
card_create_on_start(__card.ATK, 2);
card_create_on_start(__card.MOVE, 4);


card_draw();
spawn_enemy();

/*
unit_create(__unit.PEASANT, 3, 1);
unit_create(__unit.AXEMAN, 4, 1);
unit_create(__unit.NECRO, 5, 1);
unit_create(__unit.SKELETON, 6, 1);