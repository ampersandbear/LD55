enum card {
	SUPERHEAD,
	ATK
}


function build_data(){
	
	card_total_count = 0;
	card_data = [];
	
	card_add("Superhead", "Draws a card at the start of the turn", 1, c_purple);
	card_add("Headacher", "Deals 2[spr_attack] to the opposing enemy", 1, c_red);

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