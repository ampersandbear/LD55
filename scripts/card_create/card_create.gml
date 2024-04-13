function card_create(_type, _x, _y){
	var _card = instance_create_depth(_x, _y, card_default_depth, obj_card);
	_card.type = _type;
	with (_card) event_user(10);
	return _card;
}