var _pool = ds_list_create();

// a card to choose:
for (var i = 0; i < 3; i++) {
		
	do {
		var _type = irandom_range(1, card_total_count - 1);
	} until (ds_list_find_index(_pool, _type) == -1);
		
	ds_list_add(_pool, _type);
	card_create(_type, 155 + i * 120, 70);
}
ds_list_destroy(_pool);

// trinket:
card_create(__trinket.DMG, 155 + 3 * 120, 70, true);

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
