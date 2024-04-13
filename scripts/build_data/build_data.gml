enum card {
	SUPERHEAD,
	ATK,
	MOVE
}


function build_data(){
	
	show_debug_message("build_data")
	
	card_total_count = 0;
	card_data = [];
	
	card_add("Superhead", "Draws a card at the start of the turn", 1, cc_purple, spr_head_purple);
	card_add("Headacher", "Deals [" + cc_atk_string + "]2[spr_atk][/c] to the opposing enemy", 1, cc_red, spr_head_red);
	card_add("Hypnohead", "When moved, moves the opposing enemy", 1, cc_green, spr_head_green);

}

function card_add(_name, _desc, _hp, _color, _sprite) {
	
	var _i = card_total_count++;
	
	card_data[_i] = {
		card_id		: _i,
		card_hp		: _hp,
		card_name	: _name,
		card_desc	: _desc,
		card_color	: _color,
		unit_sprite : _sprite
	};
}