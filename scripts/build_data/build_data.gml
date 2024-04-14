enum __card {
	SUPERHEAD,
	ATK,
	MOVE,
	BLOCK,
	QUICK,
	BUFF
}

enum __unit {
	PEASANT,
	KNIGHT,
	MAGE,
	ARCHER,
	AXEMAN,
	SPEARMAN,
	RAM,
	RAM_KNIGHT,
	NECRO,
	SKELETON
}


enum __btn {
	END_TURN
}

function build_data(){
	
	trace("build_data")
	
	randomize();
	unit_total_count = 0;
	card_total_count = 0;
	wave_total_count = 0;
	card_data = [];
	unit_data = [];
	wave_data = [];
	
	deck = ds_list_create(); 
	ds_list_add(deck, __card.ATK, __card.QUICK, __card.MOVE, __card.BUFF, __card.BLOCK);
	ds_list_shuffle(deck);
	
	repeat( 5) { wave_add(__unit.PEASANT, __unit.PEASANT, __unit.MAGE, __unit.KNIGHT);  }
	wave_add(__unit.PEASANT, __unit.KNIGHT, __unit.KNIGHT, __unit.MAGE, __unit.MAGE);
	
	card_add("Masterhead", "Draws a card every turn", 3, cc_purple, spr_head_purple, spr_neck_purple);
	card_add("Headacher", "Deals [" + cc_atk_string + "]1[spr_atk][/c] every turn", 1, cc_red, spr_head_red, spr_neck_red);
	card_add("Hypnohead", "When moved, moves the opposing enemy", 1, cc_green, spr_head_green, spr_neck_green);
	card_add("Ironhead", "Redirects damage from nearby heads to itself", 5, cc_gray, spr_head_gray, spr_neck_gray);
	card_add("Quickhead", "Deals [" + cc_atk_string + "]2[spr_atk][/c] when first placed", 2, cc_orange, spr_head_orange, spr_neck_orange);
	card_add("Hothead", "Nearby heads deal [" + cc_atk_string + "]1[spr_atk][/c] every turn", 1, cc_pink, spr_head_pink, spr_neck_pink);
	
	unit_add("Peasant", "", 1, 1, true, spr_peasant);
	unit_add("Knight", "", 2, 1, true, spr_knight);
	unit_add("Mage", "", 1, 1, false, spr_mage);
	unit_add("Archer", "", 1, 1, false, spr_archer);
	unit_add("Axeman", "", 2, 1, true, spr_axeman);
	unit_add("Spearman", "", 2, 1, true, spr_spearman);
	unit_add("Battering Ram", "", 1, 1, true, spr_ram);
	unit_add("Ram Carrier", "", 1, 1, true, spr_ram_knight);
	unit_add("Necromancer", "", 3, 1, false, spr_necro);
	unit_add("Skeleton", "", 1, 1, true, spr_skeleton);
}

function card_add(_name, _desc, _hp, _color, _sprite, _neck) {
	
	var _i = card_total_count++;
	
	card_data[_i] = {
		card_id		: _i,
		card_hp		: _hp,
		card_name	: _name,
		card_desc	: _desc,
		card_color	: _color,
		unit_sprite : _sprite,
		neck_sprite : _neck
	};
}

function unit_add(_name, _desc, _hp, _atk, _melee, _sprite){
	var _i = unit_total_count++;
	
	unit_data[_i] = {
		unit_id		: _i,
		unit_hp		: _hp,
		unit_atk	: _atk,
		unit_melee	: _melee,
		unit_name	: _name,
		unit_desc	: _desc,
		unit_sprite : _sprite
	};
}

function wave_add(){
	var _i = wave_total_count++;
	
	wave_data[_i] = ds_list_create(); 
	for (var _j = 0; _j < argument_count; _j++) ds_list_add(wave_data[_i], argument[_j]); 
	ds_list_shuffle(wave_data[_i]);
}