enum card {
	SUPERHEAD,
	ATK,
	MOVE
}


function build_data(){
	
	show_debug_message("build_data")
	
	card_total_count = 0;
	card_data = [];
	
	card_add("Superhead", "Draws a card at the start of the turn", 1, c_purple);
	card_add("Headacher", "Deals [" + cc_red_string + "]2[spr_atk][/c] to the opposing enemy", 1, cc_red);
	card_add("Hypnohead", "When moved, moves the opposing enemy", 1, c_green);

}

function card_add(_name, _desc, _hp, _color) {
	
	var _i = card_total_count++;
	
	card_data[_i] = {
		card_id		: _i,
		card_hp		: _hp,
		card_name	: _name,
		card_desc	: _desc,
		card_color	: _color
	};
}