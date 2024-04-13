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


var _base = card_create(__card.SUPERHEAD, card_xstart + 3 * card_width, 200);
_base.in_hand = true;

with (unit_create(__card.SUPERHEAD, 3, 3)) {
	owner = _base;
	_base.unit = id;
}

card_draw();

unit_create(__unit.KNIGHT, 3, 1);

unit_create(__unit.MAGE, 3, 0);