function card_create_on_start(_type, _x){
	
	var _card = card_create(_type, card_xstart + _x * card_width, 200);
	_card.in_hand = true;
	_card.card_pos = _x;

	with (unit_create(_type, _x, 4)) {
		owner = _card;
		_card.unit = id;
	}
}