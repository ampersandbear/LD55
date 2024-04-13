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


var _base = card_create(card.SUPERHEAD, card_xstart + 3 * card_width, 200);
_base.in_hand = true;

with (unit_create(card.SUPERHEAD, 3, 4)) {
	owner = _base;
}

card_draw();

//unit_create(card.MOVE, 4, 4);