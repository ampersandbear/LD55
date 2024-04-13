/*with (card_create(card.SUPERHEAD, 100, 200)) {
	in_hand = true;
}
with (card_create(card.ATK, 200, 200)) {
	in_hand = true;
}*/

for (var i = 0; i < 7; i++) {
	with (card_create(card.ATK, card_xstart + i * card_width, 200)) {
		in_hand = true;
	}
}


//card_create(card.MOVE, 300, 100)

unit_create(card.SUPERHEAD, 3, 4);
unit_create(card.MOVE, 4, 4);