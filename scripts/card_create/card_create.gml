function card_create(_type, _x, _y){
	var _card = instance_create_depth(_x, _y, -10, obj_card);
	_card.type = _type;
	return _card;
}