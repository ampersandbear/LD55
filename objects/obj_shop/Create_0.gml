var _pool = ds_list_create();
var _trinket_offset = 1000;
var _cx = 155;
var _cy = 70;

// a card to choose:
for (var i = 0; i < 3; i++) {
	
	var _trinket = false;
	if ((i == 2 && ((irandom(100) > 50 && global.wave > 0) || global.wave > 3)) || ds_list_size(deck) == 6) {
		_trinket = true;
	}
	
	do {
		var _range = _trinket ? trinket_total_count - 1 : card_total_count - 1;
		var _type = irandom_range(1, _range) + _trinket * _trinket_offset;
		
	} until (ds_list_find_index(_pool, _type) == -1);
		
	ds_list_add(_pool, _type);
	var _card = _type;
	if (_trinket) _card -= _trinket_offset;
	card_create(_card, _cx + i * 120, _cy, _trinket);
}
ds_list_destroy(_pool);


for (var i = -1; i < ds_list_size(deck); i++) {
	var _struct = deck[| i];
	var _type = (i < 0) ? __card.SUPERHEAD : _struct.type;
	var _card = card_create(_type, shop_deck_xstart + (i + 1) * card_width, shop_deck_ystart);
	_card.in_deck = true;
	_card.card_pos = (i + 1);
	
	var _trinkets = (i < 0) ? global.master_trinkets : _struct.trinkets;
	with (_card) apply_trinkets(_trinkets);
	
	if (i < 0) {
		_card.hp = global.master_hp;
		_card.hp_max = global.master_hp_max;
	}
}
