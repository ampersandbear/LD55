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

// your deck:
card_create(__card.SUPERHEAD, 10, 250);

for (var i = 0; i < ds_list_size(deck); i++) {
	var _type = deck[| i];
	card_create(_type, 100 + i * 90, 250);
}
