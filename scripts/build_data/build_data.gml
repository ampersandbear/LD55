enum __card {
	SUPERHEAD,
	ATK,
	MOVE
}

enum __unit {
	PEASANT,
	KNIGHT,
	MAGE
}


enum __btn {
	END_TURN
}

function build_data(){
	
	trace("build_data")
	
	unit_total_count = 0;
	card_total_count = 0;
	card_data = [];
	unit_data = [];
	
	card_add("Masterhead", "Draws a card at the start of the turn", 2, cc_purple, spr_head_purple, spr_neck_purple);
	card_add("Headacher", "Deals [" + cc_atk_string + "]1[spr_atk][/c] to the opposing enemy", 1, cc_red, spr_head_red, spr_neck_red);
	card_add("Hypnohead", "When moved, moves the opposing enemy", 1, cc_green, spr_head_green, spr_neck_green);
	
	unit_add("Peasant", "", 1, 1, true, spr_peasant);
	unit_add("Knight", "", 2, 1, true, spr_knight);
	unit_add("Mage", "", 1, 1, false, spr_mage);
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