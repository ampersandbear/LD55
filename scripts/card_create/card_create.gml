function card_create(_type, _x, _y, _is_trinket = false){
	var _card = instance_create_depth(_x, _y, card_default_depth, obj_card);
	_card.type = _type;
	_card.is_trinket = _is_trinket;
	with (_card) event_user(10);
	return _card;
}