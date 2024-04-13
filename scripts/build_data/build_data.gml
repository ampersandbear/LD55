enum card {
	SUPERHEAD,
	ATK,
	MOVE
}


enum btn {
	END_TURN
}

function build_data(){
	
	trace("build_data")
	
	card_total_count = 0;
	card_data = [];
	
	card_add("Masterhead", "Draws a card at the start of the turn", 1, cc_purple, spr_head_purple, spr_neck_purple);
	card_add("Headacher", "Deals [" + cc_atk_string + "]2[spr_atk][/c] to the opposing enemy", 1, cc_red, spr_head_red, spr_neck_red);
	card_add("Hypnohead", "When moved, moves the opposing enemy", 1, cc_green, spr_head_green, spr_neck_green);

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