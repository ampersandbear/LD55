/// @description card init

if (type == noone) exit;

show_debug_message(type, card_data)

if (is_trinket) {
	name   = trinket_data[type].trinket_name;
	desc   = trinket_data[type].trinket_desc;
	sprite = trinket_data[type].trinket_sprite;
} else {
	name   = card_data[type].card_name;
	desc   = card_data[type].card_desc;
	color  = card_data[type].card_color;
	hp	   = card_data[type].card_hp;
	sprite = card_data[type].unit_sprite;
	hp_max = hp;
	ability_used = false;
	trinket_used = false;
}

lerp_x = x;
lerp_y = y;
drag_xstart = x;